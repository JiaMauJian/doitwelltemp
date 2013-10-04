<%@ Page Title="" Language="C#" MasterPageFile="~/DoMaster.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="category" %>
<%@ Register Assembly="CKFinder" Namespace="CKFinder" TagPrefix="CKFinder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="Styles/ui-lightness/jquery-ui-1.10.3.custom.css" />
	<script type="text/javascript" src="Scripts/jquery-ui-1.10.3.custom.js"></script>
	<link rel="stylesheet" type="text/css" href="Styles/doitwell.css" />
    <script src="Scripts/localStorage.js" type="text/javascript"></script>
    <script src="Scripts/url.js" type="text/javascript"></script>
    <script src="ckfinder/ckfinder.js" type="text/javascript"></script>
    <link href="Styles/diwTable2.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style>
#left_block{
	float:left;
	width:725px;
}
#right_block{
	float:right;
	
}
#order_button{
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	border-radius: 30px;
	padding:10px;
	background-color: #cccccc;
}
.table_style table{
    border-collapse:collapse;
}

.table_style table, .table_style td, .table_style th{
    border:1px solid black;
    padding: 3px;
}

#container {
    width: 1000px; 
    height: 665px; 
    display: none; 
    position: fixed;    
    background:#E9F5FE;    
    border: 1px solid 555;
    box-shadow: 2px 2px 40px #222;     
    top:30px;
}

#block {
    background: #000; 
    opacity:0.6;  
    position: fixed; 
    width: 100%; 
    height: 100%; 
    top:0; 
    left:0; 
    display:none;
}

#product_marquee {
    position: relative;
    width: 200px; /*marquee width */
    height: 800px; /*marquee height */
    overflow: hidden;
    padding-left:4px;  
    font-size:16px;
}
</style>

<div id="left_block">
	<div id="load_html"></div>
    <div class="table_style">            
        <table class='CSSTableGenerator2' id="product_information_table" width="700px">
            <tr>
                <td style="display:none;">產品編號</td>
                <td width="20%">尺寸(長x寬)</td>
                <td width="30%">規格</td>
                <td width="15%">頁數</td>                    
                <td width="15%">價格</td>
                <td width="10%">(幅/本)</td>                                    
            </tr>
        </table>
    </div>        
    <div id="radio" style="margin-top:20px;margin-bottom:20px;font-size:14px;font-family:\5FAE\8EDF\6B63\9ED1\9AD4;font-weight:normal;color:blue">
        <input type="radio" id="radio1" name="radio"/><label for="radio1" style="padding-right:10px;">自編上傳</label>
        <input type="radio" id="radio2" name="radio" checked="checked" /><label for="radio2" style="padding-right:10px;">線上編輯</label>
        <input type="radio" id="radio3" name="radio" /><label for="radio3">委託編輯</label>
    </div>
    <div>
        <button class="css_btn_class" type="button" id="open">開始編輯</button>
        <button class="css_btn_class" type="button" id="howto">如何編輯</button>
        <button type="button" id="faq" style="display:none;">常見問題</button>
    </div>
</div>
<div id="right_block">
    <div class="featured">
        <h3 style="font-weight: bold; font-size:16px;padding:3px;">作品欣賞</h3>
        <div id="product_marquee" onMouseover="copyspeed2=pausespeed2" onMouseout="copyspeed2=marqueespeed2" align="center">
            <div id="vmarquee2" style="position: absolute; width: 100%;" align="center"></div>
        </div>    
    </div>
</div>
<div id="block"></div>
<div id="container">
    <div>
        <button id="closebtn" type="button" style="float:right;margin:10px 20px;">關閉</button>
    </div>    
    <div style="margin:30px">
        <iframe id="iframe" style="width:100%;height:550px;outline:1px solid red;"></iframe>
    </div>
    <div>
        <button id="checkout" type="button" style="float:right;margin:-30px 20px;">前往結帳</button>
    </div>
</div>

