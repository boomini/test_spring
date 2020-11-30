/*
 * jQuery File Upload Plugin JS Example
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * https://opensource.org/licenses/MIT
 */

/* global $, window */

$(function () {
    'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        url: '/jqueryFileUpload.do',
        //acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i, //파일확장자
        //maxFileSize: 1,//파일사이즈 // •Example: 10000000 // 10 MB
        maxNumberOfFiles : 2, //파일 갯수
        sequentialUploads : true
    });
    

   // $('#fileupload')
   //     .bind('fileuploadadd', function (e, data) {/* ... */})
   //     .bind('fileuploadsubmit', function (e, data) {/* ... */})
   //     .bind('fileuploadsend', function (e, data) {/* ... */})
   //     .bind('fileuploaddone', function (e, data) {/* ... */})
   //     .bind('fileuploadfail', function (e, data) {/* ... */})
   //     .bind('fileuploadalways', function (e, data) {/* ... */})
   //     .bind('fileuploadprogress', function (e, data) {/* ... */})
   //     .bind('fileuploadprogressall', function (e, data) {/* ... */})
   //     .bind('fileuploadstart', function (e) {/* ... */})
   //     .bind('fileuploadstop', function (e) {/* ... */})
   //     .bind('fileuploadchange', function (e, data) {/* ... */})
   //     .bind('fileuploadpaste', function (e, data) {/* ... */})
   //     .bind('fileuploaddrop', function (e, data) {/* ... */})
   //     .bind('fileuploaddragover', function (e) {/* ... */})
   //     .bind('fileuploadchunksend', function (e, data) {/* ... */})
   //     .bind('fileuploadchunkdone', function (e, data) {/* ... */})
   //     .bind('fileuploadchunkfail', function (e, data) {/* ... */})
   //     .bind('fileuploadchunkalways', function (e, data) {/* ... */});
    
    // Enable iframe cross-domain access via redirect option:
    $('#fileupload').fileupload(
        'option',
        'redirect',
        window.location.href.replace(
            /\/[^\/]*$/,
            '/cors/result.html?%s'
        )
    );
    // Load existing files:

    $('#fileupload').addClass('fileupload-processing');
    $.ajax({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        url: '/jqueryFileList.do',
        dataType: 'json',
        data : {fileId : '161b611956143'},
        context: $('#fileupload')[0]
    }).always(function () {
        $(this).removeClass('fileupload-processing');
    }).done(function (result) {
    	//console.log("아자 : " + result.files[0].fileId);
    	//$("#fileId").val(result.files[0].fileId);
    	$("#fileId").val('161b611956143');
        $(this).fileupload('option', 'done')
            .call(this, $.Event('done'), {result: result});
    });

});
