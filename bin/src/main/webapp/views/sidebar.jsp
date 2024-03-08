<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="../style.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="sidebar close">
    <ul class="nav-links">
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li>
                <div class="icon-link">
                    <a href="#">
                        <i class='bx bx-collection'></i>
                        <span class="link_name">Instructor</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a href="allInstructors">All Instructors</a></li>
                    <li><a href="addInstructorForm">Add Instructor</a></li>
                    <li><a href="assignInstructorCourseForm">Assign Course</a></li>
                </ul>
            </li>
            <li>
                <div class="icon-link">
                    <a href="#">
                        <i class='bx bx-book-alt symbol'></i> <span class="link_name">Courses</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a href="allCourses">All Courses</a></li>
                    <li><a href="addCourseForm">Add Course</a></li>
                </ul>
            </li>
            <li>
                <div class="icon-link">
                    <a href="#">
                        <i class='bx bx-plug'></i>
                        <span class="link_name">Students</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a href="allStudents">All Students</a></li>
                    <li><a href="addStudentForm">Add Student</a></li>
                </ul>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_INSTRUCTOR')">
            <li>
                <div class="icon-link">
                    <a href="instructorCourse">
                        <i class='bx bx-plug'></i>
                        <span class="link_name">Your Course</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="assignCourseToStudentForm">
                        <i class='bx bx-plug'></i>
                        <span class="link_name">Assign Course</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="instructorCourseStudents">
                        <i class='bx bx-plug'></i>
                        <span class="link_name">Your Students</span>
                    </a>
                </div>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_STUDENT')">
            <li>
                <div class="icon-link">
                    <a href="studentInstructors">
                        <i class='bx bx-plug'></i>
                        <span class="link_name">Instructors</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="studentCourses">
                        <i class='bx bx-plug'></i>
                        <span class="link_name">Courses</span>
                    </a>
                </div>
            </li>
        </sec:authorize>
        <li>
            <div class="icon-link">
                <a href="/logout">
                    <i class='bx bx-plug'></i>
                    <span class="link_name">Logout</span>
                </a>
            </div>
        </li>
    </ul>
</div>
<div class="sidebar close">
    <div class="home-content">
        <a href="#" id="menuToggle">
            <i class='bx bx-menu menu-icon-large'></i> <span class="text"></span>
            <span class="text"></span>
        </a>
    </div>
</div>
<script>
    let arrow = document.querySelectorAll(".arrow");
    for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e)=>{
            let arrowParent = e.target.parentElement.parentElement;
            arrowParent.classList.toggle("showMenu");
        });
    }

    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".bx-menu");
    console.log(sidebarBtn);
    sidebarBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("close");
    });
</script>
</body>
</html>
