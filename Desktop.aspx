<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Desktop.aspx.cs" Inherits="Desktop" %>
<%@ Register Assembly="CKFinder" Namespace="CKFinder" TagPrefix="CKFinder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DoItWell 線上編輯</title>
	<link rel="stylesheet" href="Styles/Site.css" type="text/css" media="all" />
	<link rel="stylesheet" href="Styles/menuTab.css" type="text/css" media="all" /> 
	<link rel="stylesheet" href="Styles/styleMenu.css" type="text/css" media="all" />   
	<script src="Scripts/MenuTab.js" type="text/javascript"></script>
    
    <%--fabricjs library--%>
    <script src="../painter/all.js" type="text/javascript"></script>
    <script src="../painter/jquery-1.10.2.min.js" type="text/javascript"></script>
    <%--fabricjs library--%>

    <%--drag function--%>
    <script src="Scripts/modernizr.custom.50476.js" type="text/javascript"></script>
    <%--drag function--%>

    <%--jquery ui--%>
    <link href="../painter/ui-lightness/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" type="text/css" />
    <script src="../painter/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../painter/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
    <%--jquery ui--%>
    <%--Joe edit--%>
    <script src="../Scripts/localStorage.js" type="text/javascript"></script>
    <script src="../Scripts/url.js" type="text/javascript"></script>
    <script src="../ckfinder/ckfinder.js" type="text/javascript"></script>
    <style>
        #container {
            width: 1000px; 
            height: 665px; 
            display: none; 
            position: fixed;    
            background:#E9F5FE;    
            border: 1px solid 555;
            box-shadow: 2px 2px 40px #222; 
            z-index:9999;    
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
            z-index:9999;
        }
        
        #tbar_delete > span.ui-icon-custom { 
            background-image: url('../Editor01/images/gtk-delete.png');
        }
    </style>
    <%--Joe edit--%>
