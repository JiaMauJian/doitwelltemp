var global_user_name;
var order_id;
function setStorage(name, value, expires) {
    var date = new Date();
    var schedule = Math.round((date.setSeconds(date.getSeconds() + expires)) / 1000);
    localStorage.setItem(name, value);
    localStorage.setItem(name + '_time', schedule);
}

function getStorage(name) {
    return localStorage.getItem(name);
}

function clearUserName() {
    localStorage.user_name = '';
    localStorage.before_login_url = '';
    return false;
}

$(document).ready(function () {
    $("#system_message").hide();
    $("#system_message").css({ "background-color": "#D462FF", "padding": "5px", "color": "#ffffff", "margin": "5px" });


    $("#submit_button").click(function (data) {
        $("#system_message").hide();

        if ($.trim($("#user_register_form").find("input[name=real_name]").val()) == '') {
            $("#system_message").slideDown().html("請輸入姓名");
            return false;
        };

        if ($.trim($("#user_register_form").find("input[name=user_name]").val()) == '') {
            $("#system_message").slideDown().html("請輸入帳號");
            return false;
        };

        if ($.trim($("#user_register_form").find("input[name=password]").val()) == '') {
            $("#system_message").slideDown().html("請輸入登入密碼");
            return false;
        };
        if ($("input[name=password]").val().length < 6) {
            $("#system_message").slideDown().html("密碼最少6個字元");
            return false;
        };
        if ($.trim($("#user_register_form").find("input[name=confirm_password]").val()) == '') {
            $("#system_message").slideDown().html("請輸入確認密碼");
            return false;
        };
        if ($.trim($("#user_register_form").find("input[name=confirm_password]").val()) !=
            $.trim($("#user_register_form").find("input[name=password]").val())
        ) {
            $("#system_message").slideDown().html("您輸入兩次的密碼不一樣");
            return false;
        };


        /*
        if( $.trim($("#user_register_form").find("select[name=gender]").val()) == '' ){
        $("#system_message").slideDown().html("請選擇您的性別");
        return false;
        };
        
        if( $.trim($("#user_register_form").find("select[name=birthday_year]").val()) == '' ||
        $.trim($("#user_register_form").find("select[name=birthday_month]").val()) == '' ||
        $.trim($("#user_register_form").find("select[name=birthday_day]").val()) == ''
        ){
        $("#system_message").slideDown().html("請選擇您的生日");
        return false;
        };
        
        if( $.trim($("#user_register_form").find("input[name=telephone]").val()) == '' ){
        $("#system_message").slideDown().html("請輸入電話");
        return false;
        };        
        */
        if ($.trim($("#user_register_form").find("input[name=mobile]").val()) == '') {
            $("#system_message").slideDown().html("請輸入手機");
            return false;
        };
        if ($.trim($("#user_register_form").find("input[name=email]").val()) == '') {
            $("#system_message").slideDown().html("請輸入Email");
            return false;
        };
        /*
        if( $.trim($("#user_register_form").find("input[name=address]").val()) == '' ){
        $("#system_message").slideDown().html("請輸入收件地址");
        return false;
        };
        */

        var member_json = {};
        member_json.real_name = $.trim($("#user_register_form").find("input[name=real_name]").val());
        member_json.user_name = $.trim($("#user_register_form").find("input[name=user_name]").val());
        member_json.password = $.trim($("#user_register_form").find("input[name=password]").val());
        member_json.gender = $.trim($("#user_register_form").find("select[name=gender]").val());
        member_json.birthday_year = $.trim($("#user_register_form").find("select[name=birthday_year]").val());
        member_json.birthday_month = $.trim($("#user_register_form").find("select[name=birthday_month]").val());
        member_json.birthday_day = $.trim($("#user_register_form").find("select[name=birthday_day]").val());
        member_json.telephone = $.trim($("#user_register_form").find("input[name=telephone]").val());
        member_json.mobile = $.trim($("#user_register_form").find("input[name=mobile]").val());
        member_json.email = $.trim($("#user_register_form").find("input[name=email]").val());
        member_json.zipcode = $.trim($("#user_register_form").find("input[name=zipcode]").val());
        member_json.city = $.trim($("#user_register_form").find("select[name=city]").val());
        member_json.locality = $.trim($("#user_register_form").find("select[name=locality]").val());
        member_json.address = $.trim($("#user_register_form").find("input[name=address]").val());
        member_json.verify = $.trim($("#user_register_form").find("input[name=verify]").val());

        var member_json = jQuery.parseJSON(JSON.stringify(member_json));
        //console.log(member_json);

        $.ajax({
            dataType: "json",
            url: 'HandlerMember.ashx?action=member_register',
            data: member_json,
            success: function (data) {
                //console.log(data);
                if (data.id == '000') {
                    window.location.href = '/MemberRegisterMessage.aspx';
                };
                if (data.id != '000') {
                    $("#system_message").slideDown().html(data.message);
                };
            }
        });
    });

    $("#login_button").click(function () {
        if ($("input[name='user_name']").val() == "" || $("input[name='password']").val() == "") {
            $("#system_message").slideDown().html("請輸入登入帳號及密碼");
            return false;
        } else {
            var member_json = {};
            member_json.user_name = $.trim($("#user_login_form").find("input[name=user_name]").val());
            member_json.password = $.trim($("#user_login_form").find("input[name=password]").val());
            var member_json = jQuery.parseJSON(JSON.stringify(member_json));
            //console.log(member_json);

            $.ajax({
                dataType: "json",
                url: 'HandlerMember.ashx?action=member_login',
                data: member_json,
                success: function (data) {
                    //console.log(data);
                    if (data.id == '000') {
                        setStorage('user_id', data.message, 31536000);
                        setStorage('user_name', member_json.user_name, 31536000);
                        if (getStorage('before_login_url') != null && getStorage('before_login_url') != '')
                            window.location.href = getStorage('before_login_url');
                        else
                            window.location.href = 'home.aspx';
                    };
                    if (data.id != '000') {
                        $("#system_message").slideDown().html(data.message);
                    };
                }
            });
        }
    });

    $("#send_forgot_button").click(function () {
        if ($("input[name='email']").val() == "") {
            $("#system_message").slideDown().html("請輸入Email");
            return false;
        } else {
            var member_json = {};
            member_json.email = $.trim($("input[name=email]").val());
            var member_json = jQuery.parseJSON(JSON.stringify(member_json));
            //console.log(member_json);

            $.ajax({
                dataType: "json",
                url: 'HandlerMember.ashx?action=member_forgot',
                data: member_json,
                success: function (data) {
                    //console.log(data);
                    if (data.id == '000') {
                        window.location.href = 'MemberForgotSent.aspx';
                    };
                    if (data.id != '000') {
                        $("#system_message").slideDown().html(data.message);
                    };
                }
            });
        }
    });


    $("#update_button").click(function (data) {
        //alert('123');
        $("#system_message").hide();

        if ($.trim($("#update_member_info_form").find("input[name=real_name]").val()) == '') {
            $("#system_message").slideDown().html("請輸入姓名");
            return false;
        };

        if ($.trim($("#update_member_info_form").find("input[name=password]").val()) == '') {
            $("#system_message").slideDown().html("請輸入登入密碼");
            return false;
        };
        if ($("input[name=password]").val().length < 6) {
            $("#system_message").slideDown().html("密碼最少6個字元");
            return false;
        };
        if ($.trim($("#update_member_info_form").find("input[name=confirm_password]").val()) == '') {
            $("#system_message").slideDown().html("請輸入確認密碼");
            return false;
        };
        if ($.trim($("#update_member_info_form").find("input[name=confirm_password]").val()) !=
            $.trim($("#update_member_info_form").find("input[name=password]").val())
        ) {
            $("#system_message").slideDown().html("您輸入兩次的密碼不一樣");
            return false;
        };

        if ($.trim($("#update_member_info_form").find("input[name=mobile]").val()) == '') {
            $("#system_message").slideDown().html("請輸入手機");
            return false;
        };
        if ($.trim($("#update_member_info_form").find("input[name=email]").val()) == '') {
            $("#system_message").slideDown().html("請輸入Email");
            return false;
        };

        var member_json = {};
        member_json.real_name = $.trim($("#update_member_info_form").find("input[name=real_name]").val());
        member_json.user_name = global_user_name;
        member_json.password = $.trim($("#update_member_info_form").find("input[name=password]").val());
        member_json.gender = $.trim($("#update_member_info_form").find("select[name=gender]").val());
        member_json.birthday_year = $.trim($("#update_member_info_form").find("select[name=birthday_year]").val());
        member_json.birthday_month = $.trim($("#update_member_info_form").find("select[name=birthday_month]").val());
        member_json.birthday_day = $.trim($("#update_member_info_form").find("select[name=birthday_day]").val());
        member_json.telephone = $.trim($("#update_member_info_form").find("input[name=telephone]").val());
        member_json.mobile = $.trim($("#update_member_info_form").find("input[name=mobile]").val());
        member_json.email = $.trim($("#update_member_info_form").find("input[name=email]").val());
        member_json.zipcode = $.trim($("#update_member_info_form").find("input[name=zipcode]").val());
        member_json.city = $.trim($("#update_member_info_form").find("select[name=city]").val());
        member_json.locality = $.trim($("#update_member_info_form").find("select[name=locality]").val());
        member_json.address = $.trim($("#update_member_info_form").find("input[name=address]").val());
        member_json.verify = $.trim($("#update_member_info_form").find("input[name=verify]").val());

        var member_json = jQuery.parseJSON(JSON.stringify(member_json));
        //console.log(member_json);

        $.ajax({
            dataType: "json",
            url: 'HandlerMember.ashx?action=member_update',
            data: member_json,
            success: function (data) {
                //console.log(data);
                if (data.id == '000') {
                    alert(data.message);
                    return false;
                };
                if (data.id != '000') {
                    $("#system_message").slideDown().html(data.message);
                };
            }
        });
    });
});

