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
	            <td>name:</td>
	            <td><input class="easyui-textbox" type="text" name="name" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>userId:</td>
	            <td><input class="easyui-textbox" type="text" name="userId" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>birthday:</td>
	            <td><input class="easyui-textbox" type="text" name="birthday" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>gender:</td>
	            <td><input class="easyui-textbox" type="text" name="gender" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>locationId:</td>
	            <td><input class="easyui-textbox" type="text" name="locationId" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>phone:</td>
	            <td><input class="easyui-textbox" type="text" name="phone" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>edu:</td>
	            <td><input class="easyui-textbox" type="text" name="edu" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>profession:</td>
	            <td><input class="easyui-textbox" type="text" name="profession" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>curSalary:</td>
	            <td><input class="easyui-textbox" type="text" name="curSalary" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>lowSalaryExp:</td>
	            <td><input class="easyui-textbox" type="text" name="lowSalaryExp" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        
	        
	        <tr>
	            <td>商品描述:</td>
	            <td>
	                <textarea style="width:800px;height:300px;visibility:hidden;" name="desc"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td>ID:</td>
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
		setUpdateSaveFunction("/resume/update","/resume/save");
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