</head>
<body onload="clearLinkDot();">
    <form id="form1" runat="server">
    <div id="MainScope">
        <div id="topMenu">

            <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                <tr>
                    <td width="150">
                        &nbsp;</td>
                    <td>
                        <div id='cssmenu'>
                        <ul>
                           <li><a href='#'><span>放大</span></a></li>
                           <li><a href='#'><span>縮小</span></a></li>
                           <li><a href='#'><span>復原</span></a></li>
                           <li><a href='#'><span>重做</span></a></li>
                           <li><a href='#'><span>參考</span></a></li>
                           <%--Joe edit--%>
                           <li><a href="javascript:void(0);" id="open"><span>圖片上傳</span></a></li>
                           <%--Joe edit--%>
                           <li class='last' style='color:white'><a><span id='canvas_info'></span></a></li>
                        </ul>
                        </div>                        
                    </td>                    
                    <td>
                        &nbsp;</td>
                    <td align="right" style="background-color: #003366" width="250">
                        <div id='cssmenu1'>       
                        <ul>
                           <li class='active'><a href='#'><span>儲存</span></a></li>
                           <li><a href='#'><span>預覽</span></a></li>                           
                           <li><a href='#'><span>作品清單</span></a>
								
								<ul style="background-color:green;margin-top:28px;width:300px;left:-140px;text-align:left;border-radius:0px;border:1px solid white;">									
                                    <asp:Literal ID="litWorkList" runat="server"></asp:Literal>
								</ul>
								
						   </li>                     
                           <li class='last'><a href='#'><span>完成編輯</span></a></li>
                        </ul>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="templateMenu"></div>
        <div id="lftMenu">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <div id="tabsF">
	            <ul>
		            <li id="current"><a href="javascript://" onclick="loadTab(this,1);"><span>照片</span><asp:Image ID="Image1" runat="server" ImageUrl="Images/icn_121.png"/></a></li>
		            <li><a href="javascript://" onclick="loadTab(this,2);"><span>文字</span><asp:Image ID="Image2" runat="server" ImageUrl="Images/icn_068.png"/></a></li>
		            <li><a href="javascript://" onclick="loadTab(this,3);"><span>素材</span><asp:Image ID="Image3" runat="server" ImageUrl="Images/icn_169.png"/></a></li>
		            <li><a href="javascript://" onclick="loadTab(this,4);"><span>遮罩</span><asp:Image ID="Image4" runat="server" ImageUrl="Images/icn_029.png"/></a></li>
		            <li><a href="javascript://" onclick="loadTab(this,5);"><span>背景</span><asp:Image ID="Image5" runat="server" ImageUrl="Images/icn_110.png"/></a></li>
	            </ul>
            </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="tabsC">
	                        <div id="S1" class="support_drag" style="display:inline;">
                                <%--<img draggable="true" width="140" src="../Images/butterfly.jpg"/>   
                                <img draggable="true" width="140" src="../upload/painter/a/無框畫/3B30003/0330_s.JPG"/>--%>                     
                            </div>
	                        <div id="S2" style="display:none;">
                                <h4>文字選項</h4>
                                <table width="150" cellpadding="0" cellspacing="3" border="0">
                                    <tr valign=top>
                                        <td>字型</td>
                                        <td><asp:DropDownList ID="DropDownList1" runat="server" Width="80px"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr valign=top>
                                        <td>尺寸</td>
                                        <td><asp:DropDownList ID="DropDownList2" runat="server" Width="50px"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr valign=top>
                                        <td>顏色</td>
                                        <td><input id="Checkbox2" type="checkbox" size="1" value="color2" /><script type="text/javascript" src="Scripts/jscolor.js"></script>
                                        	<input class="color" value="66ff00" size="1" type="button">
                                        </td>
                                    </tr>
                                    <tr valign=top>
                                        <td>內容</td>
                                        <td><textarea id="TextArea1" cols="11" rows="4"></textarea>
                                        </td>
                                    </tr>
                                    <tr valign=top>
                                        <td></td>
                                        <td align=right><input id="Button1" type="button" value="確定" />
                                        </td>
                                    </tr>
                                </table>
	                        </div>

	                        <div id="S3" style="display:none;">
		                        <p>Link 3 內容，可以包含所有 HTML 標籤，甚至可以放置 IFRAME，這裡放了一個表單</p>
		            
	                        </div>
	                        <div id="S4" style="display:none;">Link 4 內容，可以包含所有 HTML 標籤，甚至可以放置 IFRAME，這裡放了一個 IFRAME
		                        <p>
			                        <iframe scrolling="Default" width="300" height="120" id="I1" name="I1"></iframe>
		                        </p>
	                        </div>
	                        <div id="S5" style="display:none;">
		                        <p>Link 5 內容，可以包含所有 HTML 標籤，甚至可以放置 IFRAME，這裡放了一個表格</p>
		                        <table width="80%" border="1" align="center" cellpadding="2" cellspacing="1">
			                        <tr>
				                        <td>&nbsp;</td>
				                        <td>&nbsp;</td>
				                        <td>&nbsp;</td>
			                        </tr>
			                        <tr>
				                        <td>&nbsp;</td>
				                        <td>&nbsp;</td>
				                        <td>&nbsp;</td>
			                        </tr>
			                        <tr>
				                        <td>&nbsp;</td>
				                        <td>&nbsp;</td>
				                        <td>&nbsp;</td>
			                        </tr>
			                        <tr>
				                        <td>&nbsp;</td>
				                        <td>&nbsp;</td>
				                        <td>&nbsp;</td>
			                        </tr>
		                        </table>
		                        </div>
                         </div>
                    </td>
                </tr>
            </table>
            
            
        </div>
        <div id="rgtMenu">
        </div>        
        <div id="toolbar" style="top:100px" class="ui-widget-header ui-corner-all">
            <button id="tbar_delete" type="button">delete</button>            
        </div>
       
        <div id="editArea" style="margin:5px;position:absolute;left:50%;top:50%">
            <canvas id="bleed_c" style="border:1px solid green;"></canvas>          
            <canvas id="c" style="border:1px solid green;"></canvas>
        </div>
        <div id="btmMenu">
        </div>
    </div>
     <%--joe edit --%>
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
        <%--joe edit --%>
    </form>    
</body>
</html>
<script>
    //joe edit
    var editWork_w;
    var editWork_h;
    var g_order_id = 999999;
    var g_make_type = "painter";
    var g_user_upload_path;

// initial
{
    $("#editArea").hide();
    var frc_canvas = new fabric.Canvas('c');   
}

