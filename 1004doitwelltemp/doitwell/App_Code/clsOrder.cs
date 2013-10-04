using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsOrder
/// </summary>
public class clsOrder
{
    public int order_id { get; set; }
    public string receiver_name { get; set; }
    public string mobile { get; set; }
    public int zipcode { get; set; }
    public string city { get; set; }
    public string locality { get; set; }
    public string address { get; set; }
    public string payment_type { get; set; }
    public string bank_account { get; set; }
    public double remit_total_money { get; set; }
    public double order_total_money { get; set; }
    public double discount { get; set; }
    public string use_coupon { get; set; }
    public double coupon_discount { get; set; }
    public string status { get; set; }
    public string open_time { get; set; }
    public string close_time { get; set; }
    public string cancel_time { get; set; }
    public string payment_time { get; set; }
    public string deliver_time { get; set; }
    public string return_time { get; set; }
    public string note { get; set; }
}