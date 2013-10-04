using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsOrderDetail
/// </summary>
public class clsOrderDetail
{
    public int order_master_id { get; set; }
    public int order_detail_id { get; set; }
    public string product_type { get; set; }
    public string product_spec { get; set; }
    public int product_amount { get; set; }
    public double product_price { get; set; }
    public double product_discount { get; set; }
    public string note { get; set; }
}