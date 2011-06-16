using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class ScorepediaEntities : DbContext
    {
        public DbSet<Player> Players { get; set; }
        public DbSet<Sport> Sports { get; set; }
    }
}