var goEditCount = 0;

function goMemberUpdate() {

    $("#update_button").button().css({ "font-size": "12px" });
    var member_json = {};
    member_json.user_name = getStorage('user_name');
    var member_json = jQuery.parseJSON(JSON.stringify(member_json));
    //console.log(member_json);

    $.ajax({
        dataType: "json",
        url: 'HandlerMember.ashx?action=get_member_info',
        data: member_json,
        success: function (data) {
            init_address();
            console.log(data);
            $("#update_member_info_form").find("input[name=real_name]").val(data.real_name);
            $("#user_name").html(data.user_name);
            global_user_name = data.user_name;
            $("#update_member_info_form").find("input[name=password]").val(data.password);
            $("#update_member_info_form").find("input[name=confirm_password]").val(data.password);
            $("#update_member_info_form").find("select[name=gender]").val(data.gender);
            $("#update_member_info_form").find("select[name=birthday_year]").val(data.birthday_year);
            $("#update_member_info_form").find("select[name=birthday_month]").val(data.birthday_month);
            $("#update_member_info_form").find("select[name=birthday_day]").val(data.birthday_day);
            $("#update_member_info_form").find("input[name=telephone]").val(data.telephone);
            $("#update_member_info_form").find("input[name=mobile]").val(data.mobile);
            $("#update_member_info_form").find("input[name=email]").val(data.email);
            $("#update_member_info_form").find("input[name=zipcode]").val(data.zipcode);
            $("#update_member_info_form").find("select[name=city]").val(data.city);
            $("#update_member_info_form").find("select[name=city]").trigger("change");
            $("#update_member_info_form").find("select[name=locality]").val(data.locality);
            $("#update_member_info_form").find("select[name=locality]").trigger("change");
            $("#update_member_info_form").find("input[name=address]").val(data.address);
        }
    });

};

