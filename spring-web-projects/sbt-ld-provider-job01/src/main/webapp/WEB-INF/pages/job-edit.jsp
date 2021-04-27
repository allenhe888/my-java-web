<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="editFormId" class="itemForm" method="post">
		
	    <table cellpadding="5">
	        <tr>
	            <td>商品类目:</td>
	            <td>
	            	<a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a>
	            	<input type="hidden" name="cid" style="width: 280px;"></input>	
	            </td>
	        </tr>

	        <tr>
	            <td>职位名称:</td>
	            <td><input class="easyui-textbox" type="text" name="jobName" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>部门ID:</td>
	            <td><input class="easyui-textbox" type="text" name="deptId" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>Degree:</td>
	            <td>
	            	<select id="eduId" class="easyui-combobox" name="edu" style="width: 280px;">
						<option>Bachelor</option>
						<option>Master</option>
						<option>Doctor</option>
						<option>College</option>
						<option>Others</option>
					</select>
				</td>
	        </tr>
	        <tr>
	            <td>月薪范围:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="lowSalary" data-options="" style="width: 100px;"/>k - 
	            	<input class="easyui-textbox" type="text" name="topSalary" data-options="" style="width: 100px;"/>k/ Month
	            	</td>
	        </tr>

	        <tr>
	            <td>项目:</td>
	            <td><input class="easyui-textbox" type="text" name="project" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>岗位职位:</td>
	            <td><input class="easyui-textbox" type="text" name="jobDuty" data-options="" style="width: 280px;"></input></td>
	        </tr>
	        
	        
	    </table>
	    <input id="objectId" type="hidden" name="id"/>
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
		setUpdateSaveFunction("/job/update","/job/save");
	}
	
	function setUpdateSaveFunction(updateUrl,saveUrl){
		if(!$('#objectEditWindow').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		var reqParams = $("#editFormId").serialize();
		var url = $("#objectId").val() ? updateUrl:saveUrl;
		debugger
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