// fabricjs sub function
{
    frc_canvas.observe('object:selected', function () {
        $("#toolbar").show();
    });
    frc_canvas.observe('selection:cleared', function () {
        $("#toolbar").hide();
    });

    function getActiveProp(name) {
        var object = frc_canvas.getActiveObject();
        if (!object) return '';
    
        return object[name] || '';
    }
    
    function setActiveProp(name, value) {
        var object = frc_canvas.getActiveObject();
        if (!object) return;
    
        object.set(name, value).setCoords();
        canvas.renderAll();
    }
}

// image upload
{
    function open_iframe(url) {
        $('#block').fadeIn();
        $('#iframe').attr('src', url);
        $('#container').fadeIn();
    };

    function close_iframe() {
        $('#block').fadeOut();
        $('#container').fadeOut();

        finduploadimg();
    };

    $("#closebtn").button().click(function () {
        close_iframe();
        $("#open").attr("disabled", false);
    });

    $("#upload_comp").button().click(function () {
        close_iframe();
        $("#open").attr("disabled", false);
    });

    $("#open").click(function (e) {
        $("#open").attr("disabled", true);
        open_painter(e);
    });

    function open_painter(e) {
        //session_name = getStorage('user_name');        
        //category_name = '<%=category_name%>';
        session_name = 'test1';
        category_name = '無框畫';

        if (session_name == null || session_name == '') {
            var painter_width = screen.width;
            var painter_height = screen.height;
            window.location.href = '../MemberLogin.aspx'
            return false;
        }
        else {
            //            var order_json = {};
            //            order_json.user_name = session_name;
            //            order_json.make_type = g_make_type;            
            //            order_json.prod_list = [];
            //            if (category_name == '無框畫') {
            //                
            //                    var prod_id = 5;
            //                    var amount = 1;

            //                    if (typeof amount == 'undefined')
            //                        amount = 0;

            //                    if (amount > 0)
            //                        order_json.prod_list.push({ "prod_id": prod_id, "amount": amount });                    
            //            }

            var create_ed_json = {};
            create_ed_json.order_id = g_order_id;
            create_ed_json.user_name = session_name;
            create_ed_json.category_name = category_name;
            create_ed_json.CKBaseURL = '~/upload/' + g_make_type + '/';
            create_ed_json.CKBaseDIR = 'd:\\doitwell02\\upload\\' + g_make_type + '\\';
            //create_ed_json.CKBaseDIR = 'd:\\OutSourceProj\\doitwell02\\upload\\' + g_make_type + '\\';

            $.ajax({
                type: "POST",
                dataType: "json",
                url: '../HandlerPainter.ashx?action=create_' + g_make_type + '_folder',
                data: JSON.stringify(create_ed_json),
                success: function (data) {
                    if (data.id == '000') {
                        open_iframe('../upload.html?make_type=' + g_make_type + '&order_id=' + g_order_id + '&checkout=true&open_fd=' + data.message + '&show_msg=true');
                        g_user_upload_path = data.message;
                    }
                    else
                        alert(data.message);
                }
            });


        }
    }

    function finduploadimg() {
        $("#S1").empty();
        var dir = "../upload/painter/test1/";  //g_user_upload_path;
        var fileextension = [".JPG", ".jpg", ".png", ".PNG", ".gif", ".GIF"];
        $.ajaxSetup({ async: false });
        $.ajax({
            //This will retrieve the contents of the folder if the folder is configured as 'browsable'
            url: dir,
            success: function (data) {
                //Lsit all png file names in the page
                for (var i = 0; i < fileextension.length; i++) {
                    $(data).find("a:contains(" + fileextension[i] + ")").each(function () {
                        var filename = this.href.replace(window.location.host, "").replace("http:///", "").replace("Editor01", "");
                        console.log(filename);
                        $("#S1").append($("<img draggable=\"true\" width=\"140\" src=\"../" + filename + "\" />"));
                        $("#S1").append($("<div align='center'>" + filename.split("/").pop() + "</div>"));
                    });
                }
            }
        });
        $.ajaxSetup({ async: true });

        g_drag_images = document.querySelectorAll('#S1 img');
        g_canvas_container = document.getElementById('editArea');
        g_handle_drag_images = document.querySelector('#S1 img.img_dragging');
        raise_drop();
    }
}         

    window.onbeforeunload = bunload;

    function bunload() {
        mess = "確定離開?";
        return mess;
    }

    //真的關閉時，要觸發XXX   
    //window.onunload = XXX;

