using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

/// <summary>
/// Summary description for ComSQL
/// </summary>
public static class ComSQL
{
    #region " table name "
    public const string TABLE_PAINTER = "painter";
    public const string TABLE_PAINTER_UPLOAD = "painter_upload";
    public const string TABLE_MEMBER = "member";
    public const string TABLE_ADS = "ads";
    public const string TABLE_CONFIG = "config";
    public const string TABLE_PRODUCT = "product";
    public const string TABLE_ORDER = "order";
    public const string TABLE_ORDER_DETAIL = "order_detail";
    public const string TABLE_BANK_REMIT_RECORD = "bank_remit_record";
    public const string TABLE_CATEGORY = "category";
    #endregion

    #region " member "
    public static DataTable Member_GetUserName(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where email='{1}'", TABLE_MEMBER, m.email);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable Member_GetPassword(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where email='{1}'", TABLE_MEMBER, m.email);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable Member_GetInfo(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where user_name='{1}'", TABLE_MEMBER, m.user_name);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable Member_ExistMail(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where email='{1}'", TABLE_MEMBER, m.email);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    public static DataTable Member_ActiveCheck(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where user_name='{1}' and password='{2}' and active='y'", TABLE_MEMBER, m.user_name, m.password);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    public static bool Member_ActiveMember(string userName, string eMail)
    {        
        string cmdSql = string.Format("update {0} set active = 'y' where user_name='{1}' and email='{2}'", TABLE_MEMBER, userName, eMail);
        MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
        return true;
    }

    public static DataTable Member_ExistPassword(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where password='{1}'", TABLE_MEMBER, m.password);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    public static DataTable Member_ExistAccount(clsMember m)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where user_name='{1}'", TABLE_MEMBER, m.user_name);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    
    public static int Member_Register(clsMember m)
    {
        if (m.zipcode.Length == 0) m.zipcode = "000";

        MySqlInsert ins = new MySqlInsert(TABLE_MEMBER);

        foreach (var prop in m.GetType().GetProperties())
        {
            ins.Add(prop.Name, prop.GetValue(m, null));
        }

        ins.Remove("verify");

        string cmdSql = ins.ToString();

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }

    public static int Member_Update(clsMember m)
    {
        MySqlUpdate update = new MySqlUpdate(TABLE_MEMBER);

        foreach (var prop in m.GetType().GetProperties())
        {
            update.Add(prop.Name, prop.GetValue(m, null));
        }

        update.Remove("verify");

        string cmdSql = update.ToString() + " where user_name='" + m.user_name + "'";

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }

    public static DataTable Member_ExistUserId(string user_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where user_id='{1}'", TABLE_MEMBER, user_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    #endregion

    #region " painter "
    public static int Painter_SaveStep(clsPainter p)
    {
        MySqlInsert ins = new MySqlInsert(TABLE_PAINTER);

        foreach (var prop in p.GetType().GetProperties())
        {
            ins.Add(prop.Name, prop.GetValue(p, null));            
        }

        string cmdSql = ins.ToString();

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }

    public static int Painter_UpdateStatus(string order_detail_id, string painter_id, string status)
    {
        string cmdSql = string.Format("update {0} set painter_status = '{1}' where order_detail_id='{2}' and painter_id='{3}'", TABLE_ORDER_DETAIL, status, order_detail_id, painter_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }

    public static int Painter_UploadImage(JObject jobj)
    {
        MySqlInsert ins = new MySqlInsert(TABLE_PAINTER_UPLOAD);

        Dictionary<string, object> values = JsonConvert.DeserializeObject<Dictionary<string, object>>(jobj.ToString());

        foreach (var val in values)
        {
            ins.Add(val.Key, val.Value);
        }

        ins.Remove("user_id");
        ins.Remove("user_name");
        ins.Remove("data");
        ins.Remove("filename");

        string cmdSql = ins.ToString();

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }

    public static DataTable Painter_GetUploadImage(string type, string order_detail_id, string painter_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where type='{1}' and order_detail_id='{2}' and painter_id='{3}' order by id asc", TABLE_PAINTER_UPLOAD, type, order_detail_id, painter_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    #endregion

    #region " ads "
    public static DataTable Ads_Query(string kind)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Empty;

        if (kind == "recommend")
            cmdSql = string.Format("select * from {0} where kind='{1}' and status='y' order by ads_id desc", TABLE_ADS, kind);
        else
            cmdSql = string.Format("select * from {0} where kind='{1}' and status='y' and (start_time <= '{2}' and end_time >= '{2}') order by ads_id desc", TABLE_ADS, kind, DateTime.Now.ToString("yyyy-MM-dd"));

        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    #endregion

    #region " config "
    public static string Config_GetValue(string item)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select value from {0} where item='{1}'", TABLE_CONFIG, item);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        if (dt.Rows.Count > 0)
            return dt.Rows[0].ItemArray[0].ToString();
        else
            return "";
    }
    public static int Config_SetValue(string item, string value)
    {
        string cmdSql = string.Format("update {0} set value = '{2}' where item='{1}'", TABLE_CONFIG, item, value);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    #endregion

    #region " bank "
    public static DataTable Bank_GetLastSerial()
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select serial from {0} order by time_stamp desc limit 0,1", TABLE_BANK_REMIT_RECORD);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    public static DataTable Bank_InsertInfo(string remit_record, string serial)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("insert into {0} (remit_record, serial) values ('{1}', '{2}')", TABLE_BANK_REMIT_RECORD, remit_record, serial);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    public static DataTable Bank_UpdateSerial(string order_id, string bank_account)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("update `{0}` set bank_account = '{1}' where order_id = '{2}' ", TABLE_ORDER, bank_account, order_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }

    #endregion

    #region " category "
    public static DataTable Category_Query()
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select category_id, category, title, replace(replace(content, '\r\n', '</br>'), '\n', '</br>') as content, image_url from {0} where status = 'Y' order by category_id", TABLE_CATEGORY);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable Category_GetHtml(string category_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select html from {0} where category_id='{1}'", TABLE_CATEGORY, category_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable CategoryName_Query(string category_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select category from {0} where category_id='{1}'", TABLE_CATEGORY, category_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    #endregion

    #region " order "
    public static DataTable Order_Query(string offset, string rows, string where)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select {0}.*, `{1}`.real_name, `{1}`.user_name from {0}, `{1}` where {0}.user_id = `{1}`.user_id {4} limit {2},{3}", TABLE_ORDER, TABLE_MEMBER, offset, rows, where);        
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable OrderDetail_Query(string order_master_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where order_master_id='{1}'", TABLE_ORDER_DETAIL, order_master_id);        
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable OrderStatus_QueryOrderId(string user_id, string status)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select order_id from `{0}` where user_id='{1}' and status = '{2}'", TABLE_ORDER, user_id, status);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable OrderDetail_QueryByUserId(string order_master_id, string painter_status, string order_detail_status)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0}, `{4}` where `{4}`.order_id = {0}.order_master_id and order_master_id = '{1}' and {0}.painter_status in ({2}) and {0}.status in ({3})", TABLE_ORDER_DETAIL, order_master_id, painter_status, order_detail_status, TABLE_ORDER);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable OrderOpen_Query(string user_name)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select `{0}`.*, `{1}`.real_name, `{1}`.user_name, `{1}`.email, `{1}`.telephone from `{0}`, `{1}` where `{0}`.user_id = `{1}`.user_id and `{1}`.user_name='{2}' and {0}.status='open' ", TABLE_ORDER, TABLE_MEMBER, user_name);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable OrderOpen_QueryByUserId(string user_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from `{0}` where user_id='{0}' and status='open' ", TABLE_ORDER, user_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable OrderFinish_Query(string order_master_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from `{0}`, `{1}` where `{0}`.order_id = `{1}`.order_master_id and `{1}`.order_master_id = '{2}' and `{1}`.painter_status = 'finish' and `{1}`.status = 'open' ", TABLE_ORDER, TABLE_ORDER_DETAIL, order_master_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable OrderCheckout_Query(string user_id, string order_master_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from `{0}`, `{1}` where `{0}`.order_id = `{1}`.order_master_id and `{0}`.user_id = '{3}' and `{1}`.order_master_id = '{2}' and `{1}`.painter_status = 'close' and `{1}`.status = 'checkout' ", TABLE_ORDER, TABLE_ORDER_DETAIL, order_master_id, user_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable OrderNoneCloseWorkList_Query(string user_id, string order_master_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from `{0}`, `{1}` where `{0}`.order_id = `{1}`.order_master_id and `{0}`.user_id = '{3}' and `{1}`.order_master_id = '{2}' and `{1}`.painter_status <> 'delete' and `{1}`.painter_status <> 'close' and `{0}`.status = 'inproc' and `{1}`.make_type='painter'", TABLE_ORDER, TABLE_ORDER_DETAIL, order_master_id, user_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static int Order_Create(JObject jobj)
    {
        MySqlInsert ins = new MySqlInsert("`" + TABLE_ORDER + "`");

        Dictionary<string, object> values = JsonConvert.DeserializeObject<Dictionary<string, object>>(jobj.ToString());

        foreach (var val in values)
        {
            ins.Add(val.Key, val.Value);
        }

        string cmdSql = ins.ToString();

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OrderDetail_Create(JObject jobj)
    {
        MySqlInsert ins = new MySqlInsert(TABLE_ORDER_DETAIL);

        Dictionary<string, object> values = JsonConvert.DeserializeObject<Dictionary<string, object>>(jobj.ToString());

        foreach (var val in values)
        {
            ins.Add(val.Key, val.Value);
        }

        string cmdSql = ins.ToString();

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OrderDetail_Delete(string order_detail_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("delete from {0} where order_detail_id='{1}'", TABLE_ORDER_DETAIL, order_detail_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OrderDetail_DeleteForMakeType(string order_master_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("delete from {0} where order_master_id='{1}' and status <> 'checkout_confirm'", TABLE_ORDER_DETAIL, order_master_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static string OrderDetail_PriceQuery(string order_master_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select sum(product_price) from {0} where order_master_id='{1}'", TABLE_ORDER_DETAIL, order_master_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        if (dt.Rows.Count == 0)
            return "0";
        else
            return dt.Rows[0][0].ToString();
    }
    public static int Order_UpdateTotalMoney(string order_id, string totalMoney)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("update `{0}` set order_total_money='{1}' where order_id='{2}'", TABLE_ORDER, totalMoney, order_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OrderDetail_Insert(JObject jobj)
    {
        MySqlInsert ins = new MySqlInsert(TABLE_ORDER_DETAIL);

        Dictionary<string, object> values = JsonConvert.DeserializeObject<Dictionary<string, object>>(jobj.ToString());

        foreach (var val in values)
        {
            ins.Add(val.Key, val.Value);
        }

        string cmdSql = ins.ToString();

        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static string OrderMasterId_Query(string user_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select order_id from `{0}` where user_id='{1}' and status='open' ", TABLE_ORDER, user_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        if (dt.Rows.Count == 0)
            return "0";
        else
            return dt.Rows[0][0].ToString();
    }
    public static int OederDetail_UpdateConfirmOrderId(string order_master_id, string confirm_order_id)
    {
        string cmdSql = string.Format("update {0} set confirm_order_detail_id = '{1}' where order_master_id='{2}'", TABLE_ORDER_DETAIL, confirm_order_id, order_master_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int Oeder_UpdateConfirmOrderId(string order_master_id, string confirm_order_id)
    {
        string cmdSql = string.Format("update `{0}` set confirm_order_id = '{1}' where order_id='{2}'", TABLE_ORDER, confirm_order_id, order_master_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OederDetail_UpdateArtist(string painter_id, string artist)
    {
        string cmdSql = string.Format("update {0} set artist = '{1}', painter_status='finish' where painter_id='{2}'", TABLE_ORDER_DETAIL, artist, painter_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OederDetail_MemberCancel(string order_detail_id)
    {
        string cmdSql = string.Format("update {0} set status = 'cancel' where order_detail_id='{1}'", TABLE_ORDER_DETAIL, order_detail_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int Oeder_MemberDelete(string order_id)
    {
        string cmdSql = string.Format("update `{0}` set status = 'delete' where order_id='{1}'", TABLE_ORDER, order_id);
        MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
        cmdSql = string.Format("update {0} set status = 'delete' where order_master_id='{1}'", TABLE_ORDER_DETAIL, order_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OederDetail_MemberDelete(string order_detail_id)
    {
        string cmdSql = string.Format("update {0} set status = 'delete' where order_detail_id='{1}'", TABLE_ORDER_DETAIL, order_detail_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OederDetail_MemberNextBuy(string order_detail_id)
    {
        string cmdSql = string.Format("update {0} set status = 'incar' where order_detail_id='{1}'", TABLE_ORDER_DETAIL, order_detail_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OederDetail_DeletePainter(string order_detail_id, string painter_id)
    {
        string cmdSql = string.Format("update {0} set painter_status = 'delete' where order_detail_id='{1}'", TABLE_ORDER_DETAIL, order_detail_id);
        
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OederDetail_UpdatePainterId(string order_detail_id, string painter_id)
    {
        string cmdSql = string.Format("update {0} set painter_id = '{1}', painter_status = 'edit' where order_detail_id='{2}'", TABLE_ORDER_DETAIL, painter_id, order_detail_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static DataTable OrderDetail_QueryPainter(string order_master_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where order_master_id='{1}' and painter_status in ('open', 'finish', 'edit') and make_type='painter'", TABLE_ORDER_DETAIL, order_master_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static int OederDetail_UpdateCheckout(string order_master_id)
    {
        string cmdSql = string.Format("update {0} set status = 'checkout', painter_status = 'close' where order_master_id='{1}' and painter_status = 'finish' and status = 'open'", TABLE_ORDER_DETAIL, order_master_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int Oeder_UpdateMemberInfo(string order_id, string receiver_name, string mobile, string email, string zipcode, string city, string locality, string address, string deliver_type)
    {
        string cmdSql = string.Format("update `{0}` set receiver_name = '{2}', mobile = '{3}', email = '{4}', zipcode = '{5}', city = '{6}', locality = '{7}', address = '{8}', deliver_type = '{9}' where order_id='{1}'", TABLE_ORDER, order_id, receiver_name, mobile, email, zipcode, city, locality, address, deliver_type);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OederDetail_UpdateNote(string order_detail_id, string note)
    {
        string cmdSql = string.Format("update `{0}` set note = '{2}' where order_detail_id='{1}'", TABLE_ORDER_DETAIL, order_detail_id, note);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int OederDetail_UpdateCheckoutConfirm(string order_master_id)
    {
        string cmdSql = string.Format("update {0} set status = 'checkout_confirm', painter_status = 'close' where order_master_id='{1}' and status = 'checkout' ", TABLE_ORDER_DETAIL, order_master_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static int Oeder_UpdateInProc(string user_id, string order_id)
    {
        string cmdSql = string.Format("update `{0}` set status = 'inproc' where user_id = '{1}' and order_id='{2}' and status = 'open' ", TABLE_ORDER, user_id, order_id);
        return MySqlDbAccess.ExecuteNonQueryInt(cmdSql, false);
    }
    public static DataTable OederDetail_QueryConfirmOrderDetailId(string confirm_order_detail_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select confirm_order_detail_id from {0} where confirm_order_detail_id like '{1}%'", TABLE_ORDER_DETAIL, confirm_order_detail_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    #endregion

    #region " product "
    public static DataTable Product_QueryByProdId(string prod_id)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where prod_id='{1}'", TABLE_PRODUCT, prod_id);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    public static DataTable Product_QueryByCategory(string category)
    {
        DataTable dt = new DataTable();
        string cmdSql = string.Format("select * from {0} where category='{1}' order by prod_id", TABLE_PRODUCT, category);
        dt = MySqlDbAccess.ExcuteQueryData(cmdSql, false);
        return dt;
    }
    #endregion
}