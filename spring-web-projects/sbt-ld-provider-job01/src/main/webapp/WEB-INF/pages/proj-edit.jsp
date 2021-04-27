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
	            <td>项目名称:</td>
	            <td><input class="easyui-textbox" type="text" name="projName" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>项目ID:</td>
	            <td><input class="easyui-textbox" type="text" name="id" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>父ID:</td>
	            <td><input class="easyui-textbox" type="text" name="parentId" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        
	        <tr>
	            <td>商品描述:</td>
	            <td>
	                <textarea style="width:800px;height:300px;visibility:hidden;" name="desc"></textarea>
	            </td>
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
		if(!$('#objectEditWindow').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		 
		
		$("#objectEditWindow [name=price]").val(eval($("#objectEditWindow [name=priceView]").val()) * 100);
		itemEditEditor.sync();
		
		var paramJson = [];
		$("#objectEditWindow .params li").each(function(i,e){
			var trs = $(e).find("tr");
			var group = trs.eq(0).text();
			var ps = [];
			for(var i = 1;i<trs.length;i++){
				var tr = trs.eq(i);
				ps.push({
					"k" : $.trim(tr.find("td").eq(0).find("span").text()),
					"v" : $.trim(tr.find("input").val())
				});
			}
			paramJson.push({
				"group" : group,
				"params": ps
			});
		});
		paramJson = JSON.stringify(paramJson);
		
		$("#objectEditWindow [name=itemParams]").val(paramJson);
		
		var reqParams = $("#editFormId").serialize();
		$.post("/proj/update",reqParams, function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改商品成功!','info',function(){
					$("#objectEditWindow").window('close');
					$("#itemList").datagrid("reload");
				});
			}else{
				$.message.alert("提示",data.msg);
			}
		});
	}
</script>
