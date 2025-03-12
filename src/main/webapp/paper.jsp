<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache"); 
    response.setHeader("Expires", "0"); // prevents caching at the proxy server
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="javax.servlet.http.Part"%>
<%@page import="java.util.ArrayList"%>
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
    <title>Online Examination System</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/form.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/logo21.png">
    <style>
        * {
            user-select: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }
        .warning {
            color: red;
            display: none;
            position: fixed;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            background: white;
            padding: 10px;
            border: 2px solid red;
            z-index: 1000;
        }
    </style>
</head>
<body onload="initializeExam()" oncontextmenu="return false;">
    <div class="warning" id="warningMessage"></div>
    <!-- --------------------- Navigation Bar --------------------- -->
    <nav class="main-nav flex-div">
        <div class="main-nav-left flex-div">
            <a href="#" class="nav-logo">Online Examination System</a>
        </div>
        <div class="main-nav-right flex-div" id="showprofilemenu">
            <%
                if (session.getAttribute("studStatus") != null) {
                    if (session.getAttribute("studStatus").equals("1")) {
                        String sid = (String) session.getAttribute("studId");
                        Student sd = DAO.getStudentDetails(sid);
            %>
                        <p class="user-name"><%= sd.getFirstname() %></p>
                        <span class="material-symbols-outlined">account_circle</span>
            <%
                    }
                }
            %>
        </div>
    </nav>
    
    <%
        if (session.getAttribute("examStatus") != null) {
            if (session.getAttribute("examStatus").equals("1")) {
                String exid1 = (String) session.getAttribute("startexam");
                Exam exdetail = DAO.getexamDetails(exid1);
                ArrayList list = DAO.getQuestions(exid1);
                int a = list.size();
                int b = Integer.parseInt(exdetail.getMarkright());
                int totalMarks = a * b;
    %>
    <!-- --------------------- Exam Section --------------------- -->
    <div class="exam-section">
        <div class="exam-container">
            <form action="Controller.jsp" name="quiz" method="post" class="signup">
                <input type="hidden" name="size" value="<%= list.size() %>">
                <input type="hidden" name="totalmarks" value="<%= exdetail.getMarkright() %>">
                <input type="hidden" name="totalmarksw" value="<%= exdetail.getMarkwrong() %>">
                <%
                    for (int k = 0; k < list.size(); k++) {
                        Question ques = (Question) list.get(k);
                %>
                <div class="newcont">
                    <div class="question1">
                        <p class="ques">Q <%= k+1 %>) <%= ques.getQues() %></p>
                        <p class="desc"><%= ques.getQdesc() %></p>
                    </div>
                    <div class="Answer">
                        <label class="A1">
                            <input type="radio" name="opt<%= k %>" onclick="recordAnswer(<%= k+1 %>, this.value)" value="<%= ques.getOptn1() %>">
                            <%= ques.getOptn1() %>
                        </label>
                        <label class="A1">
                            <input type="radio" name="opt<%= k %>" onclick="recordAnswer(<%= k+1 %>, this.value)" value="<%= ques.getOptn2() %>">
                            <%= ques.getOptn2() %>
                        </label>
                        <label class="A1">
                            <input type="radio" name="opt<%= k %>" onclick="recordAnswer(<%= k+1 %>, this.value)" value="<%= ques.getOptn3() %>">
                            <%= ques.getOptn3() %>
                        </label>
                        <label class="A1">
                            <input type="radio" name="opt<%= k %>" onclick="recordAnswer(<%= k+1 %>, this.value)" value="<%= ques.getOptn4() %>">
                            <%= ques.getOptn4() %>
                        </label>
                        <!-- Default option if none selected -->
                        <label class="A1" id="radio<%= k %>">
                            <input checked type="radio" name="opt<%= k %>" onclick="recordAnswer(<%= k+1 %>, this.value)" value="NOTSELECTED">
                            NOTSELECTED
                        </label>
                    </div>
                    <div class="answer1">
                        <p>Selected Answer: <input type="text" name="answer" id="result<%= k+1 %>" readonly></p>
                    </div>
                </div>
                <input type="hidden" name="cexamid<%= k %>" value="<%= ques.getExamid() %>">
                <input type="hidden" name="question<%= k %>" value="<%= ques.getQues() %>">
                <input type="hidden" name="questionid<%= k %>" value="<%= ques.getQuesid() %>">
                <%
                    }
                %>
                <hr>
                <div class="subexam">
                    <input type="hidden" name="marktot" value="<%= totalMarks %>">
                    <input type="hidden" name="page" value="exams">
                    <input type="hidden" name="operation" value="submitted">
                    <input type="submit" value="Submit Exam">
                </div>
            </form>
        </div>
        <div class="right-container">
            <div class="time">
                <p>Time Left : <b id="quiz-time-left"></b></p>
            </div>
            <div class="profile">
                <p>Name : <%= DAO.getStudentDetails((String)session.getAttribute("studId")).getFirstname() %> 
                    <%= DAO.getStudentDetails((String)session.getAttribute("studId")).getLastname() %>
                </p>
                <p>Exam Name : <%= exdetail.getExamtitle() %></p>
                <p>Total Questions : <%= list.size() %></p>
                <p>Total Marks : <%= totalMarks %></p>
                <p>Mark for Correct : <%= exdetail.getMarkright() %></p>
                <p>Mark for Wrong : <%= exdetail.getMarkwrong() %></p>
                <p>Exam Duration : <%= exdetail.getExamduration() %> Minutes</p>
            </div>
            <div class="profile1122" id="container">
                <video autoplay="true" id="videoElement"></video>
            </div>
        </div>
    </div>
    <!-- --------------------- Timer Script --------------------- -->
    <script type="text/javascript">
        var total_seconds = 60 * <%= Integer.parseInt(exdetail.getExamduration()) %> + 5; 
        var min = parseInt(total_seconds / 60);
        var sec = parseInt(total_seconds % 60);
        function CheckTime() {
            document.getElementById("quiz-time-left").innerHTML = '' + min + ':' + (sec < 10 ? "0" + sec : sec);
            if (total_seconds <= 0) {
                setTimeout(function() {
                    document.quiz.submit();
                }, 1);
            } else {
                total_seconds--;
                min = parseInt(total_seconds / 60);
                sec = parseInt(total_seconds % 60);
                setTimeout(CheckTime, 1000);
            }
        }
        setTimeout(CheckTime, 1000);
    </script>
    <!-- --------------------- Instruction Notice --------------------- -->
    <div class="instuction" id="instr">
        <div class="insthead">
            <span class="flex-div-center">Exam Instructions</span>
        </div>
        <div class="instuction1">
            <h2>Important Exam Instructions:</h2>
            <ul>
                <li>The exam runs in fullscreen mode. Do not exit fullscreen.</li>
                <li>All keyboard inputs are disabled during the exam.</li>
                <li>If you switch tabs, minimize the browser, or use the back button, the exam will automatically be submitted.</li>
                <li>Any attempt to copy, paste, or perform keyboard shortcuts is blocked.</li>
                <li>Use your mouse only to select answers.</li>
                <li>Please read every question carefully before choosing an answer.</li>
                <li>Best of Luck!</li>
            </ul>
            <div class="start">
                <input type="button" onclick="closeInstructions()" value="Start Exam">
            </div>
        </div>
    </div>
    <%
            } // end examStatus check
        }
    %>
    <!-- --------------------- JavaScript for Exam Functionality --------------------- -->
    <script type="text/javascript">
        function initializeExam() {
            showInstructions();
            disableKeyboard();
            setupSecurity();
            // Push a new state to block the back button
            history.pushState(null, null, location.href);
            window.addEventListener('popstate', function(event) {
                // Back button pressed – force exam submission
                forceSubmit();
            });
        }
        function showInstructions() {
            document.getElementById("instr").style.display = "block";
        }
        function closeInstructions() {
            document.getElementById("instr").style.display = "none";
            enterFullScreen();
        }
        // Record the selected answer for each question
        function recordAnswer(questionNumber, answer) {
            document.getElementById("result" + questionNumber).value = answer;
        }
        // Disable all keyboard inputs
        function disableKeyboard() {
            document.addEventListener('keydown', function(e) {
                e.preventDefault();
                return false;
            });
        }
        // Enter fullscreen mode
        function enterFullScreen() {
            var elem = document.documentElement;
            if (elem.requestFullscreen) {
                elem.requestFullscreen();
            } else if (elem.mozRequestFullScreen) { /* Firefox */
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
                elem.webkitRequestFullscreen();
            } else if (elem.msRequestFullscreen) { /* IE/Edge */
                elem.msRequestFullscreen();
            }
        }
        // Setup security to prevent actions like copy/paste and monitor focus changes
        function setupSecurity() {
            var preventAction = function(e) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            };
            document.addEventListener('copy', preventAction);
            document.addEventListener('cut', preventAction);
            document.addEventListener('paste', preventAction);
            document.addEventListener('contextmenu', preventAction);
            document.addEventListener('selectstart', preventAction);
            
            // Monitor visibility changes: if the tab loses focus, auto-submit the exam immediately.
            document.addEventListener('visibilitychange', function() {
                if (document.visibilityState === 'hidden') {
                    showWarning('You have left the exam page. The exam will now be submitted.');
                    forceSubmit();
                }
            });
        }
        function showWarning(message) {
            var warning = document.getElementById('warningMessage');
            warning.textContent = message;
            warning.style.display = 'block';
            setTimeout(function() {
                warning.style.display = 'none';
            }, 3000);
        }
        // Force submission of the exam form
        function forceSubmit() {
            document.quiz.submit();
        }
        // Video capture for exam proctoring
        var video = document.getElementById('videoElement');
        if (navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: true })
            .then(function(stream) {
                video.srcObject = stream;
            })
            .catch(function(error) {
                console.log("Error accessing video stream: ", error);
            });
        } else {
            console.log("getUserMedia not supported in this browser.");
        }
    </script>
</body>
</html>