<script>
    var g_order_id;
    var g_make_type;

    function open_iframe(url) {
        $('#block').fadeIn();
        $('#iframe').attr('src', url);
        $('#container').fadeIn();   
    };

    function close_iframe() {  
        $('#block').fadeOut();
        $('#container').fadeOut();  
    };

    $(document).ready(function () {
          
        var session_name;
        var category_name;

        var strHtml = <%=strHtml%>;
        console.log("strHtml : " + strHtml);            

        if (strHtml.length == 0)
        {
            alert("該產品沒有內容，將轉到首頁");
            window.location.href = 'home.aspx';
        }  

        $("#load_html").html(strHtml);
        var get_category = url.parse(location.search);
        setStorage('before_login_url', 'category.aspx?category_id=' + get_category.get.category_id, 36000);
        setStorage('before_category_id', get_category.get.category_id, 36000);

        var jsonProduct = <%=jsonProduct%>;

        if (jsonProduct.length == 0)
        {
            alert("該產品沒有設定規格，將轉到首頁");
            window.location.href = 'home.aspx';
        }

	    console.log(jsonProduct.Table);
        
	    $.each(jsonProduct.Table, function(k, v){
		    var append_item = '<tr>'+
            '<td style="display:none;">'+v.prod_id+'</td>'+
		    '<td>'+v.height+'x'+v.width+'</td>'+	    
            '<td>'+v.spec+'</td>'+
            '<td>'+v.pages+'</td>'+
            '<td>'+v.price+'</td>'+
            '<td><input class="spinner" style="width: 20px;font-size:16px;color:blue;font-weight:bold;"></td>'+
		    '</tr>';            
		    console.log(append_item);
		    $("#product_information_table tr:last").after(append_item);
            $('.spinner').spinner({min:0, max:10}).val(0);
		});

        $("#open").click(function(e){
            open_painter(e);
        });
        $("#howto").click(function(){
            how_to();
        });
        $("#faq").button().click(function(){
            faq();
        }).css({'padding':'20px','font-size':'26px','border':'5px solid #ACAC9D'});
        $("#closebtn").button().click(function(){
            close_iframe();
            $.getJSON('HandlerOrder.ashx?action=member_order_delete&order_id=' + g_order_id,function(){});
        });
        $("#checkout").button().click(function () {
            window.location.href = 'checkout.aspx?user_id=' + getStorage('user_id') + '&order_id=' + g_order_id + '&make_type=' + g_make_type;
        }).css({ 'padding': '5px', 'font-size': '18px' });
    });
	
	function open_painter(e)
	{	        
        var radio_label = $("#radio input[type='radio']:checked").attr('id');// $('input[name=radio]:checked').val();
        console.log(radio_label);

        session_name = getStorage('user_name');
        category_name = '<%=category_name%>';
        console.log("session_name : " + session_name);

        if (session_name == null || session_name == '')
        {
            var painter_width = screen.width;
            var painter_height = screen.height;
			e.preventDefault();
			myWindow=window.open('MemberLogin.aspx','DoItWell Painter','width='+painter_width+',height='+painter_height+',fullscreen=yes,left=0,top=0');
            myWindow.focus();
			return false;
        }
        else    
        {
            if (radio_label == "radio1")
            {
                execute_order_add(e,false,'user_editor');              				
            }
            else if(radio_label == "radio3")
            {
                execute_order_add(e,false,'boss_editor');                				
            }            
            else if(radio_label == "radio2")
            {
                execute_order_add(e,true,'painter');
            }                           
        }               
	}

    function execute_order_add(e, op, make_type)
    {
        var order_json = {};
        order_json.user_name = session_name;
        order_json.make_type = make_type;
        g_make_type = make_type;
        order_json.prod_list = [];

        var total_amount = 0;

        $('#product_information_table tr:gt(0)').each(function() {
            var prod_id = $(this).find("td").eq(0).html();               
            console.log("prod_id : " + prod_id);
            var amount = $(this).find("input").attr('aria-valuenow')
            console.log(amount);

            if (typeof amount == 'undefined')
                amount = 0;

            if (amount > 0)
                order_json.prod_list.push({"prod_id" : prod_id, "amount" : amount});

            total_amount += parseInt(amount);
        });            

        console.log("total_amount : " + total_amount);

        if (total_amount == 0)
        {
            alert("沒有數量");
            return false;
        }

        console.log(order_json);

        $.ajax({
            type: "POST",
            dataType: "json",
            url: 'HandlerOrder.ashx?action=order_add',
            data: JSON.stringify(order_json),
            success: function (data){
                if (data.id == '000')
                {
                    g_order_id = data.message;
                    if (op)
                    {
						e.preventDefault();
						myWindow=window.open('painter.html?order_id=' + g_order_id, 'DoItWell Painter','width=1250,height=740,fullscreen=yes,left=0,top=0');
                        myWindow.focus();
						return false;
                    }
                    else
                    {
                        if (make_type == 'user_editor')
                        {
                            var create_user_ed_json = {};
                            create_user_ed_json.user_name = session_name;
                            create_user_ed_json.category_name = category_name;
                            create_user_ed_json.CKBaseURL = '~/upload/user_editor/';
                            create_user_ed_json.CKBaseDIR = 'd:\\doitwell02\\upload\\user_editor\\';
                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                url: 'HandlerPainter.ashx?action=create_user_editor_folder',
                                data: JSON.stringify(create_user_ed_json),
                                success: function (data){
                                    if (data.id == '000')
                                    {
                                        open_iframe('./upload.html?make_type=' + make_type + '&order_id=' + g_order_id + '&checkout=true');
                                    }
                                    else
                                        alert(data.message);
                                }
                            }); 
                        }

                        if (make_type == 'boss_editor')
                        {
                            var create_boss_ed_json = {};
                            create_boss_ed_json.user_name = session_name;
                            create_boss_ed_json.category_name = category_name;
                            create_boss_ed_json.CKBaseURL = '~/upload/boss_editor/';
                            create_boss_ed_json.CKBaseDIR = 'd:\\doitwell02\\upload\\boss_editor\\';
                            $.ajax({
                                type: "POST",
                                dataType: "json",
                                url: 'HandlerPainter.ashx?action=create_boss_editor_folder',
                                data: JSON.stringify(create_boss_ed_json),
                                success: function (data){
                                    if (data.id == '000')
                                    {
                                        open_iframe('./upload.html?make_type=' + make_type + '&order_id=' + g_order_id + '&checkout=true');
                                    }
                                    else
                                        alert(data.message);
                                }
                            });
                        }

						return false;
                    }                    
                }
                else
                    alert(data.message);
            }
        });
    }

    function how_to()
	{	        
        window.location.href = "howtomake.aspx";
	}

    function faq()
	{	        
        window.location.href = "faq.aspx";
	}

    var jsonProduct = JSON.parse('<%=jsonCustomProduct%>');
    if (typeof jsonProduct == 'object') {
        $.each(jsonProduct.Table, function (k, v) {
            $("#product_marquee > div[id='vmarquee2']").append('<div align="center" style="padding-bottom:10px;"><a href="http://' + window.location.hostname + '/' + v.content + '"><img src="http://' + window.location.hostname + ':2688/' + v.image_url + '" border="0" width="150" align="center"></a></div>') 
        });
    }    
