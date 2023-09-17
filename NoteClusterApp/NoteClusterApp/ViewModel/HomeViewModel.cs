using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using NoteClusterApp.Models;
using NoteClusterApp.Services;
using NoteClusterApp.Views;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterApp.ViewModel
{
    public partial class HomeViewModel : BaseViewModel
    {
        [ObservableProperty]
        ObservableCollection<NoteCategorie> _noteCategories;

        public Command EditNoteCommand { get; }

        public HomeViewModel() : base()
        {
            Title = "Note Cluster";
            NoteCategories = new ObservableCollection<NoteCategorie>();
            EditNoteCommand = new Command(OnEditNoteAsync);
        }

        #region Methodes

        private async void OnEditNoteAsync(object obj)
        {
            NoteCategorie note = (NoteCategorie)obj;
            await Shell.Current.GoToAsync($"{nameof(NoteFormPage)}?{nameof(NoteFormViewModel.NoteGuid)}={note.GuidNote}", true);
        }

        [RelayCommand]
        private async Task OnCreateNoteAsync(object obj)
        {
            await Shell.Current.GoToAsync($"{nameof(NoteFormPage)}?{nameof(NoteFormViewModel.NoteGuid)}={string.Empty}", true);
        }

        [RelayCommand]
        public async Task LoadDataAsync()
        {
            try
            {
                NoteCategories.Clear();
                var result = await Database.GetNoteByCategorie();
                foreach(var note in result)
                {
                    note.Colors = Color.FromHex(note.Color);
                    NoteCategories.Add(note);
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
