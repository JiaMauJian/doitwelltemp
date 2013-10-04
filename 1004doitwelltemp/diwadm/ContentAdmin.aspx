<%@ Page Language="C#" MasterPageFile="~/DiwMaster.master" AutoEventWireup="true" CodeFile="ContentAdmin.aspx.cs" Inherits="ContentAdmin" EnableSessionState="True" ValidateRequest = "false" %>
<%@ Register Assembly="CKFinder" Namespace="CKFinder" TagPrefix="CKFinder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript" src="./Scripts/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./Styles/redmond/jquery-ui-1.10.3.custom.css" />
    <script type="text/javascript" src="./Scripts/jquery-ui-1.10.3.custom.js"></script>

    <link rel="stylesheet" type="text/css" href="./ScriptsJQueryEasyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="./ScriptsJQueryEasyUI/themes/icon.css">
    <script type="text/javascript" src="./ScriptsJQueryEasyUI/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="./Scripts/url.js"></script>

    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>

    <style>
    #user_register_form {
	    -webkit-border-radius: 3px;
	    -moz-border-radius: 3px;
	    border-radius: 3px;
	    margin-right: 3px;
        border:1px solid #cccccc;
        width:600px;
        margin-bottom:20px;
        padding:5px;
    }

    #btnAdd > span.ui-icon-custom { 
        background-image: url('./ScriptsJqueryEasyUI/themes/icons/edit_add.png');
    }

    #btnOpen > span.ui-icon-custom { 
        background-image: url('./ScriptsJqueryEasyUI/themes/icons/active.png');
    }

    #btnClose > span.ui-icon-custom { 
        background-image: url('./ScriptsJqueryEasyUI/themes/icons/deactive.png');
    }
    
    #btnEdit > span.ui-icon-custom { 
        background-image: url('./ScriptsJqueryEasyUI/themes/icons/pencil.png');
    }

    #btnDelete > span.ui-icon-custom { 
        background-image: url('./ScriptsJqueryEasyUI/themes/icons/cancel.png');
    }
    </style>

    <body>
            <div id="system_message" class="ui-state-error ui-corner-all" style="width:500px;margin-left:20px;margin-bottom:10px;padding:5px;display:none;">系統訊息: </div>

            <div id="category_name" style="font-size:medium; font-weight:bold; color:blue; padding-left:20px;"></div><br/>

            <div style="padding-left:20px">
                <div id="editor1">
                </div>
                <p style="color:red"><strong>※網頁寬度為 725px</strong></p>
            </div>            

            <script>
                CKEDITOR.replace('editor1',
                {
                    filebrowserBrowseUrl: '/ckfinder/ckfinder.html',
                    filebrowserImageBrowseUrl: '/ckfinder/ckfinder.html?type=Images',
                    //filebrowserFlashBrowseUrl: '/ckfinder/ckfinder.html?type=Flash',
                    //filebrowserUploadUrl: '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',
                    //filebrowserImageUploadUrl: '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images'
                    //filebrowserImageUploadUrl: '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images&currentFolder=/upload/fm/images',
                    //filebrowserFlashUploadUrl: '/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'
                });
            </script>

            <div style="padding-left:20px;padding-top:10px">
                <button type="button" id="send_html">儲存</button>
            </div>            

            <div id="system_message2" class="ui-state-error ui-corner-all" style="width:500px;margin-left:20px;margin-bottom:10px;padding:5px;display:none;">系統訊息: </div>

            <div style="padding-left:20px;padding-top:10px">        
                <div id="product_form" style="display:none" >
                    <table summary="product detail">
                        <tr>
                            <td></td>
                            <td>
                                <div>
                                    <h3 style="color: #1c94c4;font-weight: bold;">修改產品規格</h3>
                                    <img id="hide_form" src='images/icons/gtk-delete.png' border="0" style="cursor:pointer; float:right" onclick="$('#product_form').slideUp();">                          
                                </div>                    
                                <div class="form_notice_text">
                                    <br/>(*)星號為必填欄位。
                                </div>                    
                            </td>                    
                        </tr>
                        <tr style="display:none">
                            <td align="right" valign="bottom"><label>*類別</label></td>
                            <td>                                        
                                <select name="category" size="0"></select>                                                 
                            </td>            
                        </tr>
                        <tr>
                            <td align="right" valign="top"><label>產品編號</label></td>
                            <td>
					            <input type="text" name="prod_id" size="20" disabled/>
                            </td>            
                        </tr>
                        <tr>
                            <td align="right" valign="top"><label>*產品-寬(cm)</label></td>
                            <td>
					            <input type="text" name="width" size="20"/>
                            </td>            
                        </tr>
                        <tr>
                            <td align="right" valign="top"><label>*產品-高(cm)</label></td>
                            <td>
					            <input type="text" name="height" size="20"/>
                            </td>            
                        </tr>
                        <tr>
                            <td align="right" valign="top"><label>出血-寬(cm)</label></td>
                            <td>
					            <input type="text" name="bleed_width" size="20"/>
                            </td>            
                        </tr>
                        <tr>
                            <td align="right" valign="top"><label>出血-高(cm)</label></td>
                            <td>
					            <input type="text" name="bleed_height" size="20"/>
                            </td>            
                        </tr>
                        <tr>
                            <td align="right" valign="top"><label>頁數</label></td>
                            <td>
					            <input type="text" name="pages" size="20"/>
                            </td>            
                        </tr>
                        <tr>
                            <td align="right" valign="top"><label>其它規格細項</label></td>
                            <td>
					            <input type="text" name="spec" size="100" />
                            </td>            
                        </tr>                
                        <tr>
                            <td align="right" valign="top"><label>*價錢</label></td>
                            <td>
					            <input type="text" name="price" size="20" />
                            </td>            
                        </tr>
				        <tr>
                            <td align="right" valign="top"></td>
                            <td>
					            <input type="button" id="add_button" name="add_button" value="新增" />
						        <input type="button" id="update_button" name="update_button" value="更新" />
                            </td>            
                        </tr>
				
                    </table>
                </div>
                <div style="font-size:medium;display:none;">
                    <span style="padding:5px">類別列表</span>
                    <select name="category_list" size="0"></select>
                </div>
                <table id="dg" title="產品管理" class="easyui-datagrid" style="width:1200px;height:500px;"
                url="./HandlerProductAdm.ashx?action=product_query&category=<%=category%>"
                toolbar="#toolbar"
                rownumbers="false" fitColumns="false" singleSelect="true" pagination="true" pageSize="20">
                <thead frozen="true">
                    <tr>
                        <th field="status" width="50" formatter="formatStatus">狀態</th>
                        <th field="prod_id" width="70">產品編號</th>            
                        <th field="category" width="100">類別</th>
                    </tr>
                </thead>
                <thead>
                    <tr>                
                        <th field="width" width="90">產品-寬(cm)</th>
                        <th field="height" width="90">產品-高(cm)</th>
                        <th field="bleed_width" width="90">出血-寬(cm)</th>
                        <th field="bleed_height" width="90">出血-高(cm)</th>                
                        <th field="pages" width="50">頁數</th>
                        <th field="spec" width="450">規格</th>
                        <th field="discount" width="70">產品折扣</th>
                        <th field="price" width="100">價錢</th>                                  
                    </tr>
                </thead>
            </table>
                <div id="toolbar">
                <table cellspacing="0" cellpadding="0">
                    <td>
                        <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="Add()">新增</a>
		                <a href="#" class="easyui-linkbutton" iconCls="icon-active" plain="true" onclick="Open()">開啟</a>
		                <a href="#" class="easyui-linkbutton" iconCls="icon-deactive" plain="true" onclick="Close()">關閉</a>
		                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="Edit()">修改</a>
                        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="Delete()">刪除</a> --%>
                        <button id="btnAdd" type="button" onclick="Add()">新增</button>
                        <button id="btnOpen" type="button" onclick="Open()">開啟</button>
                        <button id="btnClose" type="button" onclick="Close()">關閉</button>
                        <button id="btnEdit" type="button" onclick="Edit()">修改</button>
                        <button id="btnDelete" type="button" onclick="Delete()">刪除</button>                
                    </td>
                    <td>
                        <div class="datagrid-btn-separator"></div>
                    </td>   
                    <td>
                        <span style="padding:5px">搜尋欄位:</span>
                        <select id="query_field" name="query_field">			
			                <option value="width" label="">產品-寬(cm)</option>
                            <option value="height" label="">產品-高(cm)</option>
                            <option value="bleed_width" label="">出血-寬(cm)</option>
                            <option value="bleed_height" label="">出血-高(cm)</option>
                            <option value="pages" label="">頁數</option>
                            <option value="spec" label="">規格</option>
                            <option value="discount" label="">產品折扣</option>
                            <option value="price" label="">價錢</option>
                            <option value="status" label="">狀態</option>
		                </select>
                        關鍵字: <input id="keyword" style="line-height:26px;border:1px solid #ccc">
                        <%--<a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()">搜尋</a>--%>
                        <button id="btnSearch" type="button" onclick="doSearch()">搜尋</button>
                    </td>
                </table>            
            </div>
            </div>
                        
            <script>
                var get_block = url.parse(location.search);
                $("#send_html").button();
                $("#send_html").click(function () {
                    var editor = CKEDITOR.instances.editor1;
                    editor.updateElement();
                    var json = {};
                    json.html = editor.getData();
                    var json = jQuery.parseJSON(JSON.stringify(json));
                    console.log(json);


                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: './HandlerCategoryAdm.ashx?action=save_html&' + get_block.query,
                        data: json,
                        success: function (data) {
                            console.log(data);
                            if (data) {
                                if (data.id == '000') {
                                    alert(data.message);
                                    return false;
                                };
                                if (data.id != '000') {
                                    $("#system_message").slideDown().html(data.message);
                                };
                            };
                        }
                    });
                });

            </script>

