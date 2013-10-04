using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsResult
/// </summary>
/// 

public class eCode
{
    public static readonly string SUCCESS = "000";
    public static readonly string DUP_ACCOUNT = "100";
    public static readonly string DUP_EMAIL = "101";
    public static readonly string EX_SEND_EMAIL = "102";
    public static readonly string NOT_EXIST_UID = "103";
    public static readonly string NOT_EXIST_PW = "104";
    public static readonly string UNACTIVE = "105";
    public static readonly string EX_CAPTCHA = "106";
    public static readonly string NOT_EXIST_MEMBER = "107";
    public static readonly string NOT_EXIST_EMAIL = "108";
    public static readonly string NOT_EXIST_BANK_SERIAL_HEAD = "109";
    public static readonly string NOT_EXIST_BANK_SERIAL_LENGTH = "110";
    public static readonly string NOT_ORDER_ID = "111";
    public static readonly string ERR_SAVE_PAINTER_STEP = "112";

    // system
    public static readonly string NOT_EXIST_ACTION= "998";
    public static readonly string EXCEPTION = "999";
}

public class clsRtnMsg
{
    public string id { get; set; }
    public string message { get; set; }

    public static readonly Dictionary<string, string> errDecrip = new Dictionary<string, string>
    {   
        { eCode.SUCCESS, "成功 " },
        { eCode.DUP_ACCOUNT, "帳號已重覆, 請選用其他帳號 " },
        { eCode.DUP_EMAIL, "此Email已註冊過 " },
        { eCode.EX_SEND_EMAIL, "發送Email發生錯誤 " },
        { eCode.NOT_EXIST_UID, "帳號錯誤 " },
        { eCode.NOT_EXIST_PW, "密碼錯誤 " },
        { eCode.UNACTIVE, "未啟動連結 " },
        { eCode.EX_CAPTCHA, "圖片驗證錯誤，您輸入的是 " },
        { eCode.NOT_EXIST_MEMBER, "會員資料不存在 " },
        { eCode.NOT_EXIST_EMAIL, "信箱不存在 " },
        { eCode.NOT_EXIST_BANK_SERIAL_HEAD, "匯款資訊不存在，請檢查Config表 " },
        { eCode.NOT_EXIST_BANK_SERIAL_LENGTH, "匯款帳號長度錯誤 " },
        { eCode.NOT_ORDER_ID, "無訂單(單頭)編號 " },   
        { eCode.ERR_SAVE_PAINTER_STEP, "儲存畫佈發生錯誤 " },

        { eCode.NOT_EXIST_ACTION, "找不到對應Action名稱為 " }
    };
}