using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json.Linq;

public partial class Desktop : System.Web.UI.Page
{
    public string category_name;
    protected void Page_Load(object sender, EventArgs e)
    {
        GetWorkList();
    }

    private void GetWorkList()
    {
        string order_master_id = Request.QueryString["order_id"];

        DataTable dt;
        dt = ComSQL.OrderDetail_QueryPainter(order_master_id);

        dynamic jWorkList = new JObject();
        jWorkList.order_master_id = order_master_id;
        jWorkList.Add("work_list", new JArray());

        for (int i = 0; i < dt.Rows.Count; i++)
        {            
            dynamic jWork = new JObject();
            jWork.order_detail_id = dt.Rows[i]["order_detail_id"].ToString();
            jWork.product_type = dt.Rows[i]["product_type"].ToString();
            jWork.product_spec = dt.Rows[i]["product_spec"].ToString();
            jWork.product_amount = dt.Rows[i]["product_amount"].ToString();
            jWork.product_price = dt.Rows[i]["product_price"].ToString();
            jWork.product_discount = dt.Rows[i]["product_discount"].ToString();
            jWork.width = dt.Rows[i]["width"].ToString();
            jWork.height = dt.Rows[i]["height"].ToString();
            jWork.bleed_width = dt.Rows[i]["bleed_width"].ToString();
            jWork.bleed_height = dt.Rows[i]["bleed_height"].ToString();            
            jWork.pages = dt.Rows[i]["pages"].ToString();
            jWork.note = dt.Rows[i]["note"].ToString();
            jWork.painter_status = dt.Rows[i]["painter_status"].ToString();
            jWork.painter_id = dt.Rows[i]["painter_id"].ToString();
            jWork.confirm_order_detail_id = dt.Rows[i]["confirm_order_detail_id"].ToString();
            jWork.prod_id = dt.Rows[i]["prod_id"].ToString();
            litWorkList.Text += string.Format("<li style='{3}'><a style='margin-left:5px' href='javascript:editWork({1}, {2})'>[編輯]</a><a style='margin-left:5px' href='javascript:deleteWork()'>[刪除]</a><span style='margin-left:5px;color:white;'>ID: {4} {0}: 寬:{1} 長:{2} (cm)</span></li>", jWork.product_type, jWork.width, jWork.height, "margin:0 5px 0 5px", jWork.order_detail_id);
        }        
    }
}