function goOrder() {

    $.ajax({
        dataType: "json",
        url: 'HandlerOrder.ashx?action=member_order_detail_query&user_id=' + getStorage('user_id'),
        success: function (data) {
            console.log(data);

            var order_total_price = 0;
            var order_total_price_after_discount = 0;

            $('#order_information_table tr:gt(0)').remove();

            $.each(data.rows, function (k, v) {
                var note = '';
                if (v.note != null)
                    note = v.note;

                var stauts = '';
                if (v.status1 == 'inproc')
                    stauts = '<span style="background-color:Lime;">製作中</span>';
                else if (v.status1 == 'payment')
                    stauts = '<span style="background-color:Yellow;">已付款</span>';
                else if (v.status1 == 'cancel')
                    stauts = '<span style="background-color:Magenta;color:White;">取消</span>';
                else if (v.status1 == 'close')
                    stauts = '<span style="background-color:Silver;">已結單</span>';
                else if (v.status1 == 'deliver')
                    stauts = '<span style="background-color:Blue;color:White;">送貨中</span>';
                else if (v.status1 == 'return')
                    stauts = '<span style="background-color:Red;color:White;">退件</span>';

                var make_type;

                if (v.make_type == 'painter')
                    make_type = '<td class="for_center">線上編輯</td>';
                else if (v.make_type == 'user_editor')
                    make_type = '<td class="for_center">自編上傳</td>';
                else if (v.make_type == 'boss_editor')
                    make_type = '<td class="for_center">委託編輯</td>';

                var append_item = '<tr>' +
                '<td class="for_order_detail_id">' + v.confirm_order_detail_id + '</td>' +
                '<td class="for_center"><img src=' + v.painter_cover + '></img></td>' +
		        '<td class="for_center">' + v.product_type + '</td>' +
                '<td class="for_center">' + v.width + ' x ' + v.height + '</td>' +
                '<td class="for_center">' + v.product_spec + '</td>' +
                '<td class="for_center">' + v.pages + '</td>' +
                '<td class="for_center">' + v.product_price + '</td>' +
                '<td class="for_center">' + note + '</td>' +
                make_type +
                '<td class="for_center">' + stauts + '</td>' +                
                //            '<td class="for_center"><button class="order_cancel" type="button" onclick="cancel_order_detail(' + v.order_detail_id + ')">取消</button></td>'
                '</tr>';
                //console.log(append_item);
                $("#order_information_table tr:last").after(append_item);

                order_total_price += parseInt(v.product_price);
                order_total_price_after_discount += parseInt(v.product_price);

                $(".order_cancel").button().css({ 'font-size': '10px' });
            });

            $("#order_total_price").html(order_total_price);
            $("#order_total_price").currency({ region: 'TWD', decimals: 0 });
            $("#order_total_price_after_discount").html(order_total_price_after_discount);
            $("#order_total_price_after_discount").currency({ region: 'TWD', decimals: 0 });
        }
    });

    //if (goEditCount > 0) {
        
    //}
};

