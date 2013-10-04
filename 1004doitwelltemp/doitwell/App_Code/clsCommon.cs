using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.IO;
using System.Text;

/// <summary>
/// Summary description for clsCommon
/// </summary>
public static class clsCommon
{
    public static bool GetObject(HttpContext context, ref object obj, ref clsRtnMsg msg)
    {
        try
        {
            foreach (var prop in obj.GetType().GetProperties())
            {
                    if (prop.PropertyType.Name.Equals("Int32"))
                    {                        
                        prop.SetValue(obj, Convert.ToInt16(context.Request[prop.Name]), null);
                    }
                    else if (prop.PropertyType.Name.Equals("String"))
                    {
                        prop.SetValue(obj, context.Request[prop.Name], null);
                    }
                    else if (prop.PropertyType.Name.Equals("Double"))
                    {
                        prop.SetValue(obj, Convert.ToDouble(context.Request[prop.Name]), null);
                    }
                    else
                    {
                        prop.SetValue(obj, context.Request[prop.Name], null);
                    }
            } 
        }
        catch (Exception ex)
        {
            msg.id = eCode.EXCEPTION;
            msg.message = GetExceptionType(ex);            
            return false;
        }
        return true;
    }

    public static string GetExceptionType(Exception ex)
    {
        string exceptionType = ex.GetType().ToString();
        return exceptionType.Substring(
            exceptionType.LastIndexOf('.') + 1);
    }

    # region " Mail "
    public static void SendMail(string tempName, HttpContext context, clsMember m, ref clsRtnMsg msg)
    {
        MailMessage mailMsg = new MailMessage();
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        try
        {
            switch (tempName)
            { 
                case "ActiveMail":
                    mailMsg.Subject = "[DoItWell獨一無二創意輸出] Hi " + m.user_name + "，歡迎加入DoItWell!";
                    // TODO: 修改樣板網域 www.doitwell.com
                    mailMsg.Body = clsCommon.MailTemplate("ActiveMail", context, m);
                    break;
                case "SendPassword":
                    mailMsg.Subject = "[DoItWell獨一無二創意輸出] Hi " + m.user_name + "，忘記密碼通知";
                    mailMsg.Body = clsCommon.MailTemplate("SendPassword", context, m);
                    break;
                case "OrderMail":
                    mailMsg.Subject = "[DoItWell獨一無二創意輸出] Hi " + m.user_name + "，這是您的訂單";
                    mailMsg.Body = m.verify;
                    break;
            }            
            mailMsg.From = new MailAddress("doitwell588@gmail.com");
            //mailMsg.From = new MailAddress("MMS@motech.com.tw");
           
            // TODO: Release
            //mailMsg.To.Add("amau712@gmail.com");
            //mailMsg.To.Add("allen_chien@motech.com.tw");
            mailMsg.To.Add(m.email);

            mailMsg.IsBodyHtml = true;
            client.Host = "smtp.gmail.com";
            //client.Host = "192.168.20.57";
            System.Net.NetworkCredential basicauthenticationinfo = new System.Net.NetworkCredential("doitwell588@gmail.com", "0936066188");
            client.Port = int.Parse("587");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicauthenticationinfo;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Send(mailMsg);
        }
        catch (Exception ex)
        {
            msg.id = eCode.EX_SEND_EMAIL;
            msg.message = clsRtnMsg.errDecrip[msg.id] + ex.Message;
        }
    }

    public static string MailTemplate(string tempName, HttpContext context, clsMember m)
    {
        StreamReader sr = null;
        string strBody = "";

        //讀取信件範本 
        try
        {
            switch (tempName)
            {
                case "ActiveMail":
                    sr = new StreamReader(context.Request.MapPath("TemplateActiveMail.html"), Encoding.Default);
                    strBody = sr.ReadToEnd();
                    break;
                case "SendPassword":
                    sr = new StreamReader(context.Request.MapPath("TemplateSendPassword.html"), Encoding.Default);
                    strBody = sr.ReadToEnd();
                    break;
            }            

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sr.Close();
        }
        //將範本內的特定變數作取代 
        switch (tempName)
        {
            case "ActiveMail":
                strBody = strBody.Replace("$realName$", m.real_name);
                strBody = strBody.Replace("$userName$", m.user_name);
                strBody = strBody.Replace("$eMail$", m.email);
                strBody = strBody.Replace("$password$", m.password);
                break;
            case "SendPassword":
                string tmpPW = m.password.Substring(0, m.password.Length - 3) + "***";
                strBody = strBody.Replace("$password$", tmpPW);
                break;
        }        

        return strBody;
    }
    # endregion    
}