-           <script>
                $(document).ready(function () {
                    console.log(location.search);
                    var get_block = url.parse(location.search);
                    console.log(get_block);

                    console.log('./HandlerCategoryAdm.ashx?action=query_html&' + get_block.query);
                    $.getJSON('./HandlerCategoryAdm.ashx?action=query_html&' + get_block.query, function (json) {
                        console.log(json);
                        var editor = CKEDITOR.instances.editor1;
                        editor.setData(json.html);
                        $('#category_name').html(json.category + " 內容編輯");
                    });

                    $("#btnAdd").button({
                        text: true,
                        icons: {
                            primary: 'ui-icon-custom'
                        }
                    })

                    $("#btnOpen").button({
                        text: true,
                        icons: {
                            primary: 'ui-icon-custom'
                        }
                    })

                    $("#btnClose").button({
                        text: true,
                        icons: {
                            primary: 'ui-icon-custom'
                        }
                    })

                    $("#btnEdit").button({
                        text: true,
                        icons: {
                            primary: 'ui-icon-custom'
                        }
                    })

                    $("#btnDelete").button({
                        text: true,
                        icons: {
                            primary: 'ui-icon-custom'
                        }
                    })
                    $("#btnSearch").button();
                });
            </script>

            <script type="text/javascript" src="./Scripts/ProductAdmin.js"></script>
    </body>
</asp:Content>