//工作清單功能
 {
     function editWork(w, h, w_b, h_b) {
            console.log("W: " + w);
            console.log("H: " + h);
            console.log("W_B: " + w_b);
            console.log("H_B: " + h_b);

            frc_canvas.clear().renderAll();
            
            // 1 cm = 37.795276 px
            // 依 DPI 而定, 假設 96 DPI 時, 1 Inch = 96 Pixels, 1 Inch = 2.54 Cm, 96 Pixels / 2.54 Cm  = 37.7953 Pixels, 所以 1公分約 38 Pixels        
            var p = 38;
            var SCALE_FACTOR;

            if (w > h) {
                SCALE_FACTOR = 700 / (w * p); //桌布最大寬度
            }
            else {
                SCALE_FACTOR = 480 / (h * p); //桌布最大長度
            }


            SCALE_FACTOR = SCALE_FACTOR.toFixed(2);
            console.log(SCALE_FACTOR);

            var new_W = w * SCALE_FACTOR * p;
            var new_H = h * SCALE_FACTOR * p;
            console.log("newW: " + new_W);
            console.log("newH: " + new_H);
            var new_W_B = w_b * SCALE_FACTOR * p;
            var new_H_B = h_b * SCALE_FACTOR * p;
            console.log("newW_B: " + new_W_B);
            console.log("newH_B: " + new_H_B);
            $("#editArea").show();
            $("#editArea").css('width', new_W);
            $("#editArea").css('height', new_H);
            $("#editArea").css('margin-top', -250);
            $("#editArea").css('margin-left', -new_W / 2);

            frc_canvas.setWidth(new_W);
            frc_canvas.setHeight(new_H);            

            $("#canvas_info").html(w + " x " + h)

            finduploadimg();

            //top line
            x1 = 0;
            y1 = 0;
            x2 = new_W_B;
            y2 = 0;
            top_line = new fabric.Line([x1, y1, x2, y2], {
                left: (new_W - new_W_B) / 2,
                top: (new_H - new_H_B) / 2,
                stroke: 'red',
                strokeDashArray: [5, 0, 5],
                strokeWidth: 1,
                selectable: false
            });
            frc_canvas.add(top_line);
            

            //bottom line
            x1 = 0;
            y1 = 0;
            x2 = new_W_B;
            y2 = 0;
            bottom_line = new fabric.Line([x1, y1, x2, y2], {
                left: (new_W - new_W_B) / 2,
                top: new_H_B + ((new_H - new_H_B) / 2),
                stroke: 'red',
                strokeDashArray: [5, 0, 5],
                strokeWidth: 1,
                selectable: false
            });
            frc_canvas.add(bottom_line);

            //right line
            x1 = 0;
            y1 = 0;
            x2 = 0;
            y2 = new_H_B;
            right_line = new fabric.Line([x1, y1, x2, y2], {
                left: (new_W - new_W_B) / 2,
                top: (new_H - new_H_B) / 2,
                stroke: 'red',
                strokeDashArray: [5, 0, 5],
                strokeWidth: 1,
                selectable: false
            });
            frc_canvas.add(right_line);

            //left line
            x1 = 0;
            y1 = 0;
            x2 = 0;
            y2 = new_H_B;
            left_line = new fabric.Line([x1, y1, x2, y2], {
                left: new_W_B + ((new_W - new_W_B) / 2),
                top: (new_H - new_H_B) / 2,
                stroke: 'red',
                strokeDashArray: [5, 0, 5],
                strokeWidth: 1,
                selectable: false
            });
            frc_canvas.add(left_line);

            //middle line
            x1 = 0;
            y1 = 0;
            x2 = 0;
            y2 = new_H;
            middle_line = new fabric.Line([x1, y1, x2, y2], {
                left: new_W / 2,
                top: 0,
                stroke: 'blue',
                strokeDashArray: [5, 0, 5],
                strokeWidth: 1,
                selectable: false
            });
            frc_canvas.add(middle_line);

            //fabric.Image.fromURL('Images/bleed_rect.png', function (bleedimg) {
            //    bleedimg.set('width', new_W_B);
            //    bleedimg.set('height', new_H_B);
            //    bleedimg.set('left', (new_W - new_W_B) / 2);
            //    bleedimg.set('top', (new_H - new_H_B) / 2);

            //    frc_canvas.setOverlayImage(bleedimg, frc_canvas.renderAll.bind(frc_canvas));
         //});

            frc_canvas.renderAll();
        }

        function deleteWork() {
            alert("刪除");
        }
    } //工作清單功能 end

