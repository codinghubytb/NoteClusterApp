using NoteClusterApp.ViewModel;

namespace NoteClusterApp.Views;

public partial class CategoryNotePage : ContentPage
{
	public CategoryNotePage()
	{
		InitializeComponent();
		BindingContext = new CategoryNoteViewModel();
	}
}