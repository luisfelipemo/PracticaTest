namespace PracticaTest.Models.BD
{
    public partial class Pago
    {
        public Pago() {
            Montos = new HashSet<Monto>();
        }
        public int id { get; set; }
        public int idPrestamo { get; set; }
        public int Tasa { get; set; }
        public int Plazo { get; set; }

        public virtual ICollection <Monto> Montos { get; set; }
    }
}
