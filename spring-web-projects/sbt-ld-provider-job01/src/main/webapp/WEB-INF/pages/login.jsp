<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> User Login</title>
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
    <a href="#"><b>DataWork-</b>数据人才招聘专区</a>
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
        <input type="password" id="passwordId" name="password" class="form-control" placeholder="password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
     

      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="button" class="btn btn-primary btn-block btn-flat btn-login">登录</button>
          <button type="button" class="btn btn-primary btn-block btn-flat btn-register">注册</button>
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
	
    $(".btn-login").click(doLogin);
    $(".btn-register").click(doRegister);
    
  });
  
  function doLogin(){
	  var params={
		 username:$("#usernameId").val(),
		 password:$("#passwordId").val()
	  }
	  var url="user/doLogin";
	  $.post(url,params,function(result){
		  debugger
		  if(result.status==200){
			location.href="/home.jsp?t="+Math.random();
		  }else{
			$(".login-box-msg").css("color","red").html(result.message);
		  }
		  return false;//防止刷新时重复提交
	  });
  }
  
  function doRegister(){
		location.href="register"
  }
  
  $(".login-box").css("width","500px").css("height","600px").css("padding","50px");
  
</script>
</body>
</html>
