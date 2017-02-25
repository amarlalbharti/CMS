<%@page import="com.cms.domain.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
</head>
<body>
<aside class="main-sidebar">
<tilesx:useAttribute name="currentpage"/>
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
    
    <%
	      Registration registration = (Registration) request.getSession().getAttribute("registration");
    %>
	
      <!-- Sidebar user panel (optional) -->
       <div class="user-panel">
         <div class="pull-left image">
           <img src="images/User_Avatar.png" class="img-circle profile_image" alt="User Image"> 
    	 </div> 
         <div class="pull-left info">
	          <p><%= registration.getName() %></p>
	          <sec:authorize access="hasRole('ROLE_ADMIN')">
	          	<a href="javascript:void(0)">Project Admin</a>
	          </sec:authorize>
	          
	          <sec:authorize access="hasRole('ROLE_DEPT')">
	          	<a href="javascript:void(0)">Department</a>
	          </sec:authorize>
	          
	          <sec:authorize access="hasRole('ROLE_USER')">
	          	<a href="javascript:void(0)">User</a>
	          </sec:authorize>
	          
	          <sec:authorize access="hasRole('ROLE_APPADMIN')">
	          	<a href="javascript:void(0)">Application Admin</a>
	          </sec:authorize>
	          
	          
          <!-- Status -->
         </div>
         
         <!-- <div class="pull-left info">
	          <p>Saumya Srivastava</p>
	          <a href="javascript:void(0)">Admin</a>
        </div> -->
       </div>

      
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header text-bold" id="time" style="color: #fff">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        
         <sec:authorize access="hasRole('ROLE_DEPT')">
         
            <li class="${currentpage == 'deptDashboard' ? 'active' : ''}"><a href="deptDashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
	        
	        <li class="treeview  ${currentpage == 'newComplain' ? 'active' : ''} ${currentpage == 'loggedComplain' ? 'active' : ''} ${currentpage == 'solvedComplain' ? 'active' : ''} ${currentpage == 'pendingComplain' ? 'active' : ''}">
	          <a href="#">
	           <i class="fa fa-folder"></i> <span>Complain Section</span>
	            <i class="fa fa-angle-left pull-right"></i>
	          </a>
	          <ul class="treeview-menu">
		        <li class="${currentpage == 'newComplain' ? 'active' : ''}"><a href="deptLogNewComplain"><i class="fa fa-dashboard"></i> <span>Log New Complain</span></a></li>
	  <%--     	    <li class="${currentpage == 'loggedComplain' ? 'active' : ''}"><a href="deptTrackLogComplain"><i class="fa fa-dashboard"></i> <span>Track Logged Complain</span></a></li>
	      	    <li class="${currentpage == 'solvedComplain' ? 'active' : ''}"><a href="deptSolvedComplain"><i class="fa fa-dashboard"></i> <span>Solved Complain</span></a></li> --%>
	            <li class="${currentpage == 'pendingComplain' ? 'active' : ''}"><a href="deptViewComplain"><i class="fa fa-dashboard"></i> <span>View Complain</span></a></li>
	          
	          </ul>
	        </li>
	        <li class="treeview  ${currentpage == 'newSuggestion' ? 'active' : ''} ${currentpage == 'loggedSuggestion' ? 'active' : ''} ${currentpage == 'acceptedSuggestion' ? 'active' : ''} ${currentpage == 'pendingSuggestion' ? 'active' : ''}">
	          <a href="#">
	           <i class="fa fa-folder"></i> <span>Suggestion Section</span>
	            <i class="fa fa-angle-left pull-right"></i>
	          </a>
	          <ul class="treeview-menu">
		        <li class="${currentpage == 'newSuggestion' ? 'active' : ''}"><a href="deptLogNewSuggestion"><i class="fa fa-dashboard"></i> <span>Log New Suggestion</span></a></li>
	      	<%--     <li class="${currentpage == 'loggedSuggestion' ? 'active' : ''}"><a href="deptTrackLogSuggestion"><i class="fa fa-dashboard"></i> <span>Track Logged Suggestion</span></a></li>
	      	    <li class="${currentpage == 'acceptedSuggestion' ? 'active' : ''}"><a href="deptSolvedSuggestion"><i class="fa fa-dashboard"></i> <span>Accepted Suggestion</span></a></li> --%>
	            <li class="${currentpage == 'pendingSuggestion' ? 'active' : ''}"><a href="deptPendingSuggestion"><i class="fa fa-dashboard"></i> <span>View Suggestion</span></a></li>
	          
	          </ul>
	        </li>
	       
	       <%--  <li class="${currentpage == 'deptNewUser' ? 'active' : ''}"><a href="deptNewUser"><i class="fa fa-dashboard"></i> <span>Add New User</span></a></li> --%>
	        
   		 </sec:authorize>
   		 
   		<sec:authorize access="hasRole('ROLE_ADMIN')">
   		 			 
   		  <li class="${currentpage == 'adminDashboard' ? 'active' : ''}"><a href="adminDashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
	        <%-- <li class="treeview  ${currentpage == 'newComplain' ? 'active' : ''} ${currentpage == 'oldComplain' ? 'active' : ''}">
	          <a href="#">
	           <i class="fa fa-folder"></i> <span>Complain Section</span>
	            <i class="fa fa-angle-left pull-right"></i>
	          </a>
	          <ul class="treeview-menu">
		        <li class="${currentpage == 'newComplain' ? 'active' : ''}"><a href="#"><i class="fa fa-dashboard"></i> <span>New Complain</span></a></li>
	      	    <li class="${currentpage == 'oldComplain' ? 'active' : ''}"><a href="#"><i class="fa fa-dashboard"></i> <span>Old Complain</span></a></li>
	          </ul>
	        </li> --%>
	        
	        
	    <li class="treeview   ${currentpage == 'viewComplain' ? 'active' : ''} ${currentpage == 'setPriority' ? 'active' : ''} ${currentpage == 'workAssignment' ? 'active' : ''} ${currentpage == 'loggedComplain' ? 'active' : ''} ${currentpage == 'solvedComplain' ? 'active' : ''} ${currentpage == 'pendingComplain' ? 'active' : ''}">
            <a href="#">
              <i class="fa fa-share"></i> <span>Complain Section</span>
               <i class="fa fa-angle-left pull-right"></i>
            </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-folder"></i> New Complain<i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                <li class="${currentpage == 'viewComplain' ? 'active' : ''}"><a href="adminViewComplain"><i class="fa fa-circle-o"></i> View Complain</a></li>
           <%--      <li class="${currentpage == 'setPriority' ? 'active' : ''}"><a href="adminSetPriority"><i class="fa fa-circle-o"></i> Set Priority</a></li>
                <li class="${currentpage == 'workAssignment' ? 'active' : ''}"><a href="adminWorkAssignment"><i class="fa fa-circle-o"></i> Work Assignment</a></li> --%>
              </ul>
            </li>
            
            <li><a href="#"><i class="fa fa-folder"></i> Old Complain<i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
             <%--    <li class="${currentpage == 'loggedComplain' ? 'active' : ''}"><a href="adminTrackLogComplain"><i class="fa fa-circle-o"></i> Track Logged Complain</a></li>
                <li class="${currentpage == 'solvedComplain' ? 'active' : ''}"><a href="adminSolvedComplain"><i class="fa fa-circle-o"></i> Solved Complain</a></li> --%>
                <li class="${currentpage == 'pendingComplain' ? 'active' : ''}"><a href="adminPendingComplain"><i class="fa fa-circle-o"></i>View Complain</a></li>
              </ul>
            </li>
          </ul>
        </li>
	        
	        
	        <li class="treeview  ${currentpage == 'newSuggestion' ? 'active' : ''} ${currentpage == 'loggedSuggestion' ? 'active' : ''} ${currentpage == 'acceptedSuggestion' ? 'active' : ''} ${currentpage == 'pendingSuggestion' ? 'active' : ''}">
	          <a href="#">
	           <i class="fa fa-folder"></i> <span>Suggestion Section</span>
	            <i class="fa fa-angle-left pull-right"></i>
	          </a>
	          <ul class="treeview-menu">
		    <%--     <li class="${currentpage == 'newSuggestion' ? 'active' : ''}"><a href="adminLogNewSuggestion"><i class="fa fa-dashboard"></i> <span>Log New Suggestion</span></a></li>
	      	    <li class="${currentpage == 'loggedSuggestion' ? 'active' : ''}"><a href="adminTrackLogSuggestion"><i class="fa fa-dashboard"></i> <span>Track Logged Suggestion</span></a></li>
	      	    <li class="${currentpage == 'acceptedSuggestion' ? 'active' : ''}"><a href="adminSolvedSuggestion"><i class="fa fa-dashboard"></i> <span>Accepted Suggestion</span></a></li> --%>
	            <li class="${currentpage == 'pendingSuggestion' ? 'active' : ''}"><a href="adminPendingSuggestion"><i class="fa fa-dashboard"></i> <span>View Suggestion</span></a></li>
	          
	          </ul>
	        </li>
	        
	<%--             <li class="${currentpage == 'memberDashboard' ? 'active' : ''}"><a href="adminMemberDashboard"><i class="fa fa-dashboard"></i> <span>Manage Member</span></a></li>
		        <li class="${currentpage == 'manageProcess' ? 'active' : ''}"><a href="adminManageProcess"><i class="fa fa-dashboard"></i> <span>Manage Process/Link</span></a></li> --%>
	        
	         <li class="treeview  ${currentpage == 'adminNewUser' ? 'active' : ''} ${currentpage == 'adminUsersDashboard' ? 'active' : ''}">
	          <a href="#">
	           <i class="fa fa-folder"></i> <span>Add Members</span>
	            <i class="fa fa-angle-left pull-right"></i>
	          </a>
	          <ul class="treeview-menu">
	       
                    <li class="${currentpage == 'adminNewUser' ? 'active' : ''}"><a href="adminNewUser"><i class="fa fa-dashboard"></i> <span>Add New Member</span></a></li>
	    			<li class="${currentpage == 'adminUsersDashboard' ? 'active' : ''}"><a href="adminUsersDashboard"><i class="fa fa-dashboard"></i> <span>Users Dashboard</span></a></li>
		         </ul>
	         </li>
   		 </sec:authorize>
   		 
    		 
   		 <sec:authorize access="hasRole('ROLE_USER')">
   		 			 
   		    <li class="${currentpage == 'userDashboard' ? 'active' : ''}"><a href="userDashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
	   
	     </sec:authorize>
	     
	     
	     <sec:authorize access="hasRole('ROLE_APPADMIN')">
   		 			 
   		    <li class="${currentpage == 'appDashboard' ? 'active' : ''}"><a href="appDashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
	   		
	   		<li class="treeview  ${currentpage == 'appDepartment' ? 'active' : ''} ${currentpage == 'appApplication' ? 'active' : ''} ${currentpage == 'appModule' ? 'active' : ''} ${currentpage == 'appProcess' ? 'active' : ''}">
	          <a href="#">
	           <i class="fa fa-folder"></i> <span>Dynamic Data</span>
	            <i class="fa fa-angle-left pull-right"></i>
	          </a>
	          <ul class="treeview-menu">
		        <li class="${currentpage == 'appDepartment' ? 'active' : ''}"><a href="appDepartment"><i class="fa fa-dashboard"></i> <span>Add Department</span></a></li>
	      	    <li class="${currentpage == 'appApplication' ? 'active' : ''}"><a href="appApplication"><i class="fa fa-dashboard"></i> <span>Add Application</span></a></li>
                <li class="${currentpage == 'appModule' ? 'active' : ''}"><a href="appModule"><i class="fa fa-dashboard"></i> <span>Add Module</span></a></li>
	      	    <li class="${currentpage == 'appProcess' ? 'active' : ''}"><a href="appProcess"><i class="fa fa-dashboard"></i> <span>Add Process</span></a></li>
	  
	          </ul>
	        </li>
	        
	        <li class="treeview  ${currentpage == 'appProjectAdmin' ? 'active' : ''} ${currentpage == 'appProjectMember' ? 'active' : ''} ${currentpage == 'appNewUser' ? 'active' : ''} ${currentpage == 'appUsersDashboard' ? 'active' : ''}">
	          <a href="#">
	           <i class="fa fa-folder"></i> <span>Add Members</span>
	            <i class="fa fa-angle-left pull-right"></i>
	          </a>
	          <ul class="treeview-menu">
		<%--         <li class="${currentpage == 'appProjectAdmin' ? 'active' : ''}"><a href="appProjectAdmin"><i class="fa fa-dashboard"></i> <span>Add Project Admin</span></a></li>
	      	    <li class="${currentpage == 'appProjectMember' ? 'active' : ''}"><a href="appProjectMember"><i class="fa fa-dashboard"></i> <span>Add Project Member</span></a></li>  --%> 
	         
	            <li class="${currentpage == 'appNewUser' ? 'active' : ''}"><a href="appNewUser"><i class="fa fa-dashboard"></i> <span>Add New User</span></a></li>
	       		<li class="${currentpage == 'appUsersDashboard' ? 'active' : ''}"><a href="appUsersDashboard"><i class="fa fa-dashboard"></i> <span>Users Dashboard</span></a></li>
	    
	         
	         </ul>
	        </li>
	            
	        
	        
	     </sec:authorize>
   		 
   		 
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  
  
  
  
  
  