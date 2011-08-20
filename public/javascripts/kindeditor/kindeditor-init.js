/*
KE.show({
  id : 'kindeditor_id',
  width: "100%",
  allowFileManager: true,
	imageUploadJson : '/kindeditor/upload',
	fileManagerJson: '/kindeditor/filemanager'
});
*/
var editor;
KindEditor.ready(function(K) {
	editor = K.create('#kindeditor_id', {
		width: "100%",
		allowFileManager: true,
        imageUploadJson: '/kindeditor/upload',
		fileManagerJson: '/kindeditor/filemanager'
     });
});

