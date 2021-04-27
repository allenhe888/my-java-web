<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Job List</title>
<link rel="stylesheet"
	href="/bootstrap/cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- 引入EasyUI中的jQuery文件,这里尝试省略 -报错;-->
<script src="/bootstrap/cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script
	src="/bootstrap/cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="/bootstrap/v3.bootcss.com/assets/js/docs.min.js"></script>

<!--引入jquery的js，EasyUI的执行需要依赖于jQuery  -->
<script type="text/javascript"
	src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css"
	href="/js/jquery-easyui-1.4.1/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<script type="text/javascript" src="/commons/datawork-common.js"></script>

</head>
<div class="container">

	<!-- 导航栏 - 行 -->
	<div class="row clearfix">
		<div class="col-md-12 column">
			
			<!-- 导航栏 正文 -->
			<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">DataWork</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Seek Job</a></li>
					<li><a href="#">Post Job</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" />
					</div>
					<button type="submit" class="btn btn-default">Search</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Login</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">用户中心<strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#">招聘中心</a></li>
							<li><a href="#">求职中心</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>

			</nav>

		</div>
	</div>

	<!-- JobList -行 -->
	<div class="row clearfix">
		<div class="col-md-12 column">
			
			<!-- 职位列表  正文 -->
			<div>
				<table id="tableId" class="easyui-datagrid"
								data-options="url:'/resumeExps/findAll',
								pagination:true,
								fitColumns:true,
								singleSelect:false,
								method:'get',
								pageSize:20,
								pageNumber:1,
								rownumbers:true,
								nowrap:true,
								striped:true,
								toolbar:toolBats
								">
					<thead>   
				        <tr>   
				            <th data-options="field:'ckeck',checkbox:true">选项</th>   
				            <th data-options="field:'id'">ID</th>
				            <th data-options="field:'resumeId'">resumeId</th>
				            <th data-options="field:'beginTime'">beginTime</th>
				            <th data-options="field:'endTime'">endTime</th>
				            <th data-options="field:'company'">company</th>
				            <th data-options="field:'role'">role</th>
				            <th data-options="field:'jobDuty'">jobDuty</th>
				        </tr>   
				    </thead>   
				    <tbody>   
				    </tbody>   
				</table>
				<hr/>
				<div id="objectEditWindow" class="easyui-window" title="编辑内容" 
					data-options="modal:true,closed:true,
								 iconCls:'icon-save',
								 href:'/resumeExps-edit'
								 " 
					style="width:70%;height:90%;padding:10px;">
				</div>
				
			</div>
			
		</div>
	</div>


</div>
</body>

<script type="text/javascript">
	var toolBats = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			
			$("#objectEditWindow").window({
				onLoad : function() {
				}

			}).window("open");
			$("#tableId").datagrid("reload");
		}
	}, {
		text : '编辑',
		iconCls : 'icon-edit',
		handler : function() {
			
			var ids = getSelectionsIds();
			if (ids.length == 0) {
				$.messager.alert('提示', '必须选择一个商品才能编辑!');
				return;
			} else if (ids.indexOf(",") > 0) {
				$.messager.alert('提示', '一次最多只编辑一个项目!');
				return;
			}
			$("#objectEditWindow").window({
				onLoad : function() {
					//回显数据
					var data = $("#tableId").datagrid("getSelections")[0];
					data.priceView = KindEditorUtil.formatPrice(data.price);
					$("#editFormId").form("load", data);
				}

			}).window("open");
		}
	}, {
		text : '删除',
		iconCls : 'icon-remove',
		handler : function() {
			var ids=getSelectionsIds().toString();
			$.post("/resumeExps/delete",{ids:ids},function(data){
				if(data.status==200){
					$("#tableId").datagrid("reload");
					alert("删除成功!");
				}else{
					alert(data.msg);
				}
			});
			
			
		}
	}, {
		text : '保存',
		iconCls : 'icon-save',
	}, {
		text : '帮助',
		iconCls : 'icon-help',
	} ];

	/**===  支持函数    ====**/

	function getSelectionsIds() {
		var itemList = $("#tableId");
		var sels = itemList.datagrid("getSelections");
		var ids = [];
		for ( var i in sels) {
			ids.push(sels[i].id);
		}
		ids = ids.join(",");
		return ids;
	}
		
</script>
</html>