

using CommunityToolkit.Mvvm.Input;
using NoteClusterApp.Models;

namespace NoteClusterApp.Templates;

public partial class NoteTemplate : ContentView
{
	public NoteTemplate()
	{
		InitializeComponent();
	}

    public static BindableProperty CommandNoteProperty =
        BindableProperty.Create(nameof(CommandNote), typeof(Command), typeof(NoteTemplate));

    public static BindableProperty NoteProperty =
        BindableProperty.Create(nameof(Note), typeof(NoteCategorie), typeof(NoteTemplate));

    public Command CommandNote
    {
        get => (Command)GetValue(CommandNoteProperty);
        set => SetValue(CommandNoteProperty, value);
    }

    public NoteCategorie Note
    {
        get => (NoteCategorie)GetValue(NoteProperty);
        set => SetValue(NoteProperty, value);
    }
}