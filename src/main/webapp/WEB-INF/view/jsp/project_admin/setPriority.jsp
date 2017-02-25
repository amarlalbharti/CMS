<%-- <%@page import="com.testing.domain.UserMaster"%> --%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
</head>
<body>
<input type="hidden" id=mode name="mode" value="${mode}">
	<div class="content-wrapper">
       
       <section class="content-header">
      <h1 class="page-header"> Set Complain Priority </h1>
      					Set Urgent Priority for the Complaint which must be solved very Quickly. Set Priority as Normal which is not as much as important as Urgent Complaints.
 		
      <ol class="breadcrumb">
        <li><a href="adminDashboard"><i class="fa fa-dashboard"></i> Home Page</a></li>
        <!-- <li><a href="adminUserList"><i class="fa fa-dashboard"></i> User List</a></li> -->
       
      </ol>
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
					else if(status.equalsIgnoreCase("updated"))
					{
						%>
							<div class="alert alert-success alert-dismissible">
								<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Success !
								</h4>
								Record Updated successfully !
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
					
				
					
			<div class="box box-info">
					<%-- <%
				String mode=(String)request.getAttribute("mode");
				if(mode!=null){
				if ((mode).equalsIgnoreCase("add"))
				{
				
				%> --%>
					<div class="box-header with-border">
						<h3 class="box-title">Set Priority Of Complain</h3>
					</div>
						
						
						<div class="box-body table-responsive">
				            
	              <%--   	<form:form role="form" method="POST" action="adminAddUserDetail" commandName="userForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			      --%>         <div class="box-body">
				                <div class="form-group col-xs-12 col-md-6">
				                  <label>Token Number</label>
				                  <input type="text" id="module" class="form-control" value="6786789878" readonly="readonly">
				                </div>
				                
				                
				                <div class="form-group col-xs-12 col-md-6">
				                  <label>Application</label>
				                  <input type="text" id="module" class="form-control" value="DDO Portal" readonly="readonly">
				                </div>

							

								<div class="form-group col-xs-12 col-md-6">
				                  <label>Registration Date</label>
				                  <input type="text" id="module" class="form-control" value="23-01-2017" readonly="readonly">
				                </div>
				                
				                <div class="form-group col-xs-12 col-md-6">
				                  <label>Forwarded By</label>
				                  <input type="text" id="module" class="form-control" value="Project Admin" readonly="readonly">
				                </div>
				                
				                <div class="form-group col-xs-12 col-md-6">
				                  <label>Set Priority</label><span class="text-danger">*</span>
				                  <select id="priority" class="form-control"  tabindex="1">
				                  <option value=''>Select Priority</option>
				                   <c:forEach var="prt" items="${prtList}">
									 <option value='${prt.priorityId }'>${prt.priorityName}</option>
								   </c:forEach>
				                  </select>
				                </div>
				                
			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer col-xs-12 col-md-6">
			              	<div class="form-group col-xs-12 col-md-6">
			                	<button type="submit" class="btn btn-primary submit_btn" tabindex="11">Submit</button>
			                </div>
			              </div>
			              </div>
				</div>
    		</div>
	</div>
 </section>
    <!-- /.content -->
  </div>