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
                {"Archives","#F5F5F5" },
            };
            var categories = await database.GetCategorieAsync();
            if(categories.Count == 0)
            {
                foreach(var keyValue in keyValuePairs)
                {
                    await database.SaveCategorieAsync(new Models.Categorie()
                    {
                        Title = keyValue.Key,
                        Guid = Guid.NewGuid().ToString(),
                        Color = keyValue.Value
                    });
                }
            }
        }
    }
}