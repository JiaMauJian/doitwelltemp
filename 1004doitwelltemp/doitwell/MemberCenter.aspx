<%@ Page Title="" Language="C#" MasterPageFile="~/DoMaster.master" AutoEventWireup="true" CodeFile="MemberCenter.aspx.cs" Inherits="MemberCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="Styles/ui-lightness/jquery-ui-1.10.3.custom.css" />
<script type="text/javascript" src="Scripts/jquery-ui-1.10.3.custom.js"></script>

<link rel="stylesheet" type="text/css" href="./ScriptsJQueryEasyUI/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="./ScriptsJQueryEasyUI/themes/icon.css">
<script type="text/javascript" src="./ScriptsJQueryEasyUI/jquery.easyui.min.js"></script>

<script type="text/javascript" src="Scripts/aj-address.js"></script>
<script src="Scripts/jquery.currency.js" type="text/javascript"></script>
<script src="Scripts/localStorage.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="Styles/doitwell.css" />
<link rel="stylesheet" type="text/css" href="Styles/member.css" />
<link href="Styles/diwTable.css" rel="stylesheet" type="text/css" />

<style>

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

</style>

<script type="text/javascript">
    $(document).ready(function () {
        $("#submit_button").button().css({ "font-size": "12px" });
        $("#member_update").button().css({ "font-size": "12px" });
        $("#update_button").button().css({ "font-size": "12px" });
		$("#checkout_button").button().css({ "font-size": "12px","padding-left":"20px","padding-right":"20px" });
        $("#order_query").button().css({ "font-size": "12px" });
        $("#shop_car").button().css({ "font-size": "12px" });
        $("#goPainter").button().css({ "font-size": "12px" }).click(function () {
            $.getJSON('HandlerOrder.ashx?action=member_order_id_query&user_id=' + getStorage('user_id'), function (data) {
                if (data.id == '000') {
                    myWindow = window.open('painter.html?order_id=' + data.message, 'DoItWell Painter', 'width=1250,height=740,fullscreen=yes,left=0,top=0');
                    myWindow.focus();
                };
            });
        });
        $("#closebtn").button().click(function () {
            close_iframe();
        });
        goShopCar();

        $('#member_center_tabs').tabs({
            onSelect: function (title, index) {
                console.log(title + ' ' + index);
                if (index == 0) {
                    goMemberUpdate();
                }
                else if (index == 1) {
                    goOrder();
                }
                else if (index == 2) {
                    goShopCar();
                }
            }
        });

        var t = $('#member_center_tabs');
        var tabs = t.tabs('tabs');
        t.tabs('select', tabs[1].panel('options').title);
    });

    function gotoWorkList() {
        var t = $('#member_center_tabs');
        var tabs = t.tabs('tabs');
        t.tabs('select', tabs[2].panel('options').title);
    };
</script>

<div id="system_message" class="ui-state-error ui-corner-all"></div>

