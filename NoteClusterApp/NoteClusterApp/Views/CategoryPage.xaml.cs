namespace NoteClusterApp.Views;

public partial class CategoryPage : ContentPage
{
	public CategoryPage()
	{
		InitializeComponent();
	}

    private void ImageButton_Clicked(object sender, EventArgs e)
    {
		Shell.Current.GoToAsync(nameof(NoteFormPage));
    }
}