<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="editFormId" class="itemForm" method="post">
	    <table cellpadding="5">
	        
	        <tr>
	            <td>resumeId:</td>
	            <td><input type="text" name="resumeId"  class="easyui-textbox" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>userId:</td>
	            <td><input type="text" name="userId"  class="easyui-textbox" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>beginTime:</td>
	            <td><input type="text" name="beginTime"  class="easyui-textbox" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>endTime:</td>
	            <td><input type="text" name="endTime"  class="easyui-textbox" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>school:</td>
	            <td><input type="text" name="school"  class="easyui-textbox" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>degree:</td>
	            <td><input type="text" name="degree"  class="easyui-textbox" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        
	        <tr>
	            <td>achieved:</td>
	            <td><input type="text" name="achieved"  class="easyui-textbox" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        
	    </table>
	    <input name="id" id="objectId" type="hidden"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	var itemEditEditor ;
	$(function(){
		//实例化编辑器
		itemEditEditor = KindEditorUtil.createEditor("#objectEditWindow [name=desc]");
	});
	
	function submitForm(){
		setUpdateSaveFunction("/edu/update","/edu/save");
	}
	
	function setUpdateSaveFunction(updateUrl,saveUrl){
		if(!$('#objectEditWindow').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		var reqParams = $("#editFormId").serialize();
		var url = $("#objectId").val() ? updateUrl:saveUrl;
		$.post(url,reqParams, function(data){
			if(data.status == 200){
				$.messager.alert('提示','编辑成功!','info',function(){
					$("#objectEditWindow").window('close');
					$("#tableId").datagrid("reload");
				});
			}else{
				$.message.alert("提示",data.msg);
			}
		});
		
	}
	
</script>
