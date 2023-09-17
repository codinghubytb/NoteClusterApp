using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using NoteClusterApp.Models;
using NoteClusterApp.Services;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterApp.ViewModel
{
    [QueryProperty(nameof(NoteGuid), nameof(NoteGuid))]
    public partial class NoteFormViewModel : BaseViewModel
    {
        private string _noteGuid;

        [ObservableProperty]
        private string _titleCat;

        [ObservableProperty]
        private Note _note;

        [ObservableProperty]
        private Dictionary<string, string> _categoriesTitleGuid;
        public string NoteGuid
        {
            get => _noteGuid;
            set
            {
                SetProperty(ref _noteGuid, value);
                LoadData(value);
            }
        }

        public NoteFormViewModel() : base()
        {
            CategoriesTitleGuid = new Dictionary<string, string>();
            Initialise();
        }

        #region Méthodes

        public async void LoadData(string guid)
        {
            try
            {
                IsReadOnly = false;
                Title = "Create Note";
                Note = new Note();

                if (!string.IsNullOrEmpty(guid))
                {
                    IsReadOnly = true;
                    IsDelete = true;
                    Note = await Database.GetNoteByGuidAsync(guid);
                    Title = $"Note : {Note.Title}";
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }
        }

        private async void Initialise()
        {
            var _categories = await Database.GetCategorieAsync();
            var title = "";
            if (_categories == null || _categories.Count == 0)
                return;

            foreach (var category in _categories)
            {
                CategoriesTitleGuid.Add(category.Title, category.Guid);
                if(category.Guid == Note.GuidCategorie)
                    title = category.Title;
            }

            if(!string.IsNullOrEmpty(NoteGuid))
            {
                Note.GuidCategorie = CategoriesTitleGuid[title];
                TitleCat = title;
            }
            else
            {
                Note.GuidCategorie = _categories[0].Guid;
                TitleCat = _categories[0].Title;
            }
        }

        [RelayCommand]
        private async Task OnDisplayCategorieAsync()
        {
            string[] categorieTitles = new string[CategoriesTitleGuid.Count];

            int index = 0;
            foreach (var kvp in CategoriesTitleGuid)
            {
                categorieTitles[index] = kvp.Key;
                index++;
            }

            string action = await Shell.Current.DisplayActionSheet("ActionSheet: Send to?", "Cancel", null, categorieTitles);

            if (action != null && action != "Cancel")
            {
                Note.GuidCategorie = CategoriesTitleGuid[action];
                TitleCat = action;
            }
        }

        [RelayCommand]
        private async Task OnCloseAsync(object obj)
        {
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand]
        private async Task OnSaveAsync(object obj)
        {
            await Database.SaveNoteAsync(Note);
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand]
        private async Task OnDeleteAsync(object obj)
        {
            await Database.DeleteNotesAsync(Note.Id);
            await Shell.Current.GoToAsync("..");
        }

        [RelayCommand]
        private void OnEdit()
        {
            IsReadOnly = false;
        }

        #endregion
    }
}
