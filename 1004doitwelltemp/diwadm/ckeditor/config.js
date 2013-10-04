/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    config.language = 'zh';
    //config.uiColor = '#AADC6E';
    config.skin = 'moonocolor';

    config.toolbar =
	[
        { name: 'clipboard', groups: ['clipboard', 'undo'], items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'] },
        { name: 'editing', groups: ['find', 'selection', 'spellchecker'], items: ['Find', 'Replace', '-', 'SelectAll'] },
        { name: 'basicstyles', groups: ['basicstyles', 'cleanup'], items: ['Bold', 'Italic', 'Underline'] },
        { name: 'paragraph', groups: ['list', 'indent'], items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
        '/',
        { name: 'links', items: ['Link', 'Unlink'] },
        { name: 'insert', items: ['Image', 'Table'] },
        { name: 'styles', items: ['Font', 'FontSize'] },
        { name: 'colors', items: ['TextColor', 'BGColor'] }
    ];

    // debug
    //config.filebrowserUploadUrl = '/diwadm01/HandlerUpload.ashx?action=ckeditor_upload'
    //config.filebrowserBrowseUrl = '/diwadm01/FileBrowser.aspx?path=Userfiles/File&editor=FCK';
    //config.filebrowserImageBrowseUrl = '/diwadm01/FileBrowser.aspx?type=Image&path=Userfiles/Image&editor=FCK';

    // release
    //config.filebrowserUploadUrl = '/HandlerUpload.ashx?action=ckeditor_upload'
    //config.filebrowserBrowseUrl = '/FileBrowser.aspx?path=Userfiles/File&editor=FCK';
    //config.filebrowserImageBrowseUrl = '/FileBrowser.aspx?type=Image&path=Userfiles/Image&editor=FCK';

    config.enterMode = CKEDITOR.ENTER_BR;
    config.font_defaultLabel = '微軟正黑體';
    config.fontSize_defaultLabel = '14px';
    config.font_names = "Arial;Times New Roman;Verdana;新細明體;標楷體;微軟正黑體;"
    config.fontSize_sizes = '8/8px;10/10px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;72/72px';

    config.font_style = {
        element: 'span',
        styles: { 'font-family': '#(family)' },
        overrides: [{ element: 'font', attributes: { 'face': null}}]
    };
    config.fontSize_style = {
        element: 'span',
        styles: { 'font-size': '#(size)' },
        overrides: [{ element: 'font', attributes: { 'size': null}}]
    };

    config.height = '500';
    config.width = '750';    

    config.image_previewText = CKEDITOR.tools.repeat(' ', 1); //CKEDITOR.tools.repeat('DoItWell', 8);
};
