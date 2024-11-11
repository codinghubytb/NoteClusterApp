using Microsoft.AspNetCore.Components;
using NoteClusterWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Components.PageModels
{
    public class CategoryPageModel : BasePageModel
    {
        protected List<Category> Categories = new List<Category>();

        public CategoryPageModel() { }

        protected override Task OnInitializedAsync()
        {
            UpdateTitle?.Invoke("Categories");
            GetData();
            return base.OnInitializedAsync();
        }

        async void GetData()
        {
            Categories = await ClusterDatabase.GetCategoriesWithCountsAsync();
            StateHasChanged();
        }
    }
}
