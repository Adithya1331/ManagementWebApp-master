<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>Courses</title>
    <style>
        body {
            padding-top: 0;
            font-family: 'Poppins', sans-serif; /* Added font family */
        }
        .container {
            margin-top: 1rem;
            min-height: 100vh;
            margin-left: 250px; /* Adjust margin to accommodate the sidebar width */
            padding: 20px;
        }
        .course-list {
            list-style-type: none;
            padding: 0;
        }
        .course-item {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 1rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .course-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .course-name {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        .course-description {
            color: #6c757d;
            margin-bottom: 0.5rem;
        }
        .course-instructor {
            color: #6c757d;
            font-style: italic;
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp"/>
<%@ include file="profile.jsp" %>

<div class="container">
    <sec:authorize access="hasRole('ROLE_STUDENT')">
        <h2 class="mb-4">Your Courses</h2>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <h2 class="mb-4">All Courses</h2>
    </sec:authorize>
    <ul class="course-list">
        <c:forEach var="course" items="${courses}">
            <li class="course-item">
                <div class="course-details">
                    <div>
                        <h3 class="course-name"><c:out value="${course.name}"/></h3>
                        <p class="course-description"><c:out value="${course.description}"/></p>
                        <p class="course-instructor">
                            Instructor: <c:out value="${course.instructor != null ? course.instructor.name : 'N/A'}"/>
                        </p>
                    </div>
                    <div>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>

</body>
</html>
