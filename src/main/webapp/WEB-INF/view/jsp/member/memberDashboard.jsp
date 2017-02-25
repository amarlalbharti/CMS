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
      <h1 class="page-header"> Pending Complain List </h1>
      <ol class="breadcrumb">
        <li><a href="userDashboard"><i class="fa fa-dashboard"></i> Home Page</a></li>
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
					
				
					
			<div class="col-xs-12 col-md-12">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">List of Pending Complain</h3>
						<!-- <div class="pull-right " style="padding-left: 20px;">
				           <a href="adminAddUser" class="btn btn-primary xs btn-xs">Add User</a>
			            </div> -->
						
 					</div>
					<div class="box-body table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th width="5%">S.n.</th>
									<th width="15%">Token Number</th>
									<th width="10%">Application</th>
									<th width="10%">Registration Date</th>
									<th width="10%">Remark</th>
									
									<!-- <th width="20%" class="text-center">Action</th> -->
								</tr>
							</thead>
							<tbody>
							<%-- <%
								List<UserMaster> userList = (List)request.getAttribute("userList");
								if(userList != null && !userList.isEmpty())
								{
									int i = 1;
									for(UserMaster ul : userList)
									{
										%>
											<tr>
												<td><%= i++ %></td>
												
												<td><%= ul.getUserName() %> </td>
												<td><%= ul.getUserCode() %> </td>
												<td><%= ul.getDesignation() %> </td>
												<td><%= ul.getUnitMaster().getUnitDescription() %> </td>
												
												<td class="text-center"> 
												  <a class="btn btn-primary btn-xs" href="secureEditUser?userId=<%= ul.getUserId() %>" ><i class="fa fa-fw fa-edit"></i> Edit</a>
												  <a class="btn btn-primary btn-xs" href="secureViewUser?userId=<%= ul.getUserId() %>" ><i class="fa fa-fw fa-edit"></i> View</a>
												</td>
											</tr>
										<%
									}
								}
								else
								{
									%> --%>
										<tr>
											<td colspan="9">No data in the data source.</td>
										</tr>
									<%-- <%
								}
							%> --%>
							</tbody>
						</table>
					</div>
				</div>
    		</div>
    		</div>
	</div>
 </section>
    <!-- /.content -->
  </div>