/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
  config.toolbarGroups = [
    { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
    { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
    { name: 'forms', groups: [ 'forms' ] },
    { name: 'paragraph', groups: [ 'list', 'indent', 'align', 'blocks', 'bidi', 'paragraph' ] },
    { name: 'links', groups: [ 'links' ] },
    { name: 'insert', groups: [ 'insert' ] },
    { name: 'tools', groups: [ 'tools' ] },
    { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
    '/',
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'styles', groups: [ 'styles' ] },
    { name: 'colors', groups: [ 'colors' ] },
    '/',
    { name: 'others', groups: [ 'others' ] },
    { name: 'about', groups: [ 'about' ] }
  ];

  config.removeButtons = 'Save,NewPage,Find,Replace,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Italic,Subscript,Superscript,CopyFormatting,Language,BidiLtr,BidiRtl,ShowBlocks,About,Flash,PageBreak,Iframe,Templates,CreateDiv,Redo,Undo,Strike,NumberedList,BulletedList,Indent,Outdent,Blockquote,Anchor,Smiley,Styles,Format,BGColor,PasteFromWord';
  config.removeDialogTabs = 'image:advanced;link:advanced';
  config.contentsCss = ['/com/css/BasicSet.css', '/com/css/common.css','/com/css/sub.css'];
  config.font_names = "굴림;굴림체;궁서;궁서체;돋움;돋움체;바탕;바탕체;Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana";
  config.fontSize_sizes = "10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;24/24px;32/32px";
  config.font_defaultLabel = '굴림체'; 
  config.fontSize_defaultLabel = '11';
  config.allowedContent = true;
};
