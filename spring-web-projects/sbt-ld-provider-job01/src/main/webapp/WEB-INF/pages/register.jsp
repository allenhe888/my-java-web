<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>User Register</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="/bootstrap/cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="/bootstrap/cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="/bootstrap/cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="/bootstrap/v3.bootcss.com/assets/js/docs.min.js"></script>
 	
 
 
 </head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>求职招聘网-</b>注册页面</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form method="post">
      <div class="form-group has-feedback">
        <input type="text" id="usernameId" name="username" class="form-control" placeholder="username">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" id="passwordId" name="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
     <div class="form-group has-feedback">
        <input type="password" id="repasswordId" name="repassword" class="form-control" placeholder="rePassword">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
  	<div class="form-group has-feedback">
        <input type="text" id="phoneId" name="phone" class="form-control" placeholder="phone">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" id="emailId" name="email" class="form-control" placeholder="email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group">
      	<div class="col-sm-10 typeRadio" align="center">
            <label class="radio-inline">
			<input type="radio" class="user-role" name="typeId" value="1"> 我要求职 </label>
			<label class="radio-inline">
			<input type="radio" class="user-role" name="typeId" value="2"> 我要招聘 </label>
        </div>
      	
      
       <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="button" class="btn btn-primary btn-block btn-flat btn-register">注册</button>
          <button type="button" class="btn btn-primary btn-block btn-flat btn-back">返回登录</button>
          	<!-- 
          <button type="button" class="btn btn-primary btn-block btn-flat btn-login">已有账号? 点击登录</button>
        	 -->
        </div>
        <!-- /.col -->
      </div>
    </form>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<script>

  $(function () {

    $(".btn-register").click(doRegister);
    $(".btn-back").click(doBack);
    $(".btn-login").click(doLogin);
  });
  
  function doRegister(){
	  var params={
				 username:$("#usernameId").val(),
				 password:$("#passwordId").val(),
				 repassword:$("#repasswordId").val(),
				 phone:$("#phoneId").val(),
				 email:$("#emailId").val(),
				 roleid:$("form input[name='typeId']:checked").val()
			  }
	  var url="user/save";
	  $.post(url,params,function(result){
		  if(result.status==200){
			//跳转到indexUI对应的页面
			alert("~ 恭喜,注册成功 ! 请到登录界面登录一下试试 ~ ");
			
			location.href="login";
		  }else{
			$(".login-box-msg").html(result.message); 
		  }
		  return false;//防止刷新时重复提交
	  });
  }
  
	function doBack(){
		location.href="login";
	}
 	
	function doLogin(){
		location.href="login"
	}
 	
	$(".login-box").css("width","500px").css("height","800px").css("padding","50px");
 	
</script>
</body>
</html>
