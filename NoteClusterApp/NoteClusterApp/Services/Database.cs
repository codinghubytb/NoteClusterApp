
using NoteClusterApp.Models;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterApp.Services
{
    public class Database
    {
        SQLiteAsyncConnection db;

        public Database()
        {
        }

        async Task Init()
        {
            if (db is not null)
                return;

            db = new SQLiteAsyncConnection(Constants.DatabasePath, Constants.Flags);
            await db.CreateTableAsync<Note>();
            await db.CreateTableAsync<Categorie>();
        }

        #region Get Notes

        public async Task<List<Note>> GetNotesAsync()
        {
            try
            {
                await Init();
                var result = await db.Table<Note>().ToListAsync();
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return new List<Note>();
            }
        }

        public async Task<List<Note>> SearchNotesAsync(string text)
        {
            await Init();
            string searchNoSpaces = $"%{text.Replace(" ", "%")}%";
            List<Note> data =
                await db.QueryAsync<Note>("SELECT * FROM Notes WHERE Title LIKE ? or Description LIKE ?", searchNoSpaces, searchNoSpaces);

            return data;
        }

        public async Task<Note> GetNoteByGuidAsync(string guid)
        {
            await Init();
            return await db.Table<Note>().Where(i => i.Guid == guid).FirstOrDefaultAsync();

        }


        #endregion

        #region Save Note
        public async Task SaveNoteAsync(Note note)
        {
            await Init();
            if (note.Id == 0)
                await db.InsertAsync(note);
            else
                await db.UpdateAsync(note);
        }

        #endregion

        #region Delete Note

        public async Task DeleteNotesAsync(int id)
        {
            await db.DeleteAsync<Note>(id);
        }

        #endregion

        #region Get Note_Categorie

        public async Task<List<NoteCategorie>> GetNoteByCategorie()
        {
            await Init();
            List<NoteCategorie> data =
                await db.QueryAsync<NoteCategorie>(
                    @"SELECT Note.Id, Categorie.Guid As GuidCategorie, Note.Guid As GuidNote, Categorie.Color As Color, Categorie.Title As TitleCategorie, 
                      Note.Title As TitleNote, Note.Modified As ModifiedNote, Note.Description as DescriptionNote
                      FROM Categorie
                      Inner join Note on Note.GuidCategorie = Categorie.Guid
                      Order by Note.Modified DESC");

            return data;
        }


        public async Task<List<NoteCategorie>> GetNoteByCategorie(string guidCategorie)
        {
            await Init();
            List<NoteCategorie> data =
                await db.QueryAsync<NoteCategorie>(
                    @$"SELECT N.Id, C.Guid As GuidCategorie, N.Guid As GuidNote,
                        C.Color As Color, C.Title As TitleCategorie, 
                      N.Title As TitleNote, N.Modified As ModifiedNote,
                        N.Description as DescriptionNote
                      FROM Categorie C
                      Inner join Note N on N.GuidCategorie = C.Guid
                      where C.Guid = '{guidCategorie}'");

            return data;
        }

        public async Task<List<NoteCategorie>> GetNoteCategories()
        {
            await Init();
            List<NoteCategorie> data =
                await db.QueryAsync<NoteCategorie>(
                    @"SELECT C.Title As TitleCategorie, C.Guid As GuidCategorie, C.Color,  COALESCE(NotesCount, 0) AS Count
                    FROM Categorie C
                    LEFT JOIN (
                        SELECT GuidCategorie, COUNT(*) AS NotesCount
                        FROM Note
                        GROUP BY GuidCategorie
                    ) AS NoteCounts ON C.Guid = NoteCounts.GuidCategorie");

            return data;
        }

        #endregion

        #region Get Categorie

        public async Task<List<Categorie>> GetCategorieAsync()
        {
            await Init();
            return await db.Table<Categorie>().ToListAsync();
        }

        public async Task<Categorie> GetCategorieByIdAsync(string guid)
        {
            await Init();
            return await db.Table<Categorie>().Where(i => i.Guid == guid).FirstOrDefaultAsync();

        }

        #endregion

        #region Save Categorie
        public async Task SaveCategorieAsync(Categorie categorie)
        {
            await Init();
            if (categorie.Id == 0)
                await db.InsertAsync(categorie);
            else
                await db.UpdateAsync(categorie);
        }

        #endregion

        #region Delete Categorie

        public async Task DeleteCategorieAsync(string guid)
        {
            await db.DeleteAsync<Categorie>(guid);
        }

        #endregion

        #region Drop Table
        public async Task DeleteAsync()
        {
            Init();
            await db.DeleteAllAsync<Note>();
            await db.DeleteAllAsync<Categorie>();
        }
        #endregion
    }
}