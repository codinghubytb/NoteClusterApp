namespace NoteClusterApp.Views;

public partial class NoteFormPage : ContentPage
{
	public NoteFormPage()
	{
		InitializeComponent();
	}

    private void ImageButton_Clicked(object sender, EventArgs e)
    {
		Shell.Current.GoToAsync("..");
    }

    private void Editor_Focused(object sender, FocusEventArgs e)
    {
        Device.BeginInvokeOnMainThread(() =>
        {
            ((Editor)sender).Unfocus();
        });


        ((Editor)sender).Unfocus();
    }
}