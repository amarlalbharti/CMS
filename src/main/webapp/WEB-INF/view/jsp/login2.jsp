<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="css/blue.css">
<style type="text/css">

.error {
	color: red;
}
	
html 
{ 
  background: url(images/ems-bg.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
.bodyCoverWait {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    z-index: 9999;
    opacity: 0.9;
    background: #ececec;
}
</style>

</head>
<body class="hold-transition login-page" style="background: transparent;">
<div class="bodyCoverWait" style="text-align: center; ">
	<img style="position: relative;top: 250px;" alt="Please wait..." src="images/loading_spinner.gif">
</div>

<div class="login-box">
  <div class="login-logo" style="margin-bottom: 0px; padding-bottom: 0px;">
    <a href="index"><img alt="Vasonomics" src="images/images.jpg" style="width:360px; margin-bottom: 0px; padding-bottom: 0px;"/></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">

  <form action="login" id="frmLogin" method="post">
		
	  <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Enter Code" name="userCode" id="userCode" required="required">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="password" id="password" required="required">
        <span class="fa fa-lock  form-control-feedback"></span>
      </div>
      
          
        <div class="row">
        <div class="col-xs-8">
          <div class="checkbox">
            <label>
              <input type="checkbox" name="_spring_security_remember_me"> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="fa fa-fw fa-sign-in"></i> Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.0 -->
<script src="js/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="js/bootstrap.js"></script>
<script>

$(document).ready(function(){
	$('.bodyCoverWait').hide();
});


</script>
</body>
</html>
