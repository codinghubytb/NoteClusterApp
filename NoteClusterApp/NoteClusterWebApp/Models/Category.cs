using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Models
{
    public class Category
    {
        [AutoIncrement, PrimaryKey, NotNull]
        public int Id { get; set; }

        // Nom de la catégorie
        public string Name { get; set; }

        // Description de la catégorie
        public string Description { get; set; }

        // Couleur associée pour l'organisation visuelle
        public string Color { get; set; }

        [Ignore]
        public int NbItems { get; set; }    
    }

}
