<%@ Page Title="" Language="C#" MasterPageFile="~/DoMaster.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Styles/unslider.css" rel="stylesheet" type="text/css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <style type="text/css">
    #recommend_marquee{
        overflow:hidden;height:140px;
        width:700px;
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

    <div class="banner">
        <ul>
        </ul>
    </div>
    <%--    <div style="height: 325px; background-image: url('Images/slider-bg.jpg');">
    </div>--%>
    <div>

        <table style="width: 100%;">
            <tr>
                <td style="width: 750px" valign="top">&nbsp;</td>
                <td style="width: 10px" valign="top">&nbsp;</td>
                <td style="width: 223px" valign="top">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 750px" valign="top">
                    <div>
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <div class="featured2">
                                        <h6>感謝您的推薦與分享.....</h6>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="featured3">
                                        <div id="recommend_marquee" onMouseover="copyspeed=pausespeed" onMouseout="copyspeed=marqueespeed">
                                            
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="width: 10px" valign="top">&nbsp;</td>
                <td style="width: 223px" valign="top">

                    <table style="width: 100%;">
                        <tr>
                            <td valign="top">
                                <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Ftwdoitwell&amp;width=210&amp;height=80&amp;show_faces=false&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=true" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:210px; height:80px;" allowTransparency="true"></iframe>

                                <br />
                                <asp:LinkButton ID="LinkButton15" runat="server">獨一無二Doitwell藝騋廣告</asp:LinkButton>
                            </td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td style="width: 750px" valign="top">&nbsp;</td>
                <td style="width: 10px" valign="top">&nbsp;</td>
                <td style="width: 223px" valign="top"></td>
            </tr>
            <tr>
                <td valign="top">
                    <div id="category">
                    
                    </div>
                </td>
                <td valign="top" style="width: 10px">&nbsp;</td>
                <td valign="top">
                    <div>
                        <table id="product" cellpadding="5" cellspacing="5" style="width: 100%;">
                            <tr>
                                <td >
                                    
                                </td>
                            </tr>
                            <div class="featured">
                                <h3 style="font-weight: bold; font-size:16px;padding:3px;">作品欣賞</h3>
                                <div id="product_marquee" onMouseover="copyspeed2=pausespeed2" onMouseout="copyspeed2=marqueespeed2" align="center">
                                    <div id="vmarquee2" style="position: absolute; width: 100%;" align="center"></div>
                                </div>


                            </div>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <script>
        var jsonSlider = JSON.parse('<%=jsonSlider%>');
        if (typeof jsonSlider == 'object') {
            $.each(jsonSlider.Table, function (k, v) {
                $(".banner > ul").append("<li style='background-image: url(http://" + window.location.hostname  + ":2688/" + v.image_url + ");background-repeat: no-repeat;background-size: 100% 100%;width: 100%;'><div class='inner'></div></li>");
            });
        }

        var jsonRecommend = JSON.parse('<%=jsonRecommend%>');
        if (typeof jsonRecommend == 'object') {
            $.each(jsonRecommend.Table, function (k, v) {
                $("#recommend_marquee").append('<div ><a href="' + v.image_url + '" target="_blank">' + v.content + '</a></div>');
            });
        }

        var jsonProduct = JSON.parse('<%=jsonProduct%>');
        if (typeof jsonProduct == 'object') {
            $.each(jsonProduct.Table, function (k, v) {
                $("#product_marquee > div[id='vmarquee2']").append('<div align="center" style="padding-bottom:10px;"><a href="http://' + window.location.hostname + '/' + v.content + '"><img src="http://' + window.location.hostname + ':2688/' + v.image_url + '" border="0" width="150" align="center"></a></div>') 
            });
        }
    </script>
    <script type="text/javascript">
    
    var delayb4scroll=2000; //Specify initial delay before marquee starts to scroll on page (2000=2 seconds)
    var marqueespeed=2; //Specify marquee scroll speed (larger is faster 1-10)
    var pauseit=1; //Pause marquee onMousever (0=no. 1=yes)?

    var copyspeed=marqueespeed;
    var pausespeed=(pauseit==0)? copyspeed: 0;
    var actualheight='';

    function scrollmarquee(){
        if (parseInt(cross_marquee.style.top)>(actualheight*(-1)+8)) //if scroller hasn't reached the end of its height
        cross_marquee.style.top=parseInt(cross_marquee.style.top)-copyspeed+"px"; //move scroller upwards
        else //else, reset to original position
        cross_marquee.style.top=parseInt(marqueeheight)+8+"px";
    }

    function initializemarquee(){
        cross_marquee=document.getElementById("vmarquee2");
        cross_marquee.style.top=0;
        marqueeheight=document.getElementById('product_marquee').offsetHeight;
        actualheight=cross_marquee.offsetHeight; //height of marquee content (much of which is hidden from view)
        if (window.opera || navigator.userAgent.indexOf("Netscape/7")!=-1){ //if Opera or Netscape 7x, add scrollbars to scroll and exit
            cross_marquee.style.height=marqueeheight+"px";
            cross_marquee.style.overflow="scroll";
        return;
        }
        setTimeout('lefttime=setInterval("scrollmarquee()",30)', delayb4scroll);
    }
    
    var ads_product_marquee = '<%=ads_product_marquee%>';
    if(ads_product_marquee == 'Y'){
        if (window.addEventListener)
            window.addEventListener("load", initializemarquee, false);
        else if (window.attachEvent)
            window.attachEvent("onload", initializemarquee);
        else if (document.getElementById)
            window.onload=initializemarquee;
    };
    </script>

    <script>
    function slideLine(box,stf,delay,speed,h)
    {
      //取得id
      var slideBox = document.getElementById(box);
      //預設值 delay:幾毫秒滾動一次(1000毫秒=1秒)
      //       speed:數字越小越快，h:高度
      var delay = delay||1000,speed = speed||20,h = h||20;
      var tid = null,pause = false;
      //setInterval跟setTimeout的用法可以咕狗研究一下~
      var s = function(){tid=setInterval(slide, speed);}
      //主要動作的地方
      var slide = function(){
      //當滑鼠移到上面的時候就會暫停
        if(pause) return;
      //滾動條往下滾動 數字越大會越快但是看起來越不連貫，所以這邊用1
        slideBox.scrollTop += 1;
      //滾動到一個高度(h)的時候就停止
        if(slideBox.scrollTop%h == 0){
      //跟setInterval搭配使用的
          clearInterval(tid);
      //將剛剛滾動上去的前一項加回到整列的最後一項
        if (slideBox.getElementsByTagName(stf).length > 0)
          slideBox.appendChild(slideBox.getElementsByTagName(stf)[0]);
      //再重設滾動條到最上面
          slideBox.scrollTop = 0;
      //延遲多久再執行一次
          setTimeout(s, delay);
        }
      }
      //滑鼠移上去會暫停 移走會繼續動
      slideBox.onmouseover=function(){pause=true;}
      slideBox.onmouseout=function(){pause=false;}
      //起始的地方，沒有這個就不會動囉
      setTimeout(s, delay);
    }
    //網頁load完會執行一次
    //五個屬性各別是：外面div的id名稱、包在裡面的標籤類型
    //延遲毫秒數、速度、高度
    slideLine('recommend_marquee','div',2000,25,20);    
    </script>

    
    <script src="Scripts/unslider.min.js"></script>
    <script>
        var unslider = $('.banner').unslider({
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

