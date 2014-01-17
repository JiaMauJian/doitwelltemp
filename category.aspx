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
    <link href="Styles/diwTable3.css" rel="stylesheet" type="text/css" />
    <link href="Styles/unslider2.css" rel="stylesheet" type="text/css">    
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
    border:0px;
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
    height: 1360px; /*marquee height */
    overflow: hidden;
    padding-left:4px;  
    font-size:16px;
}
</style>

<div id="left_block">
	<div id="load_html"></div>
    <div class="table_style">            
        <table id="product_information_table" width="687px">
            <tr>
                <td style="display:none;">產品編號</td>
                <td style="display:none;">尺寸(長x寬)</td>
                <td width="30%">規格</td>
                <td width="15%">頁數</td>                    
                <td width="15%">單價</td>
                <td width="15%">訂購數量</td>
                <td width="15%">小計</td>
                <td style="display:none;">基本數量</td>
            </tr>
        </table>
        <table id="noframe_product_information_table" width="687px">
            <tr>
                <td style="display:none;">產品編號</td>
                <td style="display:none;">尺寸(長x寬)</td>
                <td width="20%">輸出尺寸</td>
                <td width="20%">完成尺寸</td>
                <td width="15%">頁數</td>                    
                <td width="15%">單價</td>
                <td width="15%">訂購數量</td>
                <td width="15%">小計</td>
                <td style="display:none;">基本數量</td>
            </tr>
        </table>
    </div>        
    <div id="radio" style="margin-top:30px;margin-bottom:30px;font-size:22px;font-family:\5FAE\8EDF\6B63\9ED1\9AD4;font-weight:bold;color:#0066FF">
        <input type="radio" id="radio1" name="radio"/><label for="radio1" style="padding-right:10px;">自編上傳</label>
        <input type="radio" id="radio2" name="radio" checked="checked" /><label for="radio2" style="padding-right:10px;">線上編輯</label>
        <input type="radio" id="radio3" name="radio" /><label for="radio3">委託編輯</label>
    </div>
    <div>
        <button class="css_btn_class" type="button" id="open">開始編輯</button>
        <button class="css_btn_class" type="button" id="howto">製作流程</button>
        <button type="button" id="faq" style="display:none;">常見問題</button>
    </div>
</div>
<div id="right_block">
    <div style="background-color:#BDEDFF;border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; -o-border-radius: 5px;margin-bottom:5px;text-align:center;">
        <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Ftwdoitwell&amp;width=210&amp;height=80&amp;show_faces=false&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=true" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:210px; height:80px;" allowTransparency="true"></iframe>
    </div>
    <div style="text-align:center;font-size:16px;font-weight:bold">商品組合特惠區</div>
    <div class="banner2">
        <ul>
        </ul>
    </div>
    <div style="margin:15px 0 15px">
    </div>
    <div class="featured">
        <h3 style="font-weight: bold; font-size:16px;padding:3px;color:#625D5D;text-align:center;">作．品．欣．賞</h3>
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
        <%--<button id="checkout" type="button" style="float:right;margin:-30px 20px;">前往結帳</button>--%>
        <button id="upload_comp" type="button" style="float:right;margin:-30px 20px;">上傳完成</button>
    </div>
