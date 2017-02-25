<%@page import="java.util.TimeZone"%>
<%@page import="com.cms.domain.UserRole"%>
<%@page import="com.cms.config.DateFormats"%>
<%@page import="com.cms.domain.Registration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
</head>
<body>

<%
	
	Registration registration = (Registration)request.getAttribute("registration");
	List<UserRole> roles = (List)request.getAttribute("roles");
	System.out.println("Regi : " + registration);
	%>
	<div class="content-wrapper">
    <section class="content-header">
      <h1 class="page-header">View Profile<small><%= registration.getName() %> (<%= registration.getUserId() %>)</small> </h1>
      
    </section>
    <!-- Main content -->
    <section class="content">
		      <!-- Your Page Content Here -->
		<div class="row">
			<div class="col-xs-12 col-md-12">
			
			
			  <%
				String status = (String)request.getParameter("status");
			    if(status != null)
				{
					if(status.equalsIgnoreCase("success"))
					{
						%>
							<div class="alert alert-success alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Success !
								</h4>
								Record Saved successfully !
							</div>
						<%
					}
					else if(status.equalsIgnoreCase("error"))
					{
						%>
							<div class="alert alert-danger alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Failed !
								</h4>
								Oops, Some error occurs !
							</div>
						<%
					}
				}
					%>
			
				
			<%
				String pwdstatus = (String)request.getAttribute("pwdstatus");
			    if(pwdstatus != null)
				{
					if(pwdstatus.equalsIgnoreCase("success"))
					{
						%>
							<div class="alert alert-success alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Success !
								</h4>
								Password Changed successfully !
							</div>
						<%
					}
					
					
					else if(pwdstatus.equalsIgnoreCase("notvalid"))
					{
						%>
							<div class="alert alert-danger alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Failed !
								</h4>
								Oops, Password is not valid. Use alphanumeric password !
							</div>
						<%
					}
					else if(pwdstatus.equalsIgnoreCase("notmatch"))
					{
						%>
							<div class="alert alert-danger alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Failed !
								</h4>
								Oops, Old Password not matched !
							</div>
						<%
					}
					else if(pwdstatus.equalsIgnoreCase("notsame"))
					{
						%>
							<div class="alert alert-danger alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Failed !
								</h4>
								Oops, confirm password not matched !
							</div>
						<%
					}
					else
					{
						%>
							<div class="alert alert-danger alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Failed !
								</h4>
								Oops, Something wrong !
							</div>
						<%
					}
					
				}
				
			%>
			</div>
			
			<div class="col-xs-12 col-md-12">
				<div class="box box-info">
					<div class="box-body no-padding">
						<div class="nav-tabs-custom no-margin">
				            <ul class="nav nav-tabs">
				              <li class="active"><a href="#tab_1" data-toggle="tab">Profile Summary</a></li>
				              <li><a href="#tab_4" data-toggle="tab">Change Password</a></li>
				              
				              </ul>
				            <div class="tab-content">
				              <div class="tab-pane active" id="tab_1">
								<div class="box-body">
									<div class="form-horizontal">
						              <div class="box-body">
		                                      <div class="form-group col-md-6 no-padding no-margin">
						                           <div class="form-group col-md-12 no-margin">
									                  <label class="col-sm-4 control-label" style="text-align: left;">Name</label>
									                  <div class="col-sm-8">
									                    <label class="form-control label-text"><%= registration.getName() %></label>
									                  </div>
									                </div>
									                <div class="form-group col-md-12 no-margin">
									                  <label class="col-sm-4 control-label"  style="text-align: left;">User ID</label>
									                  <div class="col-sm-8">
									                    <label class="form-control label-text"><%= registration.getUserId() %></label>
									                  </div>
									                </div>
									                
								                </div>
								                
								                <div class="form-group col-md-6 no-margin">
								                  <label class="col-sm-4 control-label"  style="text-align: left;">Gender</label>
								                  <div class="col-sm-8">
								                    <label class="form-control"><%= registration.getGender()%></label>
								                  </div>
								                </div>
								                
								                <div class="form-group col-md-6 no-margin">
								                  <label class="col-sm-4 control-label"  style="text-align: left;">Contact Number</label>
								                  <div class="col-sm-8">
								                    <label class="form-control"><%= registration.getContactNumber()%></label>
								                  </div>
								                </div>
								                
								                <div class="form-group col-md-6 no-margin">
								                  <label class="col-sm-4 control-label"  style="text-align: left;">Registration</label>
								                  <div class="col-sm-8">
								                    <label class="form-control"><%= DateFormats.ddMMMyyyy().format(registration.getRegdate()) %></label>
								                  </div>
								                </div>
								 <%--                <%	
													if( registration.getDepartment().getDepartmentName() != null && ! registration.getDepartment().getDepartmentName().isEmpty())
								 					{
										 						
												%>
								                <div class="form-group col-md-6 no-margin">
								                  <label class="col-sm-4 control-label"  style="text-align: left;">Department</label>
								                  <div class="col-sm-8">
								                    <label class="form-control"><%= registration.getDepartment().getDepartmentName() %></label>
								                  </div>
								                </div>
								                <%
								 					}
								                %>
                                     --%>								               
								                
								                <%
								                	
								                	if(roles != null && !roles.isEmpty())
								                	{
								                		%>
								                			<div class="form-group col-md-6 no-margin">
											                  <label class="col-sm-4 control-label"  style="text-align: left;">User Role</label>
											                  <div class="col-sm-8">
											                    <label class="form-control"><%= roles.get(0).getUserrole() %></label>
											                  </div>
											                </div>
								                		<%
								                	}
								                
								                %>
								                
								  						                
						              </div>
						            </div>
								</div>
							</div>
							
						   <div class="tab-pane" id="tab_4">
						    <form action="changePassword" method="POST" id="changePwd">		
								<div class="box-body">
									<div class="form-horizontal">
										<div class="box-body">
											<div class="form-group has-feedback col-md-6">
												<label class="col-sm-4 control-label" style="text-align: left;">Current Password</label>
												
												<div class="col-sm-8">
													<input type="password" class="form-control" placeholder="Current Password" name="j_password1" id="j_password1" required="required">
													<input type="hidden" name="userId" value="<%= registration.getUserId()%>">
			        								<span class="fa fa-lock  form-control-feedback"></span>
												</div>
											</div>
											<div class="clearfix"></div>
											<div class="form-group has-feedback col-md-6">
												<label class="col-sm-4 control-label" style="text-align: left;">New Password</label>
												
												<div class="col-sm-8">
													<input type="password" class="form-control" placeholder="Change Password" name="j_password2" id="j_password2" required="required">
					        						<span class="fa fa-lock  form-control-feedback"></span>
												</div>
											</div>
											<div class="clearfix"></div>
											<div class="form-group has-feedback col-md-6">
												<label class="col-sm-4 control-label" style="text-align: left;">Confirm Password</label>
												
												<div class="col-sm-8">
													<input type="password" class="form-control" placeholder="Confirm Password" name="j_password3" id="j_password3" required="required">
		        									<span class="fa fa-lock  form-control-feedback"></span>
												</div>
											</div>
											<div class="clearfix"></div>
											<div class="form-group has-feedback col-md-6">
												<button type="submit" class="btn btn-primary btn-flat" id="submit_btn">Submit</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
				</div></div>
			</div>
		   </div>
		  </div>
		</div>
    </section>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#changePwd").trigger('reset');
	});

	
</script>  
   
    <!-- /.content -->
  </div>
 </body>