using System;
using System.Collections.Generic;

namespace CSPharma_v4._0_DAL.Models;

public partial class TdcCatEstadosPagoPedido
{
    public string CodEstadoPago { get; set; } = null!;

    public string MdUuid { get; set; } = null!;

    public DateTime MdDate { get; set; }

    public int Id { get; set; }

    public string? DesEstadoPago { get; set; }

    public virtual ICollection<TdcTchEstadoPedidos>? TdcTchEstadoPedidos { get; } = new List<TdcTchEstadoPedidos>();
}
