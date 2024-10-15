using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Supermercado
{
    class Program
    {
        static void Main(string[] args)
        {
            Supermercado supermercado;
            
            supermercado = new Supermercado("Manolo", "Paseo Colon 653");

            supermercado.IngresarListaArticulo();

            supermercado.MostrarListaArticulo();

            supermercado.MostrarListaArticuloStock();

            supermercado.IngresarVentaDia();

            supermercado.MostrarMontoCaja();

            supermercado.MostrarCantidadArticuloVendidoCaja();

            supermercado.MostrarMontoTotal();

            supermercado.MostrarListaArticuloStock();

            Console.ReadKey();
        }
    }
}