</div>
<script>
    var g_order_id;
    var g_make_type;
    var g_priceAry = [];

    function open_iframe(url) {
        $('#block').fadeIn();
        $('#iframe').attr('src', url);
        $('#container').fadeIn();   
    };

    function close_iframe() {  
        $('#block').fadeOut();
        $('#container').fadeOut();

        $.ajax({
            type: "POST",
            url: 'HandlerPainter.ashx?action=delete_ck_folder',
            success: function (data){  
            }
        }); 
                        
    };

    $(document).ready(function () {
          
        var session_name;
        var category_name;

        var strHtml = <%=strHtml%>;      

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
                
        var spinIdx = 0;
        category_name = '<%=category_name%>';
        if (category_name == '無框畫')
        {
            $("#noframe_product_information_table").show();
            $("#product_information_table").hide();

            $.each(jsonProduct.Table, function(k, v){            
		        var append_item = '<tr>'+
                '<td style="display:none;">'+v.prod_id+'</td>'+
		        '<td style="display:none;">'+v.height+'x'+v.width+'</td>'+	    
                '<td class=c-Spec>'+ v.width + ' x ' + v.height + ' cm</td>'+
                '<td>'+ v.bleed_width + ' x ' + v.bleed_height + ' cm</td>'+                
                '<td>'+v.pages+'</td>'+
                '<td>$ '+v.price+'</td>'+
                '<td><input id="' + spinIdx + '" class="spinner' + spinIdx + '" style="width: 45px;font-size:18px;color:#0066FF;font-weight:bold;"></td>'+
                '<td class="subTotalPrice' + spinIdx + '"></td>'+
                '<td style="display:none;">' + v.default_amount + '</td>'+
		        '</tr>';            
		        $("#noframe_product_information_table tr:last").after(append_item);
                $('.spinner' + spinIdx).spinner({min:0, max:1000}).val(0);
                g_priceAry.push(v.price);
                $(".spinner" + spinIdx).on( "spin", function( event, ui ){                                                        
                        var p = 0;                                                          
                        p = p + parseInt(g_priceAry[event.target.id]) * ui.value;                    
                        $("#noframe_product_information_table > tbody > tr > td.subTotalPrice" + event.target.id).text('$ ' + p);
                });            
                $(".spinner" + spinIdx).on( "spinchange", function( event, ui ){                                         
                        var p = 0;                                                 
                        p = p + parseInt(g_priceAry[event.target.id]) * event.target.value;                    
                        $("#noframe_product_information_table > tbody > tr > td.subTotalPrice" + event.target.id).text('$ ' + p);
                });   
                spinIdx++;                                    
		    });
        }
        else
        {
            $("#noframe_product_information_table").hide();
            $("#product_information_table").show();

            $.each(jsonProduct.Table, function(k, v){            
		        var append_item = '<tr>'+
                '<td style="display:none;">'+v.prod_id+'</td>'+
		        '<td style="display:none;">'+v.height+'x'+v.width+'</td>'+	    
                '<td class=c-Spec>'+ v.spec+'</td>'+
                '<td>'+v.pages+'</td>'+
                '<td>$ '+v.price+'</td>'+
                '<td><input id="' + spinIdx + '" class="spinner' + spinIdx + '" style="width: 45px;font-size:18px;color:#0066FF;font-weight:bold;"></td>'+
                '<td class="subTotalPrice' + spinIdx + '"></td>'+
                '<td style="display:none;">' + v.default_amount + '</td>'+
		        '</tr>';            
		        $("#product_information_table tr:last").after(append_item);
                $('.spinner' + spinIdx).spinner({min:0, max:1000}).val(0);
                g_priceAry.push(v.price);
                $(".spinner" + spinIdx).on( "spin", function( event, ui ){                                                        
                        var p = 0;                                                          
                        p = p + parseInt(g_priceAry[event.target.id]) * ui.value;                    
                        $("#product_information_table > tbody > tr > td.subTotalPrice" + event.target.id).text('$ ' + p);
                });            
                $(".spinner" + spinIdx).on( "spinchange", function( event, ui ){                                         
                        var p = 0;                                                 
                        p = p + parseInt(g_priceAry[event.target.id]) * event.target.value;                    
                        $("#product_information_table > tbody > tr > td.subTotalPrice" + event.target.id).text('$ ' + p);
                });   
                spinIdx++;                                    
		    });
        }	    

        $("#open").click(function(e){
            //console.log("open click");
            $("#open").attr("disabled", true);
            open_painter(e);
            //$("#open").attr("disabled", false);
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

        $("#upload_comp").button().click(function () {            
            window.location.href = 'MemberCenter.aspx?tabid=2';
        }).css({ 'padding': '5px', 'font-size': '18px' });

        
        var $lastCell = null;
        var mergeCellSelector = ".c-Spec";
        $("#product_information_table tbody td.c-Spec").each(function () {
        //跟上列的td.c-No比較，是否相同
        if ($lastCell && $lastCell.text() == $(this).text()) {
            //取得上一列，將要合併欄位的rowspan + 1
            $lastCell.closest("tr").children(mergeCellSelector).each(function () {
                this.rowSpan = (this.rowSpan || 1) + 1;
            });            
            //將本列被合併的欄位移除
            $(this).closest("tr").children(mergeCellSelector).remove();
        }
        else //若未發生合併，以目前的欄位作為上一欄位
            $lastCell = $(this);
        });
        
        if (category_name == '無框畫')
        {
            $("#noframe_product_information_table").attr('class', 'CSSTableGenerator3');
            $("#noframe_product_information_table tbody td.c-Spec:odd").css({"background-color":"#BCBCBE","color":"#000000"});
            $("#noframe_product_information_table tbody td.c-Spec:even").css({"background-color":"#66DCCA","color":"#ffffff"});
        }
        else
        {
            if (get_category.get.category_id % 2 === 0)
            {
                $("#product_information_table").attr('class', 'CSSTableGenerator2');
                $("#product_information_table tbody td.c-Spec:odd").css({"background-color":"#BCBCBE","color":"#000000"});
                $("#product_information_table tbody td.c-Spec:even").css({"background-color":"#F4A69C","color":"#ffffff"});
            }
            else
            {
                $("#product_information_table").attr('class', 'CSSTableGenerator3');
                $("#product_information_table tbody td.c-Spec:odd").css({"background-color":"#BCBCBE","color":"#000000"});
                $("#product_information_table tbody td.c-Spec:even").css({"background-color":"#66DCCA","color":"#ffffff"});
            }
        }        
    });
	
	function open_painter(e)
	{	        
        var radio_label = $("#radio input[type='radio']:checked").attr('id');// $('input[name=radio]:checked').val();
        session_name = getStorage('user_name');
        category_name = '<%=category_name%>';

        if (session_name == null || session_name == '')
        {
            var painter_width = screen.width;
            var painter_height = screen.height;			
			window.location.href = 'MemberLogin.aspx'
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

        category_name = '<%=category_name%>';

        if (category_name == '無框畫')
        {
            $('#noframe_product_information_table tr:gt(0)').each(function() {
            var prod_id = $(this).find("td").eq(0).html();               
            var amount = $(this).find("input").attr('aria-valuenow')

            if (typeof amount == 'undefined')
                amount = 0;

            if (amount > 0)
                order_json.prod_list.push({"prod_id" : prod_id, "amount" : amount});

            total_amount += parseInt(amount);
            });
        }
        else
        {
            $('#product_information_table tr:gt(0)').each(function() {
            var prod_id = $(this).find("td").eq(0).html();               
            var amount = $(this).find("input").attr('aria-valuenow')

            if (typeof amount == 'undefined')
                amount = 0;

            if (amount > 0)
                order_json.prod_list.push({"prod_id" : prod_id, "amount" : amount});

            total_amount += parseInt(amount);
            });
        }
            

        if (total_amount == 0)
        {
            alert("沒有數量");
            $("#open").attr("disabled", false);
            return false;
        }

        var chk_base_amount = false;

        $('#product_information_table tr:gt(0)').each(function() {
            var default_amount = $(this).find("td").eq(7).html();               
            var amount = $(this).find("input").attr('aria-valuenow')

            if (typeof amount == 'undefined')
                amount = 0;
                            
            if (amount > 0 && amount < (default_amount-1))
            {
                console.log("基本數量 : amount=" + amount + ', default=' + default_amount);
                alert("基本數量不足");
                chk_base_amount = true;
            }
        });    

        if (chk_base_amount == true) {
            $("#open").attr("disabled", false);
            return false;
        }

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
						var params = [
                        'height='+screen.height,
                        'width='+screen.width,
                        'fullscreen=yes' // only works in IE, but here for completeness
                        ].join(',');
						//window.open('painter.html?order_id=' + g_order_id, 'DoItWell Painter','width='+myscreen+',height=740,fullscreen=yes,left=0,top=0').focus();
                        //var popup = window.open('editor01/desktop.aspx?order_id=' + g_order_id, '', params);
                        var popup = window.open('editor01/desktop.aspx?order_id=' + g_order_id, '', params);
                        popup.moveTo(0,0);
                        window.location.href = 'home.aspx';					
                    }
                    else
                    {
                        var create_ed_json = {};
                        create_ed_json.order_id = g_order_id;
                        create_ed_json.user_name = session_name;
                        create_ed_json.category_name = category_name;
                        create_ed_json.CKBaseURL = '~/upload/' + make_type + '/';
                        create_ed_json.CKBaseDIR = 'd:\\doitwell02\\upload\\' + make_type + '\\';
                        create_ed_json.prod_list = order_json.prod_list;
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: 'HandlerPainter.ashx?action=create_' + make_type + '_folder',
                            data: JSON.stringify(create_ed_json),
                            success: function (data){
                                if (data.id == '000')
                                {
                                    open_iframe('./upload.html?make_type=' + make_type + '&order_id=' + g_order_id + '&checkout=true&open_fd=' + data.message + '&show_msg=true');
                                }
                                else
                                    alert(data.message);
                            }
                        }); 
                                                                      
						return false;
                    }                                                          
                }
                else {
                    alert(data.message);
                    window.location.href = 'home.aspx';
                }
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

    var jsonSlider = JSON.parse('<%=jsonSlider%>');
        if (typeof jsonSlider == 'object') {
            $.each(jsonSlider.Table, function (k, v) {
                $(".banner2 > ul").append("<li style='background-image: url(http://" + window.location.hostname  + ":2688/" + v.image_url + ");background-repeat: no-repeat;background-size: 100% 100%;width: 100%;'><div class='inner'></div></li>");
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
<script src="Scripts/unslider.min.js"></script>
<script>
    var unslider = $('.banner2').unslider({
        speed: 800,
        delay: 4500,
        arrows: false,
        fluid: true,
        dots: true
    });
    $('.unslider-arrow').click(function () {
        var fn = this.className.split(' ')[1];

        //  Either do unslider.data('unslider').next() or .prev() depending on the className
        unslider.data('unslider')[fn]();
    });
</script>
</asp:Content>
