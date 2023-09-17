using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterApp.Models
{
    public class NoteCategorie
    {
        public int Id { get; set; }
        public string GuidNote { get; set; }

        public string GuidCategorie{ get; set; }

        public string TitleNote { get; set; }

        public string TitleCategorie { get; set; }

        public string DescriptionNote { get; set; }
        public string Color { get; set; }

        public Color Colors { get; set; }
        public DateTime ModifiedNote { get; set; }

        public int Count { get; set; }
    }
}
