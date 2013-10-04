using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json;

public partial class category : System.Web.UI.Page
{
    public string strHtml;
    public string session_user_name;
    public string category_name;
    public string jsonProduct;

    public string jsonCustomProduct;
    public string ads_product_marquee;

    protected void Page_Load(object sender, EventArgs e)
    {            
        DataTable dt;
        string category_id = Request.QueryString["category_id"];
        dt = ComSQL.Category_GetHtml(category_id);
        if (dt.Rows.Count > 0)
        {
            this.strHtml = dt.Rows[0].ItemArray[0].ToString();
            this.strHtml = this.strHtml.Replace("&#39;", "'");
            this.strHtml = this.strHtml.Replace("&#34;", "\"");			
            this.strHtml = JsonConvert.SerializeObject(this.strHtml);
        }
        else
            this.strHtml = JsonConvert.SerializeObject("");

        dt = ComSQL.CategoryName_Query(category_id);
        if (dt.Rows.Count > 0)
            category_name = dt.Rows[0].ItemArray[0].ToString();
        else
            category_name = "";

        if (category_name.Length > 0)
        {            
            dt = ComSQL.Product_QueryByCategory(category_name);
            if (dt.Rows.Count > 0)
                jsonProduct = JsonConvert.SerializeObject(dt.Rows[0]);
            else
                jsonProduct = JsonConvert.SerializeObject("");
        }

        dt = ComSQL.Ads_Query("product");
        if (dt.Rows.Count > 0)
            this.jsonCustomProduct = JsonConvert.SerializeObject(dt.Rows[0]);
        else
            this.jsonCustomProduct = JsonConvert.SerializeObject("");

        ads_product_marquee = ComSQL.Config_GetValue("ads_product_marquee");
    }
}