function cancel_order_detail(id) {
    if (confirm('確定取消此訂單嗎?')) {
        $.ajax({
            url: 'HandlerOrder.ashx?action=member_order_detail_cancel&order_detail_id=' + id,
            success: function (data) {
                data = JSON.parse(data);
                if (data.id == '000') {
                    $("#order_query").trigger('click');
                };
                if (data.id != '000') {
                    $("#system_message").slideDown().html(data.message);
                };
            }
        });
    }   
};
function open_painter(order_id, order_detail_id, painter_id){
	myWindow=window.open('painter.html?order_id=' + order_id + '&order_detail_id='+order_detail_id+'&painter_id='+painter_id+'&ref=MemberCenter', 'DoItWell Painter','width=1250,height=740,fullscreen=yes,left=0,top=0');
	myWindow.focus();
	return false;
};

function checkout(){
    window.location.href = 'checkout.aspx?user_id=' + getStorage('user_id') + '&order_id=' + order_id + '&make_type=painter';
};

function open_iframe(url) {
    $('#block').fadeIn();
    $('#iframe').attr('src', url);
    $('#container').fadeIn();
};

function close_iframe() {
    $('#block').fadeOut();
    $('#container').fadeOut();
};

function open_ckfinder(user_name, make_type, porduct_type) {
    if (make_type == 'user_editor') 
    {
        var create_user_ed_json = {};
        create_user_ed_json.user_name = user_name;
        create_user_ed_json.category_name = porduct_type;
        create_user_ed_json.CKBaseURL = '~/upload/user_editor/';
        create_user_ed_json.CKBaseDIR = 'd:\\doitwell02\\upload\\user_editor\\';
        $.ajax({
            type: "POST",
            dataType: "json",
            url: 'HandlerPainter.ashx?action=create_user_editor_folder',
            data: JSON.stringify(create_user_ed_json),
            success: function (data) {
                if (data.id == '000') {
                    open_iframe('./upload.html?make_type=' + make_type + '&checkout=false');
                }
                else
                    alert(data.message);
            }
        });
    }
    else if (make_type == 'boss_editor') 
    {
        var create_boss_ed_json = {};
        create_boss_ed_json.user_name = user_name;
        create_boss_ed_json.category_name = porduct_type;
        create_boss_ed_json.CKBaseURL = '~/upload/boss_editor/';
        create_boss_ed_json.CKBaseDIR = 'd:\\doitwell02\\upload\\boss_editor\\';
        $.ajax({
            type: "POST",
            dataType: "json",
            url: 'HandlerPainter.ashx?action=create_boss_editor_folder',
            data: JSON.stringify(create_boss_ed_json),
            success: function (data) {
                if (data.id == '000') {
                    open_iframe('./upload.html?make_type=' + make_type + '&checkout=false');
                }
                else
                    alert(data.message);
            }
        });
    }
};

