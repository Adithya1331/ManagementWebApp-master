<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Instructors</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            margin-top: 2rem;
            min-height: 100vh;
            margin-left: 250px; /* Adjust margin to accommodate the sidebar width */
            padding: 20px;
        }

        .instructor-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .instructor-info {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .instructor-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #e9ecef;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
            font-weight: 600;
            color: #6c757d;
            margin-right: 1rem;
        }

        .instructor-name {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .instructor-details {
            margin-bottom: 1rem;
        }

        .instructor-details p {
            margin-bottom: 0.5rem;
        }

        .instructor-course {
            background-color: #007bff;
            color: #fff;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<jsp:include page="sidebar.jsp"/>

<div class="container">
    <%@ include file="profile.jsp" %>
    <sec:authorize access="hasRole('ROLE_STUDENT')">
        <h2 class="mb-4">Your Instructors</h2>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <h2 class="mb-4">All Instructors</h2>
    </sec:authorize>
    <c:forEach var="instructor" items="${instructors}">
        <div class="instructor-card">
            <div class="instructor-info">
                <div class="instructor-avatar">
                        ${fn:toUpperCase(fn:substring(instructor.name, 0, 1))}
                </div>
                <div>
                    <h3 class="instructor-name"><c:out value="${instructor.name}"/></h3>
                    <p class="instructor-department"><c:out value="dept:-${instructor.department}"/></p>
                </div>
            </div>
            <div class="instructor-details">
                <c:if test="${instructor.course != null}">
                    <p><strong>Course:</strong> <span class="instructor-course"><c:out value="${instructor.course.name}"/></span></p>
                </c:if>
                <c:if test="${instructor.course == null}">
                    <p><strong>Course:</strong> <span class="instructor-course">N/A</span></p>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
