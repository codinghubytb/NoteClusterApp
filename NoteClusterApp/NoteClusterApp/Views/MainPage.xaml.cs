using NoteClusterApp.Services;
using NoteClusterApp.ViewModel;

namespace NoteClusterApp.Views
{
    public partial class MainPage : ContentPage
    {
        HomeViewModel viewModel;
        public MainPage()
        {
            InitializeComponent();
            BindingContext = viewModel = new HomeViewModel();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            viewModel.OnAppearing();
        }

    }
}