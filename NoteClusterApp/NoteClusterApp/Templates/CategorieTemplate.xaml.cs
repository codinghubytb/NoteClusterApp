using NoteClusterApp.Models;

namespace NoteClusterApp.Templates;

public partial class CategorieTemplate : ContentView
{
	public CategorieTemplate()
	{
		InitializeComponent();
	}

    public static BindableProperty CategoriesProperty =
        BindableProperty.Create(nameof(Categories), typeof(NoteCategorie), typeof(CategorieTemplate));

    public static BindableProperty CommandCategorieNoteProperty =
        BindableProperty.Create(nameof(CommandCategorieNote), typeof(Command), typeof(CategorieTemplate));

    public static BindableProperty SourceImageProperty =
    BindableProperty.Create(nameof(SourceImage), typeof(ImageSource), typeof(CategorieTemplate));

    public NoteCategorie Categories
    {
        get => (NoteCategorie)GetValue(CategoriesProperty);
        set => SetValue(CategoriesProperty, value);
    }

    public Command CommandCategorieNote
    {
        get => (Command)GetValue(CommandCategorieNoteProperty);
        set => SetValue(CommandCategorieNoteProperty, value);
    }

    public ImageSource SourceImage
    {
        get => (ImageSource)GetValue(SourceImageProperty);
        set => SetValue(SourceImageProperty, value);
    }

}