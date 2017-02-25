<%@page import="java.util.Calendar"%>
<%@page import="com.cms.domain.Registration"%>
<%@page import="com.cms.config.DateFormats"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link type="image/x-icon" href="images/favicon.png" rel="icon"> -->
<title></title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="css/select2.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/AdminLTE.css">
<link rel="stylesheet" href="css/skin-blue.css">
<link rel="stylesheet" href="css/datepicker3.css">
<script>
	function getLogOut() {
		if (XMLHttpRequest) {
			x = new XMLHttpRequest();
		} else {
			x = new ActiveXObject("Microsoft.XMLHTTP");
		}
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var res = x.responseText;
				// 		    		 alert(res);
				window.location.href = "${pageContext.request.contextPath}/j_spring_security_logout";
			}
		}
		x.open("GET", "${pageContext.request.contextPath}/insertLogOut", true);
		x.send();
		return true;
	}
</script>
<script src="js/jQuery-2.2.0.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>

<style type="text/css">
/* input[type="file"] {
    display: none !important;
} */
.custom-file-upload {
    cursor: pointer;
    margin-top: -30px !important;
    position: absolute !important;
}
.bodyCoverWait {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    z-index: 9999;
    opacity: 0.8;
    background: #ececec;
}
.atmail
{
   position: absolute;
   top: 5px;
   right: 10%;
   color: #999;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none;
   direction: ltr;
   z-index : 999;
}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini fixed">
<div class="bodyCoverWait" style="text-align: center; ">
	<img style="position: relative;top: 250px;" alt="Please wait..." src="images/loading_spinner.gif">
</div>
    <%
		Registration registration = (Registration) request.getSession().getAttribute("registration");
	%>

	<div class="wrapper">
		<header class="main-header"> <!-- Logo --> 
		
			<a href="index" class="logo" style="background-color: #fff;">
				<span class="logo-mini" style="color: #000;"><b>C</b>MS</span> <span class="logo-lg">
				<!-- <img alt="" src="images/images.png"> </span> -->
				<img alt="CMS" src="images/cms.jpg" style="width:230px; margin-bottom: -40px; padding-bottom: 0px; margin-left:-18px;"/>
			</a>
		 <!-- Header Navbar -->
	   <nav class="navbar navbar-static-top" role="navigation">
			 <!-- Sidebar toggle button--> 
			 <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
			   <span class="sr-only">Toggle navigation</span>
			 </a>
		 <!-- Navbar Right Menu -->
		 <div class="navbar-custom-menu">
			<!-- <ul class="nav navbar-nav"> -->
			<!-- <div class="pull-right">
				<button class="btn btn-default btn-flat" onclick="getLogOut()">
				<i class="fa fa-fw fa-sign-out"></i> Sign out</button>
			</div> -->
			
			<ul class="nav navbar-nav">
			<li class="dropdown user user-menu">
				<!-- Menu Toggle Button --> 
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
					<!-- The user image in the navbar--> 
					<img src="images/User_Avatar.png" class="user-image profile_image" alt="Image">
					<!-- hidden-xs hides the username on small devices so only the image appears. -->
					<span class="hidden-xs"><%=registration.getName()%></span>
				</a>
					<ul class="dropdown-menu">
						
						<!-- The user image in the menu -->
						<li class="user-header">
						
						
						
					<%--     <img src="<% if(img_path != null){out.println(img_path);}else{out.println("images/User_Avatar.png");} %>" class="img-circle profile_image" alt="Image">
         			 --%>	
         			 
         			  <img src="images/User_Avatar.png"class="img-circle profile_image" alt="Image">
         		
         			    <%-- <label class="custom-file-upload btn btn-block">
							<input id="profile-image" type="file" accept="image/jpg,image/png,image/jpeg,image/gif" onchange="uploadProfileImage();">
							<input type="hidden" id="userid" value="${registration.getUserid()}">
							<i class="fa fa-camera"></i>
						</label> --%>
						 <span class="text-danger"><label id="ui"></label></span>
							 <p>
								<%=registration.getName()%>
								<%---
								<%
									if (registration.getDesignation() != null)
									{
										out.println(registration.getDesignation().getDesignation());
									}
								%>
								--%>
								<small>Member since <%=DateFormats.ddMMMyyyy().format(registration.getRegdate())%></small>
							</p> 
						</li>

						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								 <sec:authorize access="hasRole('ROLE_APPADMIN')">
									<a href="appUserProfile" class="btn btn-default btn-flat"><i class="fa fa-fw fa-gears"></i>Profile</a>
								 </sec:authorize>
								 <sec:authorize access="hasRole('ROLE_ADMIN')">
									<a href="adminUserProfile" class="btn btn-default btn-flat"><i class="fa fa-fw fa-gears"></i>Profile</a>
								 </sec:authorize>
								 <sec:authorize access="hasRole('ROLE_USER')">
									<a href="userProfile" class="btn btn-default btn-flat"><i class="fa fa-fw fa-gears"></i>Profile</a>
								 </sec:authorize>
								 <sec:authorize access="hasRole('ROLE_DEPT')">
									<a href="deptUserProfile" class="btn btn-default btn-flat"><i class="fa fa-fw fa-gears"></i>Profile</a>
								 </sec:authorize>
							</div>
							<div class="pull-right">
								<button class="btn btn-default btn-flat" onclick="getLogOut()">
								<i class="fa fa-fw fa-sign-out"></i> Sign out</button>
							</div>
						</li>
					</ul>
				</li>
			
			</ul>
			
			
				
		 </div>
	   </nav>
 </header>
</div>
  
 <script type="text/javascript">

 	
	$(document).ready(function(){
		$('.bodyCoverWait').hide();
	});
	
	</script> 
	

