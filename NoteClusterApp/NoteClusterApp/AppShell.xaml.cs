using NoteClusterApp.Views;

namespace NoteClusterApp
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(NoteFormPage), typeof(NoteFormPage));
            Routing.RegisterRoute(nameof(CategoryNotePage), typeof(CategoryNotePage));
        }
    }
}