KindEditor.ready(function(K) {
	K.create('#kindeditor_id', {
		width: "100%",
		allowFileManager: true,
		langType: "zh_CN",
		uploadJson: "/kindeditor/upload",
		fileManagerJson: '/kindeditor/filemanager',
		script         : '#{images_path(:auth_token => current_user.authentication_token, :format => :json)}'
	});
});