</script>
<script type="text/javascript">
    var delayb4scroll = 2000; //Specify initial delay before marquee starts to scroll on page (2000=2 seconds)
    var marqueespeed = 2; //Specify marquee scroll speed (larger is faster 1-10)
    var pauseit = 1; //Pause marquee onMousever (0=no. 1=yes)?

    var copyspeed = marqueespeed;
    var pausespeed = (pauseit == 0) ? copyspeed : 0;
    var actualheight = '';

    function scrollmarquee() {
        if (parseInt(cross_marquee.style.top) > (actualheight * (-1) + 8)) //if scroller hasn't reached the end of its height
            cross_marquee.style.top = parseInt(cross_marquee.style.top) - copyspeed + "px"; //move scroller upwards
        else //else, reset to original position
            cross_marquee.style.top = parseInt(marqueeheight) + 8 + "px";
    }

    function initializemarquee() {
        cross_marquee = document.getElementById("vmarquee2");
        cross_marquee.style.top = 0;
        marqueeheight = document.getElementById('product_marquee').offsetHeight;
        actualheight = cross_marquee.offsetHeight; //height of marquee content (much of which is hidden from view)
        if (window.opera || navigator.userAgent.indexOf("Netscape/7") != -1) { //if Opera or Netscape 7x, add scrollbars to scroll and exit
            cross_marquee.style.height = marqueeheight + "px";
            cross_marquee.style.overflow = "scroll";
            return;
        }
        setTimeout('lefttime=setInterval("scrollmarquee()",30)', delayb4scroll);
    }

    var ads_product_marquee = '<%=ads_product_marquee%>';
    if (ads_product_marquee == 'Y') {
        if (window.addEventListener)
            window.addEventListener("load", initializemarquee, false);
        else if (window.attachEvent)
            window.attachEvent("onload", initializemarquee);
        else if (document.getElementById)
            window.onload = initializemarquee;
    };
</script>
</asp:Content>
