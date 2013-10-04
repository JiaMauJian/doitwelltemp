using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsAddOrder
/// </summary>
/// 

public class ProdList
{
    public string prod_id { get; set; }
    public string amount { get; set; }
}

public class clsAddOrder
{   
    public string user_name { get; set; }
    public string make_type { get; set; }
    public List<ProdList> prod_list { get; set; }  
}