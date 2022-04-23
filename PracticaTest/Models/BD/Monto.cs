using PracticaTest.Models.BD;

namespace PracticaTest.Models

{
    public class Monto
    {
        public int id { get; set; }
        public int FKPagoId { get; set; }
        public double MontoCP { get; set; }
        public int MontoIP { get; set; }
        public double SaldoIC { get; set; }

        public virtual Pago FKPago { get; set; } = null!;
    }

}