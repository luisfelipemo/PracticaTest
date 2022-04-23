#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PracticaTest.Models.BD;

namespace PracticaTest.Data
{
    public class PracticaTestContext : DbContext
    {
        public PracticaTestContext (DbContextOptions<PracticaTestContext> options)
            : base(options)
        {
        }

        public DbSet<PracticaTest.Models.BD.Pago> Pago { get; set; }
    }
}
