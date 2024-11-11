using Microsoft.AspNetCore.Components;
using NoteClusterWebApp.Components.Layout;
using NoteClusterWebApp.Models;
using NoteClusterWebApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Components.PageModels
{
    public class TaskPageModel : BasePageModel
    {
        protected List<TaskItem> TaskItems = new List<TaskItem>();

        protected List<Category> Categories = new List<Category>();

        protected string Error = string.Empty;

        protected override Task OnInitializedAsync()
        {
            UpdateTitle?.Invoke("Tasks");
            GetData();
            return base.OnInitializedAsync();
        }

        async void GetData()
        {
            TaskItems = await ClusterDatabase.GetTaskItemsWithCategoryAsync();
            TaskItems = TaskItems
                .OrderBy(t => t.IsArchived)             // Place les tâches non archivées en premier
                .ThenBy(t => t.IsCompleted)             // Ensuite, les non complétées
                .ThenBy(t => t.Priority)
                .ToList();
            Categories = await ClusterDatabase.GetCategoriesAsync();
            StateHasChanged();
        }

        protected async Task OnFilter(int value)
        {
            try
            {
                switch (value)
                {
                    case 0:
                        TaskItems = await ClusterDatabase.GetTaskItemsWithCategoryAsync();
                        TaskItems = TaskItems
                .OrderBy(t => t.IsArchived)             // Place les tâches non archivées en premier
                .ThenBy(t => t.IsCompleted)             // Ensuite, les non complétées
                .ThenBy(t => t.Priority)
                .ToList();
                        break;
                    case 1:
                        TaskItems = await ClusterDatabase.GetTasksCompleted(false);
                        break;
                    case 2:
                        TaskItems = await ClusterDatabase.GetTasksCompleted(true);
                        break;
                    case 3:
                        TaskItems = await ClusterDatabase.GetTasksArchived(true);
                        break;
                    default:
                        TaskItems = await ClusterDatabase.GetTaskItemsWithCategoryAsync();
                        TaskItems = TaskItems
                .OrderBy(t => t.IsArchived)             // Place les tâches non archivées en premier
                .ThenBy(t => t.IsCompleted)             // Ensuite, les non complétées
                .ThenBy(t => t.Priority)
                .ToList();
                        break;
                }

                StateHasChanged();
            }
            catch (Exception e)
            {
                // Log or handle the exception as needed
            }
        }

        protected async void OnChangeState(bool state, TaskItem item)
        {
            item.IsCompleted = state;
            await ClusterDatabase.SaveTaskAsync(item);
            TaskItems = TaskItems
                .OrderBy(t => t.IsArchived)             // Place les tâches non archivées en premier
                .ThenBy(t => t.IsCompleted)             // Ensuite, les non complétées
                .ThenBy(t => t.Priority)
                .ToList();
            StateHasChanged();
        }

        protected async void OnCategories(int id)
        {
            if (id.Equals(0))
            {
                TaskItems = await ClusterDatabase.GetTaskItemsWithCategoryAsync();
                TaskItems = TaskItems
                .OrderBy(t => t.IsArchived)             // Place les tâches non archivées en premier
                .ThenBy(t => t.IsCompleted)             // Ensuite, les non complétées
                .ThenBy(t => t.Priority)
                .ToList();
            }
            else
            {
                TaskItems = await ClusterDatabase.GetTaskItemsWithCategoryAsync(id);
                TaskItems = TaskItems
               .OrderBy(t => t.IsArchived)             // Place les tâches non archivées en premier
                .ThenBy(t => t.IsCompleted)             // Ensuite, les non complétées
                .ThenBy(t => t.Priority)
                .ToList();
            }

            StateHasChanged();
        }

        protected async void SearchTask(ChangeEventArgs e)
        {
            string text = e.Value.ToString();

            if (!string.IsNullOrEmpty(text))
                TaskItems = await ClusterDatabase.GetTaskItemsByTitleAsync(text);
            else
                TaskItems = await ClusterDatabase.GetTaskItemsWithCategoryAsync();

            TaskItems = TaskItems
                .OrderBy(t => t.IsArchived)             // Place les tâches non archivées en premier
                .ThenBy(t => t.IsCompleted)             // Ensuite, les non complétées
                .ThenBy(t => t.Priority)
                .ToList();
            StateHasChanged();
        }
    }
}
