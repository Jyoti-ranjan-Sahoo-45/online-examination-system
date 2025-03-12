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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="css/form.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/logo21.png">
</head>
<body>
    <nav class="main-nav flex-div">
        <div class="main-nav-left flex-div">
            <i class="fa fa-bars" aria-hidden="true" id="menu-icon"></i>
            <a href="" class="nav-logo">Online Examination System</a>
        </div>
        <div class="main-nav-right flex-div" id="showprofilemenu">
            <%if(session.getAttribute("studStatus")!=null){
                if(session.getAttribute("studStatus").equals("1")){ 
                    String sid = (String) session.getAttribute("studId");
                    Student sd = DAO.getStudentDetails(sid);
            %>
            <p class="user-name"><%=sd.getFirstname() %></p>
            <span class="material-symbols-outlined">arrow_drop_down</span>
            <span class="material-symbols-outlined">account_circle</span>
        </div>
        <div class="settings-menu">
            <div class="setting-inner">
                <div class="setting-inner-1">
                    <span class="material-symbols-outlined">account_circle</span>
                </div>
                <div class="setting-profile flex-div">
                    <p>Username:</p>
                    <p><%=sd.getFirstname() %> <%=sd.getLastname() %></p>
                </div>
                <hr>
                <div class="setting-profile flex-div">
                    <p>Email-Id:</p>
                    <p><%=sd.getStudentemailid()%></p>
                </div>
                <hr>
                <div class="setting-profile flex-div">
                    <p>Roll No.:</p>
                    <p><%=sd.getRollno()%></p>
                </div>
                <hr>
                <div class="setting-profile-1 flex-div">
                    <a href="Controller.jsp?page=logout"><button class="user-Edit-btn">Logout</button></a>
                    <button class="user-Edit-btn" id="showprofilemenu1" href="">Close</button>
                </div>
            </div>
        </div>
    </nav>
    <div class="main-sidebar">
        <div class="main-sidebar-links">
            <a href="stud-Page.jsp?spg=1" class="sidebar-links sidebar-links-1">
                <i class="fa fa-home" aria-hidden="true"></i>
                <p>Dashboard</p>
            </a>
            <a href="stud-Page.jsp?spg=2" class="sidebar-links active">
                <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                <p>Exam</p>
            </a>
            <a href="stud-Page.jsp?spg=3" class="sidebar-links">
                <i class="fa fa-list" aria-hidden="true"></i>
                <p>Notice</p>
            </a>
        </div>
    </div>
    <%
                if(request.getParameter("spg").equals("2")) { 
    %>
            <jsp:include page="stud-exam.jsp" />
    <%
            } else if(request.getParameter("spg").equals("1")) { 
    %>
            <jsp:include page="stud-Dashboard.jsp" />
    <%
            } else if(request.getParameter("spg").equals("3")) { 
    %>
            <jsp:include page="notice.jsp" />
    <%
            } else if(request.getParameter("spg").equals("4")) { 
    %>
            <jsp:include page="stud-Dashboard.jsp" />
    <%
            } else if(request.getParameter("spg").equals("11")) { 
                    String startexam = request.getParameter("startexam");
                    session.setAttribute("examStatus", "1");
                    session.setAttribute("startexam", startexam);
                    response.sendRedirect("paper.jsp");
            } else {    
    %>
            <jsp:include page="stud-exam.jsp" />
    <%
                }
            } else 
                response.sendRedirect("Student-Login.jsp?msg=1"); 
            } else 
                response.sendRedirect("Student-Login.jsp?msg=1"); 
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
