using NoteClusterWebApp.Models;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace NoteClusterWebApp.Services
{
    public class ClusterDatabase
    {
        SQLiteAsyncConnection Database;

        async Task Init()
        {
            if (Database is not null)
                return;

            Database = new SQLiteAsyncConnection(Constants.DatabasePath, Constants.Flags);
            await Database.CreateTableAsync<NoteItem>();
            await Database.CreateTableAsync<TaskItem>();
            await Database.CreateTableAsync<Category>();
        }
        public async Task InitializeDatabaseAsync()
        {
            await Init(); // Assurez-vous que la base de données est prête

            // Vérifiez si des catégories existent déjà
            var categories = await Database.Table<Category>().ToListAsync();
            if (!categories.Any())
            {
                // Aucune catégorie n'existe, donc on insère des catégories de démarrage
                var defaultCategories = new List<Category>
        {
            new Category { Name = "Travail", Description = "Tâches liées au travail", Color = "#FF5733" },
            new Category { Name = "Personnel", Description = "Tâches personnelles", Color = "#33FF57" },
            new Category { Name = "Loisirs", Description = "Activités de loisirs", Color = "#3357FF" }
        };

                // Insérer les catégories
                await Database.InsertAllAsync(defaultCategories);

                // Récupérer les ID des catégories insérées
                categories = await Database.Table<Category>().ToListAsync();
            }

            // Vérifiez si des tâches existent déjà
            var tasks = await Database.Table<TaskItem>().ToListAsync();
            if (!tasks.Any())
            {
                // Aucune tâche n'existe, donc on insère des tâches de démarrage
                var defaultTasks = new List<TaskItem>
        {
            // Associer les tâches aux catégories par ID
            new TaskItem { Title = "Configurer l'application", Description = "Configurer l'application pour le premier lancement", CategoryId = categories.First(c => c.Name == "Travail").Id },
            new TaskItem { Title = "Créer un compte", Description = "Créer un compte utilisateur", CategoryId = categories.First(c => c.Name == "Personnel").Id }
        };

                await Database.InsertAllAsync(defaultTasks);
            }

            // Vérifiez si des notes existent déjà
            var notes = await Database.Table<NoteItem>().ToListAsync();
            if (!notes.Any())
            {
                // Aucune note n'existe, donc on insère des notes de démarrage
                var defaultNotes = new List<NoteItem>
        {
            // Associer la note à une catégorie par ID
            new NoteItem { Title = "Idées de projets", Content = "Liste des idées de projets à explorer.", CategoryId = categories.First(c => c.Name == "Loisirs").Id }
        };

                await Database.InsertAllAsync(defaultNotes);
            }
        }
        public async Task<List<TaskItem>> GetTaskItemsWithCategoryAsync()
        {
            await Init();
            var taskItems = await Database.Table<TaskItem>().ToListAsync();

            foreach (var task in taskItems)
            {
                // Charger la catégorie associée pour chaque tâche
                task.Category = await Database.Table<Category>()
                                     .Where(c => c.Id == task.CategoryId)
                                     .FirstOrDefaultAsync();
            }

            return taskItems;
        }
        public async Task<List<TaskItem>> GetTaskItemsWithCategoryAsync(int idCategory)
        {
            await Init();
            var taskItems = await Database.Table<TaskItem>().Where(t => t.CategoryId == idCategory).ToListAsync();

            foreach (var task in taskItems)
            {
                // Charger la catégorie associée pour chaque tâche
                task.Category = await Database.Table<Category>()
                                     .Where(c => c.Id == task.CategoryId)
                                     .FirstOrDefaultAsync();
            }

            return taskItems;
        }
        public async Task<List<NoteItem>> GetNoteItemsWithCategoryAsync()
        {
            await Init();
            var NoteItems = await Database.Table<NoteItem>().ToListAsync();

            foreach (var todo in NoteItems)
            {
                // Charger la catégorie associée pour chaque todo
                todo.Category = await Database.Table<Category>()
                                    .Where(c => c.Id == todo.CategoryId)
                                    .FirstOrDefaultAsync();
            }

            return NoteItems;
        }
        public async Task<List<NoteItem>> GetNoteItemsByTitleAsync(string text)
        {
            await Init();
            var NoteItems = await Database.Table<NoteItem>().Where(n => n.Title.ToLower().Contains(text.ToLower())).ToListAsync();

            foreach (var todo in NoteItems)
            {
                // Charger la catégorie associée pour chaque todo
                todo.Category = await Database.Table<Category>()
                                    .Where(c => c.Id == todo.CategoryId)
                                    .FirstOrDefaultAsync();
            }

            return NoteItems;
        }
        public async Task<List<TaskItem>> GetTaskItemsByTitleAsync(string text)
        {
            await Init();
            var taskItems = await Database.Table<TaskItem>().Where(n => n.Title.ToLower().Contains(text.ToLower())).ToListAsync();

            foreach (var task in taskItems)
            {
                // Charger la catégorie associée pour chaque tâche
                task.Category = await Database.Table<Category>()
                                     .Where(c => c.Id == task.CategoryId)
                                     .FirstOrDefaultAsync();
            }

            return taskItems;
        }
        public async Task<List<NoteItem>> GetNoteItemsWithCategoryAsync(int idCategory)
        {
            await Init();
            var noteItems = await Database.Table<NoteItem>().Where(t => t.CategoryId == idCategory).ToListAsync();

            foreach (var note in noteItems)
            {
                // Charger la catégorie associée pour chaque tâche
                note.Category = await Database.Table<Category>()
                                     .Where(c => c.Id == note.CategoryId)
                                     .FirstOrDefaultAsync();
            }

            return noteItems;
        }
        public async Task<NoteItem> GetNoteItemByIdWithCategoryAsync(int id)
        {
            await Init();
            var NoteItem = await Database.Table<NoteItem>().FirstOrDefaultAsync(n => n.Id == id);

            NoteItem.Category = await Database.Table<Category>()
                                    .Where(c => c.Id == NoteItem.CategoryId)
                                    .FirstOrDefaultAsync();
            
            return NoteItem;
        }
        public async Task<TaskItem> GetTaskItemByIdWithCategoryAsync(int id)
        {
            await Init();
            var TaskItem = await Database.Table<TaskItem>().FirstOrDefaultAsync(n => n.Id == id);

            TaskItem.Category = await Database.Table<Category>()
                                    .Where(c => c.Id == TaskItem.CategoryId)
                                    .FirstOrDefaultAsync();

            return TaskItem;
        }

        public async Task<List<TaskItem>> GetTaskItemByDateWithCategoryAsync(DateTime dateTime)
        {
            await Init();

            // Define the start and end of the specified date
            var startOfDay = dateTime.Date;
            var endOfDay = dateTime.Date.AddDays(1).AddTicks(-1);

            // Fetch TaskItems that fall within the date range
            var taskItems = await Database.Table<TaskItem>()
                                           .Where(n => n.DateModified >= startOfDay && n.DateModified <= endOfDay && n.IsCompleted == false)
                                           .ToListAsync();

            foreach (var task in taskItems)
            {
                // Load the associated category for each task
                task.Category = await Database.Table<Category>()
                                               .Where(c => c.Id == task.CategoryId)
                                               .FirstOrDefaultAsync();
            }

            return taskItems;
        }

        public async Task<int> GetNbCategoriesWithCountsAsync(int id)
        {
            await Init();

                // Count the number of notes and tasks associated with each category
                var noteCount = await Database.Table<NoteItem>()
                                               .Where(n => n.CategoryId == id)
                                               .CountAsync();

                var taskCount = await Database.Table<TaskItem>()
                                               .Where(t => t.CategoryId == id)
                                               .CountAsync();
            return taskCount + noteCount;
        }

        public async Task<List<Category>> GetCategoriesWithCountsAsync()
        {
            await Init();

            // Fetch all categories
            var categories = await Database.Table<Category>().ToListAsync();

            foreach (var category in categories)
            {
                // Count the number of notes and tasks associated with each category
                var noteCount = await Database.Table<NoteItem>()
                                               .Where(n => n.CategoryId == category.Id)
                                               .CountAsync();

                var taskCount = await Database.Table<TaskItem>()
                                               .Where(t => t.CategoryId == category.Id)
                                               .CountAsync();
                category.NbItems = taskCount + noteCount;
            }

            return categories;
        }

        public async Task<List<Category>> GetCategoriesAsync()
        {
            await Init();
            return await Database.Table<Category>().ToListAsync();
        }

        public async Task<Category> GetCategoriesAsync(int id)
        {
            await Init();
            return await Database.Table<Category>().FirstOrDefaultAsync(c => c.Id == id);
        }
        public async Task<int> GetCountTaskCompleted(bool value = true)
        {
            await Init();
            var taskItems = await Database.Table<TaskItem>().Where(t => t.IsCompleted == value).CountAsync();

            return taskItems;
        }
        public async Task<List<TaskItem>> GetTasksCompleted(bool value = true)
        {
            await Init();
            var taskItems = await Database.Table<TaskItem>().Where(t => t.IsCompleted == value).ToListAsync();
            foreach (var task in taskItems)
            {
                // Charger la catégorie associée pour chaque tâche
                task.Category = await Database.Table<Category>()
                                     .Where(c => c.Id == task.CategoryId)
                                     .FirstOrDefaultAsync();
            }
            return taskItems;
        }
        public async Task<List<TaskItem>> GetTasksArchived(bool value = true)
        {
            await Init();
            var taskItems = await Database.Table<TaskItem>().Where(t => t.IsArchived == value).ToListAsync();
            foreach (var task in taskItems)
            {
                // Charger la catégorie associée pour chaque tâche
                task.Category = await Database.Table<Category>()
                                     .Where(c => c.Id == task.CategoryId)
                                     .FirstOrDefaultAsync();
            }
            return taskItems;
        }
        public async Task<int> GetNotes()
        {
            await Init();
            var noteItems = await Database.Table<NoteItem>().CountAsync();

            return noteItems;
        }
        public async Task<List<NoteItem>> GetNotesImportant(bool value = true)
        {
            await Init();
            var noteItems = await Database.Table<NoteItem>().Where(t => t.IsImportant == value).ToListAsync();
            foreach (var note in noteItems)
            {
                // Charger la catégorie associée pour chaque tâche
                note.Category = await Database.Table<Category>()
                                     .Where(c => c.Id == note.CategoryId)
                                     .FirstOrDefaultAsync();
            }
            return noteItems;
        }
        public async Task<List<NoteItem>> GetNotesArchived(bool value = true)
        {
            await Init();
            var noteItems = await Database.Table<NoteItem>().Where(t => t.IsArchived == value).ToListAsync();
            foreach (var note in noteItems)
            {
                // Charger la catégorie associée pour chaque tâche
                note.Category = await Database.Table<Category>()
                                     .Where(c => c.Id == note.CategoryId)
                                     .FirstOrDefaultAsync();
            }
            return noteItems;
        }
        public async Task SaveTaskAsync(TaskItem task)
        {
            await Init();

            if (task.Id == 0)
            {
                // Nouvelle tâche, on l'ajoute
                await Database.InsertAsync(task);
            }
            else
            {
                // Tâche existante, on la met à jour
                await Database.UpdateAsync(task);
            }
        }
        public async Task SaveNoteAsync(NoteItem note)
        {
            await Init();

            if (note.Id == 0)
            {
                // Nouvelle note, on l'ajoute
                await Database.InsertAsync(note);
            }
            else
            {
                // Note existante, on la met à jour
                await Database.UpdateAsync(note);
            }
        }
        public async Task SaveCategoryAsync(Category category)
        {
            await Init();

            if (category.Id == 0)
            {
                // Nouvelle catégorie, on l'ajoute
                await Database.InsertAsync(category);
            }
            else
            {
                // Catégorie existante, on la met à jour
                await Database.UpdateAsync(category);
            }
        }
        public async Task DeleteCategoryAsync(int categoryId)
        {
            await Init();

            // Supprime la catégorie par son ID
            await Database.DeleteAsync<Category>(categoryId);
        }
        public async Task DeleteTaskAsync(int taskId)
        {
            await Init();

            // Supprime la tâche par son ID
            await Database.DeleteAsync<TaskItem>(taskId);
        }
        public async Task DeleteNoteAsync(int noteId)
        {
            await Init();

            // Supprime la note par son ID
            await Database.DeleteAsync<NoteItem>(noteId);
        }


    }
}
