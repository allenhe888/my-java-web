<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="editFormId" class="itemForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5">
	        <tr>
	            <td>商品类目:</td>
	            <td>
	            	<a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a>
	            	<input type="hidden" name="cid" style="width: 280px;"></input>	
	            </td>
	        </tr>

	        <tr>
	            <td>username:</td>
	            <td><input class="easyui-textbox" type="text" name="username" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>password:</td>
	            <td><input class="easyui-textbox" type="text" name="password" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>valid:</td>
	            <td><input class="easyui-textbox" type="text" name="valid" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>salt:</td>
	            <td><input class="easyui-textbox" type="text" name="salt" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>phone:</td>
	            <td><input class="easyui-textbox" type="text" name="phone" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>email:</td>
	            <td><input class="easyui-textbox" type="text" name="email" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>roleId:</td>
	            <td><input class="easyui-textbox" type="text" name="roleId" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        
	        <tr>
	            <td>商品描述:</td>
	            <td>
	                <textarea style="width:800px;height:300px;visibility:hidden;" name="desc"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td>岗位职位:</td>
	            <td><input id="objectId" type="hidden" name="id" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        
	        
	    </table>
	    <input type="hidden" name="itemParams"/>
	    <input type="hidden" name="itemParamId"/>
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
		setUpdateSaveFunction("/user/update","/user/save");
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
