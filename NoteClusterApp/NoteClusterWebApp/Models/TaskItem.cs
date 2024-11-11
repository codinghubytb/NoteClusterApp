using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Models
{
    public class TaskItem
    {
        [AutoIncrement, PrimaryKey, NotNull]
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.UtcNow;
        public DateTime? DueDate { get; set; }
        public DateTime DateModified { get; set; } = DateTime.UtcNow;
        public bool IsCompleted { get; set; } = false;
        public int Priority { get; set; } = 2;
        public bool IsArchived { get; set; } = false;

        
        public int CategoryId { get; set; }

        [Ignore]
        public Category Category { get; set; }
    }


}
