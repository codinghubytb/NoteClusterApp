using Microsoft.AspNetCore.Components;
using NoteClusterWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Components.PageModels
{
    public class NoteFormPageModel : BasePageModel
    {
        [Parameter]
        public int Id { get; set; }
        protected List<Category> Categories { get; set; } = new();
        protected NoteItem NoteItem { get; set; } = new();
        protected string Error { get; set; } = string.Empty;


        protected override Task OnInitializedAsync()
        {
            UpdateTitle?.Invoke("Note Form");
            GetData();
            return base.OnInitializedAsync();
        }

        async void GetData()
        {
            Categories = await ClusterDatabase.GetCategoriesAsync();
            NoteItem.CategoryId = Categories[0].Id;
            if (Id != 0)
                NoteItem = await ClusterDatabase.GetNoteItemByIdWithCategoryAsync(Id);
            Error = string.Empty;

            StateHasChanged();
        }

        protected async void SaveNote()
        {
            if(string.IsNullOrEmpty(NoteItem.Title) ||
               NoteItem.CategoryId == 0)
            {
                Error = "Please, fill the fields";
                StateHasChanged();
                return;
            }

            NoteItem.DateModified = DateTime.UtcNow;
            await ClusterDatabase.SaveNoteAsync(NoteItem);

            OnNavigate("notes");
        }

        protected async void DeleteNote()
        {
            if (NoteItem.Id == 0)
                return;

            await ClusterDatabase.DeleteNoteAsync(NoteItem.Id);
            OnNavigate("notes");

        }

    }
}
