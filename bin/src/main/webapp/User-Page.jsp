<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OES</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/nav.css">
    <script src="https://kit.fontawesome.com/908f7da306.js" crossorigin="anonymous"></script>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="css/form.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/logo2.png">
</head>

<body>
 <!-- ---------------------nav bar-------------------------- -->
    <nav class="main-nav flex-div">
        <div class="main-nav-left flex-div">
            <i class="fa fa-bars" aria-hidden="true" id="menu-icon"></i>
            <a href="" class="nav-logo">Online Examination System</a>
        </div>
        <div class="main-nav-right flex-div" id="showprofilemenu">
            <%if(session.getAttribute("UserStatus")!=null){
            	if(session.getAttribute("UserStatus").equals("1")){ 
            		String id = (String) session.getAttribute("UserId");
                	User user=DAO.getUserDetails(id);
             %>
               <p class="user-name" ><%=user.getUsername() %></p><span class="material-symbols-outlined">
                arrow_drop_down
                </span>
                <span class="material-symbols-outlined ">
                    account_circle
                </span>
                 <%--  <%
            	}else{
            		response.sendRedirect("User-Login.jsp"); 
            	}
            }else{
            	response.sendRedirect("User-Login.jsp"); 
            }
            %> --%>
        </div>
        <!-- -----------------------profile---------------------- -->
        <div class="settings-menu" >
            <div class="setting-inner">
                <div class="setting-inner-1">
                    <span class="material-symbols-outlined ">
                        account_circle
                        </span>
                </div>
              
                <div class="setting-profile flex-div">
                    <p>Username:</p>
                    <p><%=user.getUsername() %></p>
                </div>
                <hr>
                <div class="setting-profile flex-div">
                    <p>Email-Id:</p>
                    <p><%=user.getEmail() %></p>
                </div>
                <hr>
                <div class="setting-profile flex-div">
                    <p>Phone No.:</p>
                    <p><%=user.getPhone_no() %></p>
                </div>
	                
	            
	            
                <hr>
                <div class="setting-profile-1 flex-div">
                    <button class="user-Edit-btn" onclick="openForm()" >Edit</button>
                    <a href="Controller.jsp?page=logout1"><button class="user-Edit-btn">Logout</button></a>
                    <button class="user-Edit-btn" id="showprofilemenu1" href="">Close</button>
                </div>
            </div>
        </div>
    </nav>

    <!-- ------------------------sidebar-------------------------------- -->
    <div class="main-sidebar">
        <div class="main-sidebar-links">
            <a href="User-Page.jsp?pg=1" class="sidebar-links sidebar-links-1"><i class="fa fa-home" aria-hidden="true"></i>
                <p>Dashboard</p>
            </a>
            <a href="User-Page.jsp?pg=2" class="sidebar-links active"><i class="fa fa-user-o" aria-hidden="true"></i>
                <p>Student</p>
            </a>
            <a href="User-Page.jsp?pg=3" class="sidebar-links"><i class="fa fa-graduation-cap" aria-hidden="true"></i>
                <p>Exam</p>
            </a>
            <a href="User-Page.jsp?pg=4" class="sidebar-links"><i class="fa fa-question-circle" aria-hidden="true"></i>
                <p>Question</p>
            </a>
            <a href="User-Page.jsp?pg=5" class="sidebar-links"><i class="fa fa-sticky-note-o" aria-hidden="true"></i>
                <p>Enroll</p>
            </a>
            <a href="User-Page.jsp?pg=6" class="sidebar-links"><i class="fa fa-list-alt" aria-hidden="true"></i>
                <p>Result</p>
            </a>
            <a href="User-Page.jsp?pg=7" class="sidebar-links"><i class="fa fa-list" aria-hidden="true"></i>
                <p>Notice</p>
            </a>
            <a href="" class="sidebar-links"><i class="fa fa-info-circle" aria-hidden="true"></i>
                <p>Help</p>
            </a>
        </div>
    </div>
    <!-- --------------------------main body ---------------------------------------------->
    <%
    /* if(session.getAttribute("UserStatus")!=null){
		if(session.getAttribute("UserStatus").equals("1")){  */
			if(request.getParameter("pg").equals("1")) { 
    %>
    			<jsp:include page="User-Dashboard.jsp" />
    <%
			}else if(request.getParameter("pg").equals("2")) { 
    %>
    			<jsp:include page="Manage-Student.jsp" />
    <%
			}else if(request.getParameter("pg").equals("3")) { 
    %>
    			<jsp:include page="Manage-Exam.jsp" />
    <%
			}else if(request.getParameter("pg").equals("4")) { 
    %>
    			<jsp:include page="Manage-Question.jsp" />
    <%
			}else if(request.getParameter("pg").equals("5")) { 
    %>
    			<jsp:include page="enroll.jsp" />
    <%	
    		}else if(request.getParameter("pg").equals("6")) { 
    %>
				<jsp:include page="Result-Page.jsp" />
	<%			
    		}else if(request.getParameter("pg").equals("7")) { 
   	%>
    			<jsp:include page="Instruction-Page.jsp" />
    <%
			}else{    
    %>
    			<jsp:include page="User-Dashboard.jsp" />
    <%		}
    	}else 
    		response.sendRedirect("User-Login.jsp?msg=1"); 
   	}else 
   		response.sendRedirect("User-Login.jsp?msg=1"); 
    
    %>
   

     <script>
        var app = angular.module('myApp', []);
        app.controller('myCtrl', function ($scope) {
            $scope.name = "";
        });
    </script>
    <script src="js/script.js"></script>
</body>
</html>