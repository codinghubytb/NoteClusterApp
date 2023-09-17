using NoteClusterApp.ViewModel;

namespace NoteClusterApp.Views;

public partial class NoteFormPage : ContentPage
{
	public NoteFormPage()
	{
		InitializeComponent();
        BindingContext = new NoteFormViewModel();
    }
}