<div id="member_center_tabs" class="easyui-tabs" style="height:auto;">
    <div title="會員資料" style="padding:10px" onclick="goMemberUpdate();">
        <div id="update_member_info_form">
	        <form id="front_user_register_form">
            <table summary="user register" >
    	        <tr>
    		        <td></td>
    		        <td>會員資料更新</td>    		
    	        </tr>
                <tr>
                    <td align="right" valign="bottom"><label>帳號</label></td>
                    <td>
                        <span id="user_name"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="bottom"><label>姓名</label></td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" name="real_name" size="20" style="background-color:LightYellow;"/></td>
                            </tr>
                        </table>                

                    </td>            
                </tr>                
                <tr>
                    <td align="right" valign="bottom"><label>密碼</label></td>
                    <td>
                        <input type="password" name="password" size="12" style="background-color:LightYellow;"/>
                        <label>確認密碼</label>
                        <input type="password" name="confirm_password" size="12" style="background-color:LightYellow;"/>
                    </td>
                </tr>
        
                <tr>
                    <td align="right" valign="bottom"><label>性別</label></td>
                    <td>
                        <select name="gender" size="0" style="background-color:LightYellow;">
                        <option value="" selected="selected"></option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="bottom"><label>生日</label></td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <select name="birthday_year" size="0" style="background-color:LightYellow;">
                                        <option selected="selected"></option>
                                        <option value="1995">1995</option>
                                        <option value="1994">1994</option>
                                        <option value="1993">1993</option>
                                        <option value="1992">1992</option>
                                        <option value="1991">1991</option>
                                        <option value="1990">1990</option>
                                        <option value="1989">1989</option>
                                        <option value="1988">1988</option>
                                        <option value="1987">1987</option>
                                        <option value="1986">1986</option>
                                        <option value="1985">1985</option>
                                        <option value="1984">1984</option>
                                        <option value="1983">1983</option>
                                        <option value="1982">1982</option>
                                        <option value="1981">1981</option>
                                        <option value="1980">1980</option>
                                        <option value="1979">1979</option>
                                        <option value="1978">1978</option>
                                        <option value="1977">1977</option>
                                        <option value="1976">1976</option>
                                        <option value="1975">1975</option>
                                        <option value="1974">1974</option>
                                        <option value="1973">1973</option>
                                        <option value="1972">1972</option>
                                        <option value="1971">1971</option>
                                        <option value="1970">1970</option>
                                        <option value="1969">1969</option>
                                        <option value="1968">1968</option>
                                        <option value="1967">1967</option>
                                        <option value="1966">1966</option>
                                        <option value="1965">1965</option>
                                        <option value="1964">1964</option>
                                        <option value="1963">1963</option>
                                        <option value="1962">1962</option>
                                        <option value="1961">1961</option>
                                        <option value="1960">1960</option>
                                        <option value="1959">1959</option>
                                        <option value="1958">1958</option>
                                        <option value="1957">1957</option>
                                        <option value="1956">1956</option>
                                        <option value="1955">1955</option>
                                        <option value="1954">1954</option>
                                        <option value="1953">1953</option>
                                        <option value="1952">1952</option>
                                        <option value="1951">1951</option>
                                        <option value="1950">1950</option>
                                        <option value="1949">1949</option>
                                        <option value="1948">1948</option>
                                        <option value="1947">1947</option>
                                        <option value="1946">1946</option>
                                        <option value="1945">1945</option>
                                        <option value="1944">1944</option>
                                        <option value="1943">1943</option>
                                        <option value="1942">1942</option>
                                        <option value="1941">1941</option>
                                        <option value="1940">1940</option>
                                        <option value="1939">1939</option>
                                        <option value="1938">1938</option>
                                        <option value="1937">1937</option>
                                        <option value="1936">1936</option>
                                        <option value="1935">1935</option>
                                        <option value="1934">1934</option>
                                        <option value="1933">1933</option>
                                        <option value="1932">1932</option>
                                        <option value="1931">1931</option>
                                        <option value="1930">1930</option>
                                        <option value="1929">1929</option>
                                        <option value="1928">1928</option>
                                        <option value="1927">1927</option>
                                        <option value="1926">1926</option>
                                        <option value="1925">1925</option>
                                        <option value="1924">1924</option>
                                        <option value="1923">1923</option>
                                        <option value="1922">1922</option>
                                        <option value="1921">1921</option>
                                        <option value="1920">1920</option>
                                        <option value="1919">1919</option>
                                        <option value="1918">1918</option>
                                        <option value="1917">1917</option>
                                        <option value="1916">1916</option>
                                        <option value="1915">1915</option>
                                        <option value="1914">1914</option>
                                        <option value="1913">1913</option>
                                        <option value="1912">1912</option>
                                        <option value="1911">1911</option>
                                        <option value="1910">1910</option>
                                    </select>
                                </td>
                                <td><label>年</label></td>
                                <td>
                                <select name="birthday_month" size="0" style="background-color:LightYellow;">
                        	        <option selected="selected"></option>
                        	        <option value="1">1</option>
                        	        <option value="2">2</option>
                        	        <option value="3">3</option>
                        	        <option value="4">4</option>
                        	        <option value="5">5</option>
                        	        <option value="6">6</option>
                        	        <option value="7">7</option>
                        	        <option value="8">8</option>
                        	        <option value="9">9</option>
                        	        <option value="10">10</option>
                        	        <option value="11">11</option>
                        	        <option value="12">12</option>
                                </select>
                                </td>
                                <td><label>月</label></td>
                                <td>
                                <select name="birthday_day" size="0" style="background-color:LightYellow;">
                        	        <option selected="selected"></option>
                        	        <option value="1">1</option>
                        	        <option value="2">2</option>
                        	        <option value="3">3</option>
                        	        <option value="4">4</option>
                        	        <option value="5">5</option>
                        	        <option value="6">6</option>
                        	        <option value="7">7</option>
                        	        <option value="8">8</option>
                        	        <option value="9">9</option>
                        	        <option value="10">10</option>
                        	        <option value="11">11</option>
                        	        <option value="12">12</option>
                        	        <option value="13">13</option>
                        	        <option value="14">14</option>
                        	        <option value="15">15</option>
                        	        <option value="16">16</option>
                        	        <option value="17">17</option>
                        	        <option value="18">18</option>
                        	        <option value="19">19</option>
                        	        <option value="20">20</option>
                        	        <option value="21">21</option>
                        	        <option value="22">22</option>
                        	        <option value="23">23</option>
                        	        <option value="24">24</option>
                        	        <option value="25">25</option>
                        	        <option value="26">26</option>
                        	        <option value="27">27</option>
                        	        <option value="28">28</option>
                        	        <option value="29">29</option>
                        	        <option value="30">30</option>
                        	        <option value="31">31</option>
                                </select>
                                </td>
                                <td><label>日</label></td>     
                            </tr>
                        </table>                

                    </td>            
                </tr>
    	        <tr>
                    <td align="right" valign="bottom"><label>電話</label></td>
                    <td>
                        <input type="text" name="telephone" size="12" style="background-color:LightYellow;"/>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="bottom"><label>手機</label></td>
                    <td>
                        <input type="text" name="mobile" size="12" style="background-color:LightYellow;"/>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="bottom"><label>Email</label></td>
                    <td>
                        <input type="text" name="email" size="35" style="background-color:LightYellow;"/>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="bottom"><label>收件地址</label></td>
                    <td>
                        <input id="zipcode" name="zipcode" type="text" style="width: 30px;" disabled="disabled" />
                        <select id="city" name="city" style="background-color:LightYellow;"></select>
                        <select id="locality" name="locality" style="background-color:LightYellow;"></select>
                        <input type="text" name="address" size="60" style="background-color:LightYellow;" />
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="bottom"></td>
                    <td>
            	        <input type="button" id="update_button" name="update_button" value="更新" />
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
    <div title="訂單查詢" style="padding:10px">
        <div id="order_information" class="table_style">
	        <form id="front_order_info_form">
                <div id="goEdit" onclick="gotoWorkList()" style="cursor:pointer;color:blue;padding:5px 0 10px 0;font-size:12px;font-family:\5FAE\8EDF\6B63\9ED1\9AD4;text-decoration:underline;"></div>
                <table class='CSSTableGenerator' id="order_information_table" width="940px">
                    <tr>
                        <td class="for_center" width="8%">訂單編號</td>
                        <td class="for_center" width="20%">商品</td>
                        <td class="for_center" width="7%">類別</td>
                        <td class="for_center" width="7%">尺寸</td>
                        <td class="for_center" width="10%">規格</td>
                        <td class="for_center" width="5%">頁數</td>                        
                        <td class="for_center" width="7%">價格</td>
                        <td class="for_center" width="20%">交代事項</td>
                        <td class="for_center" width="8%">方式</td>
                        <td class="for_center" width="8%">狀態</td>
                    </tr>
                </table>
	            <div>
		            合計金額: <span id="order_total_price" style="color:red;font-weight:bold;"></span>
		            <br/>
		            折扣後金額: <span id="order_total_price_after_discount" style="color:red;font-weight:bold;"></span>
	            </div>
            </form>
            <hr style="margin-top:5px;margin-bottom:5px;">
            <ul>
                <li>若有任何訂單問題請聯絡<a href="#">客服中心</a>，我們將在1~2日內（不含例假日）盡速以mail回覆您。</li>
                <li>查詢訂單詳情及處理進度(如商品明細 / 配送狀況等...)請點選購物車序號(明細)查詢。</li>
                <li>商品將於您付款成功後七個工作天內送達；特殊商品寄送請參考各網頁的說明。</li>
                <li>發票會在付款完成、出貨後開立，並儲存為電子檔供您查看，您若需要正本，可隨時使用馬上寄給我索取 (已捐贈、已索取的發票除外)，詳情請參考<br /> &nbsp;「<a href="#">發票託管流程說明</a>」。</li>
                <li>三聯式發票、索取發票將會在廠商完成出貨後10個工作天寄出，約2-7個工作天內送達，如遇國定假日將順延寄送。</li>
                <li>為加速為您處理的速度，請先詳讀相關<a href="#">維修</a>&nbsp;/&nbsp;<a href="#">換貨</a>&nbsp;/&nbsp;<a href="#">退貨</a>&nbsp;/&nbsp;<a href="#">取消</a>&nbsp;辦法後，再點選維修/退貨/換貨/取消。</li>
            </ul>
        </div>
    </div>
    <div title="作品清單" style="padding:10px">
        <div id="shopcar_info" class="table_style">   
            <form id="front_shopcar_info_form">
            <!--
	        <button type="button" id="goPainter">進入工作桌</button>
	        -->
            <li style="color:blue;font-size:12px;font-family:\5FAE\8EDF\6B63\9ED1\9AD4">編輯中未完成作品</li>
                <table class='CSSTableGenerator' id="painter_open_table" width="940px">
                    <tr>
                        <td class="for_center" width="20%">商品</td>
                        <td class="for_center" width="10%">類別</td>
                        <td class="for_center" width="10%">尺寸</td>
                        <td class="for_center" width="10%">規格</td>
                        <td class="for_center" width="5%">頁數</td>
                        <td class="for_center" width="5%">幅/本</td>
                        <td class="for_center" width="10%">價格</td>
                        <td class="for_center" width="10%">交代事項</td>
                        <td class="for_center" width="10%">開啟</td>
                    </tr>
                </table>

            <hr style="margin-top:5px;margin-bottom:5px;">

            <li style="color:red;font-size:12px;font-family:\5FAE\8EDF\6B63\9ED1\9AD4">已完成待結帳作品</li>
                <table class='CSSTableGenerator' id="painter_finish_table" width="940px">
                    <tr>
                        <td class="for_center" width="20%">商品</td>
                        <td class="for_center" width="10%">類別</td>
                        <td class="for_center" width="10%">尺寸</td>
                        <td class="for_center" width="10%">規格</td>
                        <td class="for_center" width="5%">頁數</td>
                        <td class="for_center" width="5%">幅/本</td>
                        <td class="for_center" width="10%">價格</td>
                        <td class="for_center" width="10%">交代事項</td>
                        <td class="for_center" width="10%">開啟</td>            
                    </tr>
                </table>
		        <div align="right" style="padding-top:10px;">
			        <button type="button" id="checkout_button" onclick="checkout();">直接進入結帳</button>
		        </div>

            <hr style="margin-top:5px;margin-bottom:5px;">

            <li style="color:purple;font-size:12px;font-family:\5FAE\8EDF\6B63\9ED1\9AD4">自編上傳/委託編輯</li>
            <table class='CSSTableGenerator' id="vendor_make_table" width="940px">
                <tr>
                    <td class="for_center" width="20%">商品</td>
                    <td class="for_center" width="10%">類別</td>
                    <td class="for_center" width="10%">尺寸</td>
                    <td class="for_center" width="10%">規格</td>
                    <td class="for_center" width="5%">頁數</td>
                    <td class="for_center" width="5%">幅/本</td>
                    <td class="for_center" width="10%">價格</td>
                    <td class="for_center" width="20%">交代事項</td>
                    <td class="for_center" width="10%">開啟</td>                                  
                </tr>
            </table>

            <hr style="margin-top:5px;margin-bottom:5px;">

            <li style="color:green;font-size:12px;font-family:\5FAE\8EDF\6B63\9ED1\9AD4">已結帳製作中</li>
            <table class='CSSTableGenerator' id="painter_close_table" width="940px">
                <tr>
                    <td class="for_center" width="20%">商品</td>
                    <td class="for_center" width="10%">類別</td>
                    <td class="for_center" width="10%">尺寸</td>
                    <td class="for_center" width="10%">規格</td>
                    <td class="for_center" width="5%">頁數</td>
                    <td class="for_center" width="5%">幅/本</td>
                    <td class="for_center" width="10%">價格</td>
                    <td class="for_center" width="10%">交代事項</td>
                    <td class="for_center" width="10%">開啟</td>                    
                </tr>
            </table>
	        <div style="display:none;">
		        合計金額: <span id="shop_total_price" style="color:red;font-weight:bold;"></span>
		        <br/>
		        折扣後金額: <span id="shop_total_price_after_discount" style="color:red;font-weight:bold;"></span>
	        </div>
            </form>
        </div>
    </div>
</div>

<div id="block"></div>
<div id="container">
    <div>
        <button id="closebtn" type="button"  style="float:right;margin:10px 20px;">關閉</button>
    </div>    
    <div style="margin:30px">
        <iframe id="iframe" style="width:100%;height:550px;outline:1px solid red;"></iframe>
    </div>    
</div>

<script type="text/javascript" src="Scripts/Member.js"></script>
</asp:Content>
