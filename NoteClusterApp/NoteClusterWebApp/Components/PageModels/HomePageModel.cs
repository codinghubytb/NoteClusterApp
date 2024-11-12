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
        protected int TasksCount { get; set; }
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

        public Color GenerateNonWhiteishColor()
        {
            Random random = new Random();
            int maxColorValue = 200; // Limiter pour éviter des couleurs trop claires (255 serait trop proche du blanc)
            int minColorValue = 0;   // Limiter pour éviter des couleurs trop sombres (0 serait trop proche du noir)

            int red = random.Next(minColorValue, maxColorValue);
            int green = random.Next(minColorValue, maxColorValue);
            int blue = random.Next(minColorValue, maxColorValue);

            return Color.FromRgba(red, green, blue, 255);

        }

        async void GetData()
        {
            int nbCategories = await ClusterDatabase.GetNbCategoriesAsync();
            if(nbCategories == 0)
            {
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Personal", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Health", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Finance", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Education", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Shopping", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Family", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Travel", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Fitness", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Hobbies", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Projects", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Goals", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Social", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Entertainment", Color = GenerateNonWhiteishColor().ToHex() });
                await ClusterDatabase.SaveCategoryAsync(new Category { Name = "Reading", Color = GenerateNonWhiteishColor().ToHex() });

            }
            NotesCount = await ClusterDatabase.GetNotes();
            TaskNotCompletedCount = await ClusterDatabase.GetCountTaskCompleted(false);
            TasksCount = await ClusterDatabase.GetTasks();
            tasks = await ClusterDatabase.GetTaskItemByDateWithCategoryAsync(DateTime.Now);
            tasks = tasks.Where(task => !task.IsArchived).ToList();

            StateHasChanged();
        }


    }
}
