using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterApp.Models
{
    public class Categorie
    {
        [AutoIncrement, PrimaryKey]
        public int Id { get; set; }

        public string Guid { get; set; }

        public string Title { get; set; }

        public string Color { get; set; }

        public DateTime Created { get; set; } = DateTime.Now;

        public DateTime Modified { get; set; } = DateTime.Now;

        public int Count { get; set; }
    }

}
