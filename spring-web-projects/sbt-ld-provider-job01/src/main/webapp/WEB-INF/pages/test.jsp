<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LoveData Recruiting System</title>
<!--引入bootstrap的及其jQuery -->	
	<link rel="stylesheet" href="/bootstrap/cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="/bootstrap/cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="/bootstrap/cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="/bootstrap/v3.bootcss.com/assets/js/docs.min.js"></script>

<!--引入jquery的js，EasyUI的执行需要依赖于jQuery -->
	<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="/js/jquery-easyui-1.4.1/themes/default/easyui.css" />
	<script type="text/javascript" src="/commons/datawork-common.js"></script>
 
</head>
<body>
<!-- Header: 头部导航 -->
<div class="container">
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
					<li class="active"><a href="#" onclick="addTab('Resume','resume/listUI')">myResume</a></li>
					<li><a href="#" onclick="addTab('User','user/listUI')">User Center</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Recruit Center<strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="addTab('PostJob','job/postUI')">Post New Job</a></li>
							<li><a href="#" onclick="addTab('Job','job/listUI')">Job List</a></li>
							<li class="divider"></li>
							<li><a href="#">Candidates</a></li>
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
</div>
	
	
<!-- Main: 网页主体正文 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div id="mainContext" class="easyui-tabs" style="margin=10px;width:98%;height:550px;">
	        	<div title="Home">Test</div>
    		</div>
		</div>
	</div>
</div>
	
		
	
	
</body>
<script type="text/javascript">
	
	function addTab(title, url){
	    if($("#mainContext").tabs('exists',title)){
	    	$("#mainContext").tabs('select',title);
	    }else{
	    	var content ='<iframe scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;height:100%;"></iframe>';
	    	$("#mainContext").tabs('add',{
	    		title:title,
	    		content:content,
	    		closable:true
	    	});
	    }
	}
	
</script>

</html>