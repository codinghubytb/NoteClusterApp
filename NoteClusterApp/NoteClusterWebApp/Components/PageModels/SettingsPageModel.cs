using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using Microsoft.Maui.Storage;
using Microsoft.Maui.ApplicationModel;
using SQLite;
using NoteClusterWebApp.Models;


namespace NoteClusterWebApp.Components.PageModels
{
    public class SettingsPageModel : BasePageModel
    {
        protected override Task OnInitializedAsync()
        {
            UpdateTitle?.Invoke("Settings");
            return base.OnInitializedAsync();
        }
        public async Task ShareDatabase()
        {
            string databasePath = Constants.DatabasePath;
            if (File.Exists(databasePath))
            {
                var file = new ShareFile(databasePath);
                var request = new ShareFileRequest
                {
                    Title = "Partager la base de données",
                    File = file
                };
                await Share.RequestAsync(request);
            }
            else
            {
                OnSnackToast("backup error", "error");
            }
        }

        public async Task RestoreDatabase()
        {
            try
            {
                var pickOptions = new PickOptions { PickerTitle = "Sélectionner un fichier de base de données" };
                FileResult result = await FilePicker.PickAsync(pickOptions);

                if (result != null && Path.GetExtension(result.FileName).ToLower() == ".db3")
                {
                    await MergeDatabaseData(result.FullPath);
                }

                OnSnackToast("Data restored", "success");
            }
            catch
            {

                OnSnackToast("restore error", "error");
            }

        }

        private async Task MergeDatabaseData(string tempDatabasePath)
        {
            // Ouvrir la base de données principale de l'application
            SQLiteAsyncConnection mainConnection = new SQLiteAsyncConnection(Constants.DatabasePath);

            // Ouvrir la base de données temporaire
            SQLiteAsyncConnection tempConnection = new SQLiteAsyncConnection(tempDatabasePath);

            // Lire les données de la table dans la base de données temporaire
            var tempDataNote = await tempConnection.Table<NoteItem>().ToListAsync();
            var tempDataTask = await tempConnection.Table<TaskItem>().ToListAsync();
            var tempDataCategory = await tempConnection.Table<Category>().ToListAsync();

            foreach (var item in tempDataNote)
            {
                // Vérifiez si l'enregistrement existe déjà dans la base de données principale pour éviter les doublons
                var existingItem = await mainConnection.FindAsync<NoteItem>(item.Id);

                if (existingItem == null)
                {
                    // Insérer les données dans la base de données principale si elles n'existent pas déjà
                    await mainConnection.InsertAsync(item);
                }
            }
            foreach (var item in tempDataCategory)
            {
                // Vérifiez si l'enregistrement existe déjà dans la base de données principale pour éviter les doublons
                var existingItem = await mainConnection.FindAsync<Category>(item.Id);

                if (existingItem == null)
                {
                    // Insérer les données dans la base de données principale si elles n'existent pas déjà
                    await mainConnection.InsertAsync(item);
                }
            }
            foreach (var item in tempDataTask)
            {
                // Vérifiez si l'enregistrement existe déjà dans la base de données principale pour éviter les doublons
                var existingItem = await mainConnection.FindAsync<TaskItem>(item.Id);

                if (existingItem == null)
                {
                    // Insérer les données dans la base de données principale si elles n'existent pas déjà
                    await mainConnection.InsertAsync(item);
                }
            }

            await tempConnection.CloseAsync();
        }




    }
}
