using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Models
{
    public class NoteItem
    {
        [AutoIncrement, PrimaryKey, NotNull]
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.UtcNow;
        public DateTime DateModified { get; set; } = DateTime.UtcNow;
        public bool IsImportant { get; set; } = false;
        public bool IsArchived { get; set; } = false;

        // Clé étrangère pour lier une catégorie
        public int CategoryId { get; set; }

        [Ignore]
        public Category Category { get; set; }

    }

}
