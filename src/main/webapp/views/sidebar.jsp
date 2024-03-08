<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Sidebar</title>
</head>
<body>

<div class="sidebar close">
    <ul class="nav-links">
        <sec:authorize access="hasRole('ROLE_ADMIN')">

            <li>
                <div class="icon-link">
                    <a href="allInstructors">
                        <i class='bx bx-collection'></i>
                        <span class="link_name">All Instructors</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="addInstructorForm">
                        <i class='bx bx-collection'></i>
                        <span class="link_name">Add Instructor</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="assignInstructorCourseForm">
                        <i class='bx bx-collection'></i>
                        <span class="link_name">Assign Course</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="allCourses">
                        <i class='bx bx-book-alt symbol'></i>
                        <span class="link_name">All Courses</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="addCourseForm">
                        <i class='bx bx-book-alt symbol'></i>
                        <span class="link_name">Add Course</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="allStudents">
                        <i class='bx bx-plug'></i>
                        <span class="link_name">All Students</span>
                    </a>
                </div>
            </li>
            <li>
                <div class="icon-link">
                    <a href="addStudentForm">
                        <i class='bx bx-plug'></i>
                        <span class="link_name">Add Student</span>
                    </a>
                </div>
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

</body>
</html>