// drag image功能   
{
    // ref: http://stackoverflow.com/questions/17312749/drag-and-drop-the-image-from-pcuser-system-to-canvas-using-fabric-js
    function handleDrop(e) {
        // this / e.target is current target element.
        var date = new Date();
        //        if (e.stopPropagation) {
        //            e.stopPropagation();
        //        }
        e.stopPropagation(); // Stops some browsers from redirecting.
        e.preventDefault(); // Stops some browsers from redirecting.

        // handle desktop images
        if (e.dataTransfer.files.length > 0) {

        } else {
            var img = document.querySelector('.support_drag img.img_dragging');
            console.log(img.naturalWidth);
            var fill_Scale;

            if (img.naturalWidth > img.naturalHeight) {
                fill_Scale = frc_canvas.getHeight() / img.naturalHeight;                    
            } else {
                fill_Scale = frc_canvas.getWidth() / img.naturalWidth;                    
            }

            fill_Scale = fill_Scale.toFixed(2);
            console.log(fill_Scale);

            var newImage = new fabric.Image(img, {
                width: img.naturalWidth * fill_Scale,
                height: img.naturalHeight * fill_Scale,
                // Set the center of the new object based on the event coordinates relative to the canvas container.
                left: e.layerX,
                top: e.layerY
            });
            frc_canvas.add(newImage);

            //lock object movementX/Y
            if (newImage.width > newImage.height) {
                newImage.lockMovementY = true;
            } else {
                newImage.lockMovementX = true;
            }
            newImage.center();                
            newImage.setCoords();

            frc_canvas.bringToFront(top_line);
            frc_canvas.bringToFront(bottom_line);
            frc_canvas.bringToFront(right_line);
            frc_canvas.bringToFront(left_line);
            frc_canvas.bringToFront(middle_line);
        }

    }

    function handleDragStart(e) {
        [ ].forEach.call(g_drag_images, function (img) {
            img.classList.remove('img_dragging');
        });
        this.classList.add('img_dragging');
    }

    function handleDragEnd(e) {
        // this/e.target is the source node.
        [ ].forEach.call(g_drag_images, function (img) {
            img.classList.remove('img_dragging');
        });
    }

    function handleDragOver(e) {
        if (e.preventDefault) {
            e.preventDefault();
        }

        e.dataTransfer.dropEffect = 'copy';
        // See the section on the DataTransfer object.
        // NOTE: comment above refers to the article (see top) -natchiketa
        return false;
    }

    function handleDragEnter(e) {
        // this / e.target is the current hover target.
        this.classList.add('over');
    }

    function handleDragLeave(e) {
        // this / e.target is previous target element
        this.classList.remove('over');
    }        

    function raise_drop() {
        // Browser supports HTML5 DnD.

        if (Modernizr.draganddrop) {
            // Bind the event listeners for the image elements
            //var images = document.querySelectorAll('#S1 img');               
                
            [ ].forEach.call(g_drag_images, function (img) {
                console.log("img add event");
                img.addEventListener('dragstart', handleDragStart, false);
                img.addEventListener('dragend', handleDragEnd, false);
            });
           
            // Bind the event listeners for the canvas
            //var canvasContainer = document.getElementById('editArea');
            console.log("canvas add event");
            g_canvas_container.addEventListener('dragenter', handleDragEnter, false);
            g_canvas_container.addEventListener('dragover', handleDragOver, false);
            g_canvas_container.addEventListener('dragleave', handleDragLeave, false);
            g_canvas_container.addEventListener('drop', handleDrop, false);
        } else {
            // Replace with a fallback to a library solution.
            alert("This browser doesn't support the HTML5 Drag and Drop API.");
        }
    }
} //drag image功能 end

//    $(document).contextmenu(function (event) {
//        return false;  // We use right-click for zoom, etc., so we don't want the browser context menu popping up in the view.
//    });


//toolbar 功能列
{
    $(function () {
        $("#tbar_delete").button({
            text: false,
            icons: {
                primary: "ui-icon-custom"
            }
        }).click(function () {
            var object = frc_canvas.getActiveObject();
            object.remove();
        });        
    });
}

</script>