using NoteClusterApp.Services;

namespace NoteClusterApp
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            MainPage = new AppShell();
            InitialiseDatabase();
        }

        private async void InitialiseDatabase()
        {
            Database database = new Database();
            Dictionary<string, string> keyValuePairs = new Dictionary<string, string>()
            {
                {"Archives","#F5F5F5" },
                {"Work/Professional","#CCE5FF" },
                {"Personal","#DFFFD3" },
                {"Education","#FFF9C2" },
                {"Health and Wellness","#FFD9EB" },
                {"Travel","#E3F7FF" },
                {"Projects","#EFC8FF" },
                {"Creative Ideas","#FFE4B5" },
                {"Finances","#B9FFCB" },
                {"Leisure","#AEEEEE" },
                {"Recipes","#FFFFCC" },
                {"Events","#FFD6E7" },
                {"Inspirations","#E6E6FA" },
                {"Shopping Lists","#B0E0E6" },
                {"Personal Projects","#FFC0CB" },
                {"Sport","#ffcf00" },
            };
            var categories = await database.GetCategorieAsync();
            if(categories.Count == 0)
            {
                foreach (var kvp in keyValuePairs)
                {
                    string guid = Guid.NewGuid().ToString();
                    await database.SaveCategorieAsync(new Models.Categorie()
                    {
                        Title = kvp.Key,  // Accédez à la clé avec kvp.Key
                        Guid = guid,
                        Color = kvp.Value  // Accédez à la valeur avec kvp.Value
                    });

                    if (kvp.Key == "Archives")
                    {
                        await database.SaveNoteAsync(new Models.Note()
                        {
                            Title = "Welcome note !!",
                            Description = $"Keep your sports-related ideas organized with Note Cluster!\n" +
                            $"Track your favorite sports events and activities with our note-taking app.",
                            GuidCategorie = guid
                        });
                    }
                }

            }
        }
    }
}