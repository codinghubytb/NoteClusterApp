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
    public class NotePageModel : BasePageModel
    {
        protected List<NoteItem> NoteItems = new List<NoteItem>();
        protected List<Category> Categories = new List<Category>();

        public NotePageModel() { }

        protected override Task OnInitializedAsync()
        {
            UpdateTitle?.Invoke("Notes");
            GetData();
            return base.OnInitializedAsync();
        }

        async void GetData()
        {
            NoteItems = await ClusterDatabase.GetNoteItemsWithCategoryAsync();
            NoteItems = NoteItems
                .OrderBy(t => t.IsArchived) 
                .ThenBy(t => !t.IsImportant)
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
                        NoteItems = await ClusterDatabase.GetNoteItemsWithCategoryAsync();
                        NoteItems = NoteItems
                .OrderBy(t => t.IsArchived)
                .ThenBy(t => !t.IsImportant)
                .ToList();
                        break;
                    case 1:
                        NoteItems = await ClusterDatabase.GetNotesImportant(false);
                        break;
                    case 2:
                        NoteItems = await ClusterDatabase.GetNotesArchived(true);
                        break;
                    default:
                        NoteItems = await ClusterDatabase.GetNoteItemsWithCategoryAsync();
                        NoteItems = NoteItems
                .OrderBy(t => t.IsArchived)
                .ThenBy(t => !t.IsImportant)
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

        protected async void OnCategories(int id)
        {
            if (id.Equals(0))
            {
                NoteItems = await ClusterDatabase.GetNoteItemsWithCategoryAsync();
            }
            else
            {
                NoteItems = await ClusterDatabase.GetNoteItemsWithCategoryAsync(id);
            }

            NoteItems = NoteItems
                .OrderBy(t => t.IsArchived)
                .ThenBy(t => !t.IsImportant)
                .ToList();
            StateHasChanged();
        }


        protected async void SearchNote(ChangeEventArgs e)
        {
            string text = e.Value.ToString();

            if (!string.IsNullOrEmpty(text))
                NoteItems = await ClusterDatabase.GetNoteItemsByTitleAsync(text);
            else
                NoteItems = await ClusterDatabase.GetNoteItemsWithCategoryAsync();

            NoteItems = NoteItems
                .OrderBy(t => t.IsArchived)
                .ThenBy(t => !t.IsImportant)
                .ToList();

            StateHasChanged();
        }
    }
}
