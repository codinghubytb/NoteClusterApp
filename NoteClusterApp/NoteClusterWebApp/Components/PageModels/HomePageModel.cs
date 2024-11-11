using Microsoft.AspNetCore.Components;
using NoteClusterWebApp.Components.Layout;
using NoteClusterWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Components.PageModels
{
    public class HomePageModel : BasePageModel
    {
        protected List<TaskItem> tasks = new List<TaskItem>();
        protected int NotesCount { get; set; }
        protected int TaskNotCompletedCount { get; set; }

        protected string Error = string.Empty;

        protected override async Task OnInitializedAsync()
        {
            UpdateTitle?.Invoke("Note Cluster");
          
            GetData();
            await base.OnInitializedAsync();
        }

        protected async void OnChangeState(bool state, TaskItem item)
        {
            item.IsCompleted = state;
            await ClusterDatabase.SaveTaskAsync(item);
            if (state)
            {
                tasks.Remove(item);
                TaskNotCompletedCount = await ClusterDatabase.GetCountTaskCompleted(false);
            }
            StateHasChanged();
        }

        async void GetData()
        {
            NotesCount = await ClusterDatabase.GetNotes();
            TaskNotCompletedCount = await ClusterDatabase.GetCountTaskCompleted(false);
            tasks = await ClusterDatabase.GetTaskItemByDateWithCategoryAsync(DateTime.Now);
            tasks = tasks.Where(task => !task.IsArchived).ToList();
            StateHasChanged();
        }


    }
}
