using Microsoft.AspNetCore.Components;
using NoteClusterWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Components.PageModels
{
    public class TaskFormPageModel : BasePageModel
    {
        [Parameter]
        public int Id { get; set; }
        protected List<Category> Categories { get; set; } = new();
        protected TaskItem TaskItem { get; set; } = new();
        protected string Error { get; set; } = string.Empty;


        protected override Task OnInitializedAsync()
        {
            UpdateTitle?.Invoke("Task Form");
            GetData();
            return base.OnInitializedAsync();
        }

        async void GetData()
        {
            Categories = await ClusterDatabase.GetCategoriesAsync();
            TaskItem.CategoryId = Categories[0].Id;
            if (Id != 0)
                TaskItem = await ClusterDatabase.GetTaskItemByIdWithCategoryAsync(Id);
            Error = string.Empty;

            StateHasChanged();
        }

        protected async void SaveTask()
        {
            if (string.IsNullOrEmpty(TaskItem.Title) ||
               TaskItem.CategoryId == 0)
            {
                Error = "Please, fill the fields";
                StateHasChanged();
                return;
            }

            TaskItem.DateModified = DateTime.Now;
            await ClusterDatabase.SaveTaskAsync(TaskItem);

            OnNavigate("tasks");
        }

        protected async void DeleteTask()
        {
            if (TaskItem.Id == 0)
                return;

            await ClusterDatabase.DeleteTaskAsync(TaskItem.Id);

            OnNavigate("tasks");

        }



    }
}
