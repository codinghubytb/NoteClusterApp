using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using NoteClusterApp.Models;
using NoteClusterApp.Views;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterApp.ViewModel
{
    [QueryProperty(nameof(CategorieGuid), nameof(CategorieGuid))]
    [QueryProperty(nameof(CategorieTitle), nameof(CategorieTitle))]
    public partial class CategoryNoteViewModel : BaseViewModel
    {
        private string _categorieGuid;
        private string _categorieTitle;

        [ObservableProperty]
        ObservableCollection<NoteCategorie> _notesCategorie;

        public string CategorieGuid
        {
            get => _categorieGuid;
            set
            {
                SetProperty(ref _categorieGuid, value);
                IsBusy = true;
            }
        }
        public string CategorieTitle
        {
            get => _categorieTitle;
            set
            {
                SetProperty(ref _categorieTitle, value);
                Title = value;
            }
        }
        
        public Command EditNoteCommand { get; }
        public CategoryNoteViewModel() : base()
        {
            NotesCategorie = new ObservableCollection<NoteCategorie>();
            EditNoteCommand = new Command(OnEditNoteAsync);
        }

        #region Methodes

        [RelayCommand]
        private async Task OnCloseAsync(object obj)
        {
            await Shell.Current.GoToAsync("..");
        }

        private async void OnEditNoteAsync(object obj)
        {
            NoteCategorie note = (NoteCategorie)obj;
            await Shell.Current.GoToAsync($"{nameof(NoteFormPage)}?{nameof(NoteFormViewModel.NoteGuid)}={note.GuidNote}", true);
        }

        [RelayCommand]
        public async Task LoadDataAsync()
        {
            try
            {
                await Task.Delay(500);
                NotesCategorie.Clear();
                var result = await Database.GetNoteByCategorie(CategorieGuid);
                foreach (var note in result)
                {
                    note.Colors = Color.FromHex(note.Color);
                    NotesCategorie.Add(note);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                IsBusy = false;
            }
        }

        public void OnAppearing()
        {
            IsBusy = true;
        }

        #endregion
    }
}
