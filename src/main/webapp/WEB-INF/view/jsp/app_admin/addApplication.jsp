<%-- <%@page import="com.testing.domain.UserRole"%> --%>
<%@page import="com.cms.domain.Application"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.cms.config.Roles"%>
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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
</head>
<body>
<input type="hidden" id=mode name="mode" value="${mode}">
	<div class="content-wrapper">
       <%-- <%
       		UserMaster registration = (UserMaster) request.getSession().getAttribute("registration");
       %> --%>
    <section class="content-header">
      <h1 class="page-header">Please Enter Following Detail to Add New Application</h1>
      <ol class="breadcrumb">
        <li><a href="appDashboard"><i class="fa fa-dashboard"></i>Home Page</a></li>
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
					else if(status.equalsIgnoreCase("failed"))
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
					<%
				String mode=(String)request.getAttribute("mode");
				if(mode!=null){
				if ((mode).equalsIgnoreCase("add"))
				{
				
				%>
					<div class="box-header with-border">
						<h3 class="box-title">Add New Application</h3>
					</div>
						
					<%
				}
				else if ((mode).equalsIgnoreCase("edit"))
					{
					
					%>	
					
					
					<div class="box-header with-border">
						<h3 class="box-title">Update Application</h3>
					</div>
					<%
					}
					%>
						<div class="box-body table-responsive">
				            
	                	<form:form role="form" method="POST" action="appAddApplication" commandName="appForm" autocomplete="off" enctype="multipart/form-data" id="form" onsubmit="return validateForm()">
			              <div class="box-body">
			                <div class="form-group col-xs-12 col-md-6">
			                  <form:hidden path="applicationId" cssClass="form-control" />
			                  <label>Select Department</label><span class="text-danger">*</span>
			                  <form:select path="department.departmentId" class="form-control"  tabindex="1" id="department">
			                   <form:option value='0'>Select Department</form:option>
			                   <c:forEach var="dept" items="${deptList}">
								 <form:option value='${dept.departmentId }'>${dept.departmentName}</form:option>
							   </c:forEach>
			                  </form:select>
			                  <span class="text-danger"><form:errors path="department" /></span>
			                </div>

							<div class="form-group col-xs-12 col-md-6">
			                  <label>Enter Application</label><span class="text-danger">*</span>
			                  <form:input path="applicationName" class="form-control titleCase"  placeholder="Enter Application" tabindex="1" maxlength="50" pattern="^(?!\s*$)[-a-zA-Z ]*$"/>
			                   <span class="text-danger"><form:errors path="applicationName" /></span>
			                </div>

			              </div>
			              <!-- /.box-body -->
			              <div class="box-footer col-xs-12 col-md-6">
			              	<div class="form-group col-xs-12 col-md-6">
			                	<button type="submit" class="btn btn-primary submit_btn" tabindex="11">Submit</button>
			                </div>
			              </div>
			              </form:form>
			              </div>
			              <%
				}
			              %>
				</div>
			</div>			
		</div>
			     </section>       
			 <section class="content">            
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">Application List</h3>
						<div class="pull-right " style="padding-left: 20px;">
				           <a href="appApplication" class="btn btn-primary xs btn-xs">Add Application</a>
			            </div>
 					</div>
					<div class="box-body table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th width="10%">S.n.</th>
									<th width="20%">Department Name</th>
									<th width="20%">Application Name</th>
									
									<th width="20%" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
							
							
							<%
								List<Application> appList = (List)request.getAttribute("appList");
								if(appList != null && !appList.isEmpty())
								{
									int i = 1;
									for(Application app : appList)
									{
										%>
											<tr>
												<td><%= i++ %></td>
												<td><%= app.getDepartment().getDepartmentName() %> </td>
												<td><%= app.getApplicationName() %> </td>
												
												<td class="text-center"> 
												<a class="btn btn-primary btn-xs" href="appApplication?applicationId=<%= app.getApplicationId() %>" ><i class="fa fa-fw fa-edit"></i> Edit</a>
												</td>
											</tr>
										<%
									}
								}
								else
								{
									%>
										<tr>
											<td colspan="9">No data in the data source.</td>
										</tr>
									<%
								}
							%>
							</tbody>
						</table>
					</div>
				</div>
    		</div>
		</div>	
	</section>
</div>
				
			
	
	
 
    <!-- /.content -->

<script src="js/jQuery-2.2.0.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function()
		 {
		 	$("#form").trigger('reset');
		 });

</script>
		 
		 <script type="text/javascript">

		 	function validateForm() {
		 		
		 		var department = $("#department").val();
		 		var applicationName = $("#applicationName").val();

		 		var valid = true;
		 		$('.has-error').removeClass("has-error");
		 		$(".error-messages").text("").fadeIn();
		 		
		 		if (department == ""||department == "0") {
		 			$("#department").parent().addClass("has-error")
		 				valid = false;
		 		}
		 		
		 		if (applicationName == "") {
		 			$("#applicationName").parent().addClass("has-error")
		 				valid = false;
		 		}

		 		if (!valid) {
		 			return false;
		 		}
		 		$(".submit_btn").attr("disabled", "disabled");
		 		if (($("#mode").val()) == 'add') {
		 			$("#submit_btn").text("Saving...");
		 		}

		 		if (($("#mode").val()) == 'edit') {
		 			$("#submit_btn").text("Updating...");
		 		}
		 	}
 </script>
 </body> 