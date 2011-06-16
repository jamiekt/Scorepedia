using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Models
{
    public class SportAggregate
    {
        public int SportId { get; set; }
        public string SportName { get; set; }
        public int TeamCount { get; set; }
    }
}