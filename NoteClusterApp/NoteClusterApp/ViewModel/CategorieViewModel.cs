using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using NoteClusterApp.Models;
using NoteClusterApp.Services;
using NoteClusterApp.Templates;
using NoteClusterApp.Views;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterApp.ViewModel
{
    public partial class CategorieViewModel : BaseViewModel
    {
        [ObservableProperty]
        ObservableCollection<NoteCategorie> _categories;

        [ObservableProperty]
        StackLayout views;

        public Command ViewNoteCategorieCommand { get; }

        public CategorieViewModel() : base()
        {
            Title = "Note Cluster";
            Categories = new ObservableCollection<NoteCategorie>();
            ViewNoteCategorieCommand = new Command(OnViewNoteCategorieAsync);
        }

        private async void OnViewNoteCategorieAsync(object obj)
        {
            var result = (NoteCategorie)obj;
            await Shell.Current.GoToAsync($"{nameof(CategoryNotePage)}" +
                $"?{nameof(CategoryNoteViewModel.CategorieGuid)}={result.GuidCategorie}" +
                $"&{nameof(CategoryNoteViewModel.CategorieTitle)}={result.TitleCategorie}", true);

        }

        #region Méthodes

        [RelayCommand]
        public async Task LoadDataAsync()
        {
            try
            {
                Categories.Clear();
                var result = await Database.GetNoteCategories();
                foreach (var categorie in result)
                {
                    categorie.Colors = Color.FromHex(categorie.Color);
                    Categories.Add(categorie);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                AddTemplate();
                IsBusy = false;
            }
        }

        private CategorieTemplate CreateFrame(NoteCategorie noteCategorie, Command command)
        {
            return new CategorieTemplate() { Categories = noteCategorie, CommandCategorieNote = command, HorizontalOptions = LayoutOptions.FillAndExpand };
        }

        private void AddTemplate()
        {
            Views.Clear();
            for(int i=0; i<Categories.Count; i+=2)
            {

                StackLayout stacklayout = new StackLayout()
                {
                    Padding = 10,
                    Spacing = 10,
                    Orientation = StackOrientation.Horizontal
                };
                var template = CreateFrame(Categories[i], ViewNoteCategorieCommand);
                stacklayout.Children.Add(template);
                if(i+1 < Categories.Count)
                {
                    template = CreateFrame(Categories[i + 1], ViewNoteCategorieCommand);
                    stacklayout.Children.Add(template);
                }

                Views.Add(stacklayout);
            }

        }

        public void OnAppearing()
        {
            IsBusy = true;
        }

        #endregion
    }
}
