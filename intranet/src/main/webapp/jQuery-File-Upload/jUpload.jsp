<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!--
/*
 * jQuery File Upload Plugin Demo
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * https://opensource.org/licenses/MIT
 */
-->
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->
<!-- Bootstrap styles -->
<link rel="stylesheet" href="/jQuery-File-Upload/css/bootstrap.min.css">
<!-- Generic page styles -->
<!-- <link rel="stylesheet" href="/jQuery-File-Upload/css/style.css"> -->
<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="/jQuery-File-Upload/css/Gallery/blueimp-gallery.min.css">
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="/jQuery-File-Upload/css/jquery.fileupload.css">
<link rel="stylesheet" href="/jQuery-File-Upload/css/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="/jQuery-File-Upload/css/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="/jQuery-File-Upload/css/jquery.fileupload-ui-noscript.css"></noscript>
<script>
$(function () {
    'use strict';
    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        url: '/jqueryFileUpload.do',
        //acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i, //파일확장자
        //maxFileSize: 1,//파일사이즈 // •Example: 1000000 // 1 MB
        maxFileSize: '<c:out value="${jQueyFileInfo.FILE_UP_SIZE}"/>"'*1000000,//파일사이즈 // •Example: 1000000 // 1 MB
        maxNumberOfFiles : parseInt('<c:out value="${jQueyFileInfo.FILE_UP_CNT}"/>"'), //파일 갯수
        sequentialUploads : true,
        messages: {
            maxNumberOfFiles: '최대 <c:out value="${jQueyFileInfo.FILE_UP_CNT}"/>개까지 파일을 등록 할 수 있습니다.',
            acceptFileTypes: '파일 타입이 잘못되었습니다. 지원되는 파일 타입인지 확인하여 주십시오.',
            maxFileSize: '파일의 크기가 너무 큽니다.<c:out value="${jQueyFileInfo.FILE_UP_SIZE}"/>MB까지 올릴수 있습니다.',
            minFileSize: 'File is too small'
        }
    });
    // Enable iframe cross-domain access via redirect option:
    $('#fileupload').fileupload(
        'option',
        'redirect',
        window.location.href.replace(
            /\/[^\/]*$/,
            '/cors/result.html?%s'
        )
    );
    $('.fileupload-progress').hide()
    // Load existing files:
    $('#fileupload').addClass('fileupload-processing');
    $.ajax({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
		cache : false,
        url: '/jqueryFileList.do',
        dataType: 'json',
        data : {fileId : '<c:out value="${jQueyFileInfo.FILE_ID}"/>'},
        context: $('#fileupload')[0]
    }).always(function () {
        $(this).removeClass('fileupload-processing');
    }).done(function (result) {
    	if($("#fileId").val() == ""){
    		$("#fileId").val(result.files[0].fileId);
    		$("#FILE_ID").val(result.files[0].fileId);
    		return;
    	}
        $(this).fileupload('option', 'done')
            .call(this, $.Event('done'), {result: result});
    });

});
</script>
<div style="margin-top: 5px;border: 1px solid #e6e6e6;padding: 10px 10px 5px 10px;" id="jqUploadAr">
    <!-- The file upload form used as target for the file upload widget -->
    <form id="fileupload" action="https://jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="fileId" id="fileId" value="<c:out value='${jQueyFileInfo.FILE_ID}'/>">
        <!-- Redirect browsers with JavaScript disabled to the origin page -->
        <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript>
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="row fileupload-buttonbar">
            <div class="col-lg-7">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="btnn btnn-success fileinput-button">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>파일 추가</span>
                    <input type="file" name="files[]" multiple>
                </span>
                <button type="submit" class="btnn btnn-primary start">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>업로드 시작</span>
                </button>
                <button type="reset" class="btnn btnn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>업로드 취소</span>
                </button>
                <button type="button" class="btnn btnn-danger delete">
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>삭제</span>
                </button>
                <input type="checkbox" class="toggle">
                <!-- The global file processing state -->
                <span class="fileupload-process"></span>
            </div>
            <!-- The global progress state -->
            <div class="col-lg-5 fileupload-progress fade" style="width: 90%">
                <!-- The global progress bar -->
                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                </div>
                <!-- The extended global progress state -->
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>
        <!-- The table listing the files available for upload/download -->
        <table role="presentation" class="table table-striped" style="margin-top: 5px;">
        <col style="width: 12%">
        <col />
        <col style="width: 18%">
        <col style="width: 28%">
        <tbody class="files"></tbody></table>
    </form>
<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td style="text-align: center;">
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td style="text-align: center;">
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td style="text-align: center;">
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btnn btnn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>업로드</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btnn btnn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td style="text-align: center;">
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td style="text-align: center;">
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td style="text-align: center;">
            {% if (file.deleteUrl) { %}
                <button class="btnn btnn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>삭제</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btnn btnn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>취소</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="/jQuery-File-Upload/js/vendor/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="/jQuery-File-Upload/js/etc/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="/jQuery-File-Upload/js/etc/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="/jQuery-File-Upload/js/etc/canvas-to-blob.min.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="/jQuery-File-Upload/js/etc/bootstrap.min.js"></script>
<!-- blueimp Gallery script -->
<script src="/jQuery-File-Upload/js/etc/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="/jQuery-File-Upload/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="/jQuery-File-Upload/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="/jQuery-File-Upload/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="/jQuery-File-Upload/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="/jQuery-File-Upload/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="/jQuery-File-Upload/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="/jQuery-File-Upload/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="/jQuery-File-Upload/js/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="/jQuery-File-Upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
</div>