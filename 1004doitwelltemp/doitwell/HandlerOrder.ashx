<%@ WebHandler Language="C#" Class="HandlerOrder" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public class HandlerOrder : IHttpHandler, IRequiresSessionState
{
    private clsRtnMsg _msg;
    private clsDataGrid _dg;
    private clsOrder _order;
    private clsOrderDetail _orderDetail;
    private JVar _rltJson;
    
    public void ProcessRequest (HttpContext context) 
    {
        _msg = new clsRtnMsg();
        _dg = new clsDataGrid();
        _order = new clsOrder();
        _orderDetail = new clsOrderDetail();
        _rltJson = JVar.NONE;
        
        try
        {
            if (context.Request["action"] == null) return;

            string mode = context.Request["action"].ToString();

            switch (mode)
            {
                case "order_query":
                    _rltJson = OrderQuery(context);
                    break;              
                case "order_detail_query":
                    _rltJson = OrderDetailQuery(context);
                    break;
                case "order_add":
                    _rltJson = OrderAdd(context);
                    break;
                case "member_order_detail_query":
                    _rltJson = MemberOrderDetailQuery(context);
                    break;
                case "member_shopcar_detail_query":
                    _rltJson = MemberShopCarDetailQuery(context);
                    break;
                case "member_order_detail_cancel":
                    _rltJson = MemberOrderDetailCencel(context);
                    break;
                case "member_order_delete":
                    _rltJson = MemberOrderDelete(context);
                    break;
                case "member_order_detail_delete":
                    _rltJson = MemberOrderDetailDelete(context);
                    break;
                case "member_order_id_query":
                    _rltJson = MemberOrderIdQuery(context);
                    break;
                case "send_mail":
                    _rltJson = SendMail(context);
                    break;
                default:
                    _msg.id = eCode.NOT_EXIST_ACTION;
                    _msg.message = clsRtnMsg.errDecrip[_msg.id];
                    break;
            }

            switch (_rltJson)
            {
                case JVar.JFAIL:
                    var jsonFailMsg = JsonConvert.SerializeObject(_msg);
                    context.Response.Write(jsonFailMsg);
                    break;
                case JVar.JRTN_MSG:
                    if (_msg.id == null)
                    {
                        _msg.id = eCode.SUCCESS;
                        _msg.message = clsRtnMsg.errDecrip[_msg.id];
                    }
                    var jsonMsg = JsonConvert.SerializeObject(_msg);
                    context.Response.Write(jsonMsg);
                    break;
                case JVar.JDATA_OBJ:
                    var jsonData = JsonConvert.SerializeObject(_order);
                    context.Response.Write(jsonData);
                    break;
                case JVar.JDATA_GRID:
                    var jsonDg = JsonConvert.SerializeObject(_dg);
                    context.Response.Write(jsonDg);
                    break;
                case JVar.JDATA_TABLE:
                    //var jsonDt = JsonConvert.SerializeObject(_dt);
                    //context.Response.Write(jsonDt);
                    break;
            }
        }
        catch (Exception ex)
        {
            string message = ex.Message;
            if (ex.InnerException != null && ex.InnerException.Message != null)
                message += "<BR>" + ex.InnerException.Message;

            _msg.id = eCode.EXCEPTION;
            _msg.message = message;

            var json = JsonConvert.SerializeObject(_msg);
            context.Response.Write(json);
        }
    }

    private JVar OrderQuery(HttpContext context)
    {
        string page = (context.Request["page"] != null) ? context.Request["page"].ToString() : "1";
        string rows = (context.Request["rows"] != null) ? context.Request["rows"].ToString() : "10";
        string offset = ((Convert.ToInt16(page) - 1) * Convert.ToInt16(rows)).ToString();
        string search_field = (context.Request["search_field"] != null) ? context.Request["search_field"].ToString() : "";
        string search_keyword = (context.Request["search_keyword"] != null) ? context.Request["search_keyword"].ToString() : "";

        string where = "";
        if (search_field.Length > 0)
        {
            where = " and " + search_field + " like '%" + search_keyword + "%'";
        }
        
        DataTable dt;
        dt = ComSQL.Order_Query(offset, rows, where);
        _dg.total = dt.Rows.Count.ToString();
        _dg.rows = dt;
        return JVar.JDATA_GRID;
    }

    private JVar OrderDetailQuery(HttpContext context)
    {
        string order_master_id = context.Request["order_master_id"].ToString();        

        DataTable dt;
        dt = ComSQL.OrderDetail_Query(order_master_id);
        _dg.total = dt.Rows.Count.ToString();
        _dg.rows = dt;
        return JVar.JDATA_GRID;
    }

    private JVar OrderAdd(HttpContext context)
    {
        string json = new System.IO.StreamReader(context.Request.InputStream).ReadToEnd();

        clsAddOrder addOrder = JsonConvert.DeserializeObject<clsAddOrder>(json);

        string confirmOrderId = string.Empty;
        object obj = new object();
        lock (obj)
        {
            confirmOrderId = CreateConfirmId();
        }
        
        // 找有沒有open的訂單，沒有就新建一筆
        DataTable dtOrderOpen;
        dtOrderOpen = ComSQL.OrderOpen_Query(addOrder.user_name);
        string order_master_id = string.Empty;
        if (dtOrderOpen.Rows.Count == 0)
        {
            clsMember m = new clsMember();
            m.user_name = addOrder.user_name;
            DataTable dtMember;
            dtMember = ComSQL.Member_GetInfo(m);
            
            dynamic jsonUser = new JObject();
            jsonUser.Add("user_id", dtMember.Rows[0]["user_id"].ToString());
            jsonUser.Add("receiver_name", dtMember.Rows[0]["real_name"].ToString());
            jsonUser.Add("telephone", dtMember.Rows[0]["telephone"].ToString());
            jsonUser.Add("mobile", dtMember.Rows[0]["mobile"].ToString());
            jsonUser.Add("zipcode", dtMember.Rows[0]["zipcode"].ToString());
            jsonUser.Add("city", dtMember.Rows[0]["city"].ToString());
            jsonUser.Add("locality", dtMember.Rows[0]["locality"].ToString());
            jsonUser.Add("address", dtMember.Rows[0]["address"].ToString());
            jsonUser.Add("email", dtMember.Rows[0]["email"].ToString());
            jsonUser.Add("confirm_order_id", confirmOrderId);
            ComSQL.Order_Create(jsonUser);

            order_master_id = ComSQL.OrderMasterId_Query(jsonUser["user_id"].Value);
        }
        else
        {               
            order_master_id = dtOrderOpen.Rows[0]["order_id"].ToString();
        }

        dynamic jsonOrderDetail = new JObject();
        jsonOrderDetail.Add("order_master_id", order_master_id);
        jsonOrderDetail.Add("make_type", addOrder.make_type);
                     
        // 新增訂單細項
        DataTable dtProd;
        
        foreach (ProdList p in addOrder.prod_list)
        {
            int amount = Convert.ToInt16(p.amount);
            
            for (int i = 0; i < amount; i++)
            {
                dtProd = ComSQL.Product_QueryByProdId(p.prod_id);

                jsonOrderDetail.product_type = dtProd.Rows[0]["category"].ToString();
                jsonOrderDetail.product_spec = dtProd.Rows[0]["spec"].ToString();
                jsonOrderDetail.product_amount = p.amount;
                jsonOrderDetail.product_price = dtProd.Rows[0]["price"].ToString();
                jsonOrderDetail.product_discount = dtProd.Rows[0]["discount"].ToString();
                jsonOrderDetail.width = dtProd.Rows[0]["width"].ToString();
                jsonOrderDetail.height = dtProd.Rows[0]["height"].ToString();
                jsonOrderDetail.bleed_width = dtProd.Rows[0]["bleed_width"].ToString();
                jsonOrderDetail.bleed_height = dtProd.Rows[0]["bleed_height"].ToString();
                jsonOrderDetail.pages = dtProd.Rows[0]["pages"].ToString();
                jsonOrderDetail.painter_cover = "http://140.116.86.167:2688/upload/ads_images/product/13024.jpg";  
                
                if (addOrder.make_type != "painter")
                {
                    jsonOrderDetail.painter_status = "finish";
                }
                
                ComSQL.OrderDetail_Create(jsonOrderDetail);
            }            
        }

        ComSQL.OederDetail_UpdateConfirmOrderId(order_master_id, confirmOrderId);
        ComSQL.Oeder_UpdateConfirmOrderId(order_master_id, confirmOrderId);
        
        _msg.id = eCode.SUCCESS;
        _msg.message = order_master_id;
        
        return JVar.JRTN_MSG;
    }

    public string CreateConfirmId()
    {
        string bankSerialY = DateTime.Now.Year.ToString().Substring(3, 1);
        string bankSerialM = DateTime.Now.Month.ToString();
        switch (bankSerialM)
        {
            case "10":
                bankSerialM = "0";
                break;
            case "11":
                bankSerialM = "A";
                break;
            case "12":
                bankSerialM = "B";
                break;
        }
        string bankSerialD = DateTime.Now.Day.ToString().PadLeft(2, '0');
        string YMD = bankSerialY + bankSerialM + bankSerialD;
        DataTable dt;
        dt = ComSQL.OederDetail_QueryConfirmOrderDetailId(YMD);

        string confirmOrderDetailId = string.Empty;
        int lastSerialId = 0;
        if (dt.Rows.Count == 0)
            lastSerialId = 0;
        else
            lastSerialId = int.Parse(dt.Rows[0][0].ToString().Substring(4,3));
                
        confirmOrderDetailId = YMD + (lastSerialId + 1).ToString().PadLeft(3, '0');
        
        return confirmOrderDetailId; 
    }
    
    public JVar MemberOrderDetailQuery(HttpContext context)
    {
        string user_id = context.Request["user_id"].ToString();

        DataTable dtOrderId;
        dtOrderId = ComSQL.OrderStatus_QueryOrderId(user_id, "inproc");

        DataTable dt = null;
        string order_master_id = string.Empty;
        for (int i = 0; i < dtOrderId.Rows.Count; i++)
        {
            order_master_id = dtOrderId.Rows[i]["order_id"].ToString();
            if (dt == null)
                dt = ComSQL.OrderDetail_QueryByUserId(order_master_id, "'close'", "'checkout_confirm'");
            else
                dt.Merge(ComSQL.OrderDetail_QueryByUserId(order_master_id, "'close'", "'checkout_confirm'"));
        }
             
        _dg.total = dt.Rows.Count.ToString();
        _dg.rows = dt;
        return JVar.JDATA_GRID;
    }

    public JVar MemberShopCarDetailQuery(HttpContext context)
    {
        string user_id = context.Request["user_id"].ToString();

        DataTable dtOrderId;
        DataTable dt = null;
        string order_master_id = string.Empty;
        dtOrderId = ComSQL.OrderStatus_QueryOrderId(user_id, "inproc");                
        for (int i = 0; i < dtOrderId.Rows.Count; i++)
        {
            order_master_id = dtOrderId.Rows[i]["order_id"].ToString();
            if (dt == null)
                dt = ComSQL.OrderDetail_QueryByUserId(order_master_id, "'close'", "'checkout_confirm'");
            else
                dt.Merge(ComSQL.OrderDetail_QueryByUserId(order_master_id, "'close'", "'checkout_confirm'"));
        }

        dtOrderId = ComSQL.OrderStatus_QueryOrderId(user_id, "open");
        for (int i = 0; i < dtOrderId.Rows.Count; i++)
        {
            order_master_id = dtOrderId.Rows[i]["order_id"].ToString();
            if (dt == null)
                dt = ComSQL.OrderDetail_QueryByUserId(order_master_id, "'open','edit','finish'", "'open','delete','cancel'");
            else
                dt.Merge(ComSQL.OrderDetail_QueryByUserId(order_master_id, "'open','edit','finish'", "'open','delete','cancel'"));
        }
        
        _dg.total = dt.Rows.Count.ToString();
        _dg.rows = dt;
        return JVar.JDATA_GRID;
    }

    public JVar MemberOrderDetailCencel(HttpContext context)
    {
        string order_detail_id = context.Request["order_detail_id"].ToString();

        ComSQL.OederDetail_MemberCancel(order_detail_id);
        
        return JVar.JRTN_MSG;
    }

    public JVar MemberOrderDelete(HttpContext context)
    {
        string order_id = context.Request["order_id"].ToString();

        ComSQL.Oeder_MemberDelete(order_id);

        return JVar.JRTN_MSG;
    }
    
    public JVar MemberOrderDetailDelete(HttpContext context)
    {
        string order_detail_id = context.Request["order_detail_id"].ToString();

        ComSQL.OederDetail_MemberDelete(order_detail_id);

        return JVar.JRTN_MSG;
    }

    public JVar MemberOrderIdQuery(HttpContext context)
    {
        string user_id = context.Request["user_id"].ToString();
        string order_id = ComSQL.OrderMasterId_Query(user_id);

        _msg.id = eCode.SUCCESS;
        _msg.message = order_id;
        
        return JVar.JRTN_MSG;
    }

    public JVar SendMail(HttpContext context)
    {
        string document_body = context.Request["document_body"].ToString();
        string receiver_name = context.Request["receiver_name"].ToString();
        string email = context.Request["email"].ToString();

        clsMember m = new clsMember();
        m.user_name = receiver_name;
        m.email = email;
        m.verify = HttpUtility.UrlDecode(document_body); //暫時用這個欄位塞內容
        clsRtnMsg msg = new clsRtnMsg();
        clsCommon.SendMail("OrderMail", null, m, ref msg);

        return JVar.JRTN_MSG;
    }
    
    public bool IsReusable 
    {
        get {
            return false;
        }
    }

}