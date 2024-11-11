using Microsoft.AspNetCore.Components;
using NoteClusterWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Components.PageModels
{
    public class CategoryFormPageModel : BasePageModel
    {
        [Parameter]
        public int Id { get; set; }
        protected Category Category { get; set; } = new();
        protected string Error { get; set; } = string.Empty;


        protected override Task OnInitializedAsync()
        {
            UpdateTitle?.Invoke("Category Form");
            GetData();
            return base.OnInitializedAsync();
        }

        async void GetData()
        {
            if (Id != 0)
                Category = await ClusterDatabase.GetCategoriesAsync(Id);
            Error = string.Empty;

            StateHasChanged();
        }

        protected async void SaveNote()
        {
            if(string.IsNullOrEmpty(Category.Name))
            {
                Error = "Please, fill the Name field";
                StateHasChanged();
                return;
            }

            Category.Color = GenerateNonWhiteishColor().ToHex();

            await ClusterDatabase.SaveCategoryAsync(Category);

            OnNavigate("categories");
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

        protected async void DeleteNote()
        {
            if (Category.Id == 0)
                return;
            int nbitems = await ClusterDatabase.GetNbCategoriesWithCountsAsync(Category.Id);

            if(nbitems> 0)
            {
                Error = "Cannot delete because several items are associated with this category";
                StateHasChanged();
                return;
            }

            await ClusterDatabase.DeleteCategoryAsync(Category.Id);
            OnNavigate("categories");

        }

    }
}