function goShopCar() {

    goEditCount = 0;

    $.ajax({
        dataType: "json",
        url: 'HandlerOrder.ashx?action=member_shopcar_detail_query&user_id=' + getStorage('user_id'),
        success: function (data) {
            //console.log(data);

            var shop_order_total_price = 0;
            var shop_order_total_price_after_discount = 0;

            $('#painter_open_table tr:gt(0)').remove();
            $('#painter_finish_table tr:gt(0)').remove();
            $('#painter_close_table tr:gt(0)').remove();
            $('#vendor_make_table tr:gt(0)').remove();

            $.each(data.rows, function (k, v) {

                var note = '';
                if (v.note != null)
                    note = v.note;

                var append_item = '<tr>' +
                '<td style="display:none;">' + v.order_detail_id + '</td>' +
                '<td class="for_center" ><img src=' + v.painter_cover + '></img></td>' +
		        '<td class="for_center" >' + v.product_type + '</td>' +
                '<td class="for_center" >' + v.width + ' x ' + v.height + '</td>' +
                '<td class="for_center" >' + v.product_spec + '</td>' +
                '<td class="for_center" >' + v.pages + '</td>' +
                '<td class="for_center" >' + v.product_amount + '</td>' +
                '<td class="for_center" >' + v.product_price + '</td>' +
                '<td class="for_center" >' + note + '</td>';

                if (v.make_type == 'painter') {

                    if (v.painter_status == 'open' || v.painter_status == 'edit')
                        append_item += '<td class="for_center" ><button class="open_painter" type="button" onclick="open_painter(\'' + v.order_master_id + '\',\'' + v.order_detail_id + '\',\'' + v.painter_id + '\');">開始編輯</button></td>';
                    else
                        append_item += '<td class="for_center" ><button class="open_painter" type="button" onclick="open_preview(\'' + v.order_master_id + '\',\'' + v.order_detail_id + '\',\'' + v.painter_id + '\');">預覽</button></td>';

                    append_item += '</tr>';

                    if (v.painter_status == 'open' || v.painter_status == 'edit') {
                        $("#painter_open_table tr:last").after(append_item);
                        goEditCount++;
                    }
                    else if (v.painter_status == 'finish') {
                        order_id = v.order_master_id;
                        $("#painter_finish_table tr:last").after(append_item);
                    }
                    else if (v.painter_status == 'close') {
                        $("#painter_close_table tr:last").after(append_item);
                    }
                }
                else {

                    append_item += '<td class="for_center" ><button class="open_painter" type="button" onclick="open_ckfinder(\'' + getStorage('user_name') + '\',\'' + v.make_type + '\',\'' + v.product_type + '\');">預覽</button></td>';

                    append_item += '</tr>';

                    $("#vendor_make_table tr:last").after(append_item);
                }

                shop_order_total_price += parseInt(v.product_price);
                shop_order_total_price_after_discount += parseInt(v.product_price);
            });

            $("#shop_total_price").html(shop_order_total_price);
            $("#shop_total_price").currency({ region: 'TWD', decimals: 0 });
            $("#shop_total_price_after_discount").html(shop_order_total_price_after_discount);
            $("#shop_total_price_after_discount").currency({ region: 'TWD', decimals: 0 });
            $(".open_painter").button().css({ 'font-size': '10px' });

            if (goEditCount > 0)
                $("#goEdit").html("您有 " + goEditCount + " 項作品尚在編輯，前往作品清單，開始製作!");
        }
    });


   
};

function delete_order_detail(id) {
    if (confirm('確定刪除此訂單嗎?')) {
        $.ajax({
            url: 'HandlerOrder.ashx?action=member_order_detail_delete&order_detail_id=' + id,
            success: function (data) {
                data = JSON.parse(data);
                if (data.id == '000') {
                    $("#shop_car").trigger('click');
                };
                if (data.id != '000') {
                    $("#system_message").slideDown().html(data.message);
                };
            }
        });
    }    
};