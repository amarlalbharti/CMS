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

	<div class="content-wrapper">
       
    <section class="content-header">
      <h1 class="page-header">Welcome to Complaint Management System</h1>
      <ol class="breadcrumb">
        <li><a href="deptDashboard"><i class="fa fa-dashboard"></i> Home Page</a></li>
        <!-- <li><a href="adminUnitList"><i class="fa fa-dashboard"></i> Unit List</a></li> -->
       
      </ol>
    </section>
       
       
    <!-- Main content -->
    <section class="content">
		
      <!-- Your Page Content Here -->
			<div class="row">
	    	 <div class="col-lg-3 col-xs-6">
		    	 <div class="small-box bg-purple">
		           <div class="inner">
		             <%-- <h3>${emp_count}</h3> --%>
					 <h4>451</h4>
		             <p>Total Solved Complain</p>
		           </div>
		           <div class="icon">
		             <i class="ion ion-clock"></i>
		           </div>
		           <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		         </div>
	        </div>
	        <div class="col-lg-3 col-xs-6">
		    	 <div class="small-box bg-maroon">
		           <div class="inner">
		             <h4>342</h4>
		
		             <p>Total Pending Complain</p>
		           </div>
		           <div class="icon">
		             <i class="ion ion-clock"></i>
		           </div>
		           <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		         </div>
	        </div>
			<div class="col-lg-3 col-xs-6">
		    	 <div class="small-box bg-yellow">
		           <div class="inner">
		             <h4>347</h4>
		
		             <p>Total Accepted Suggestions</p>
		           </div>
		           <div class="icon">
		             <i class="fa fa-fw fa-calendar-times-o"></i>
		           </div>
		           <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		         </div>
	        </div>
			<div class="col-lg-3 col-xs-6">
		    	 <div class="small-box bg-red">
		           <div class="inner">
		             <h4>432</h4>
		
		             <p>Total Accepted Suggestions</p>
		           </div>
		           <div class="icon">
		             <i class="fa fa-fw fa-calendar-times-o"></i>
		           </div>
		           <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		         </div>
	        </div>
			
			<div class="col-xs-12 col-md-8">
			<!-- <div class="box box-info"> -->
					<!-- <div class="box-header with-border">
						  <h3 class="box-title">User List</h3>
						   <div class="pull-right " style="padding-left: 20px;">
				             <a href="adminAddUser" class="btn btn-primary xs btn-xs">Add User</a>
			               </div>
						 </div> -->
						 
		<div class="box box-primary">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title">To Do List</h3>

              <!-- <div class="box-tools pull-right">
                <ul class="pagination pagination-sm inline">
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
              </div> -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="todo-list">
              
              <li class="list-group-item fist-item">
                  <span class="pull-right">
                      16-Jan-2016
                  </span>
                  <span class="label label-success">1</span>&nbsp;&nbsp;&nbsp;&nbsp; Last Generated Complaint of Token No : C18012015
              </li>
              
              <li class="list-group-item fist-item">
                  <span class="pull-right">
                      18-Jan-2016
                  </span>
                  <span class="label label-primary">2</span>&nbsp;&nbsp;&nbsp;&nbsp; Last Generated Suggestion of Token No : S18012015
              </li>
              
              <li class="list-group-item fist-item">
                  <span class="pull-right">
                      16-Jan-2016
                  </span>
                  <span class="label label-default">3</span>&nbsp;&nbsp;&nbsp;&nbsp; Last Resolved Complaint of Token No : C14012015
              </li>
              
              <li class="list-group-item fist-item">
                  <span class="pull-right">
                      154
                  </span>
                  <span class="label label-success">4</span>&nbsp;&nbsp;&nbsp;&nbsp; Total No of Generated Complain in current Month
              </li>
              
              <li class="list-group-item fist-item">
                  <span class="pull-right">
                      111
                  </span>
                  <span class="label label-primary">5</span>&nbsp;&nbsp;&nbsp;&nbsp; Total No of Resolved Complain in current Month
              </li>
              
              <li class="list-group-item fist-item">
                  <span class="pull-right">
                      123
                  </span>
                  <span class="label label-default">6</span>&nbsp;&nbsp;&nbsp;&nbsp; Total No of Pending Complain in current Month
              </li>
                <!-- <li>
                  drag handle
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                  checkbox
                  <input type="checkbox" value="">
                  todo text
                  <span class="text">Last Generated Complaint of Token No : C18012015</span>
                  Emphasis label
                  <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
                  General tools such as edit or delete
                  <div class="tools">
                    <i class="fa fa-edit"></i>
                    <i class="fa fa-trash-o"></i>
                  </div>
                </li> -->

              </ul>
            </div>
            <!-- /.box-body -->
<!--             <div class="box-footer clearfix no-border">
              <button type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> Add item</button>
            </div>
 -->          </div>
						 
						 
						 
						 
						 
						 
			</div>	  
		
			</div>
	<!-- </div> -->
 </section>
    <!-- /.content -->
  </div>

 </body> 