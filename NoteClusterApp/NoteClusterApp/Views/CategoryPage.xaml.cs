using NoteClusterApp.ViewModel;

namespace NoteClusterApp.Views;

public partial class CategoryPage : ContentPage
{
    CategorieViewModel viewModel;
	public CategoryPage()
	{
		InitializeComponent();
        BindingContext = viewModel = new CategorieViewModel();
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
        viewModel.Views = view;
        viewModel.OnAppearing();
    }
}