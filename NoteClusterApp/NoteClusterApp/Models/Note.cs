using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterApp.Models
{
    public class Note
    {
        [AutoIncrement, PrimaryKey]
        public int Id { get; set; }

        public string Guid { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public string GuidCategorie { get; set; }

        public DateTime Created { get; set; }

        public DateTime Modified { get; set; }

        public int Count { get; set; }

        public Note()
        {
            Id = 0;
            Guid = System.Guid.NewGuid().ToString();
            Title = string.Empty;
            Description = string.Empty;
            GuidCategorie = string.Empty;
            Created = DateTime.Now;
            Modified = DateTime.Now;
            Count = 0;
        }
    }
}
