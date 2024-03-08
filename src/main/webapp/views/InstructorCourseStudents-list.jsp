<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>Students</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 2rem;
            min-height: 100vh;
        }

        .student-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .student-info {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .student-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #e9ecef;
            display: flex;
            justify-content:center;
            align-items: center;
            font-size: 1.5rem;
            font-weight: 600;
            color: #6c757d;
            margin-right: 1rem;
        }

        .student-name {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .student-details {
            margin-bottom: 1rem;
        }

        .student-details p {
            margin-bottom: 0.5rem;
        }

        .student-courses {
            display: flex;
            flex-wrap: wrap;
        }

        .course-badge {
            background-color: #007bff;
            color: #fff;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.9rem;
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body>
<%@ include file="profile.jsp" %>
<jsp:include page="sidebar.jsp"/>
<div class="container">
    <sec:authorize access="hasRole('ROLE_INSTRUCTOR')">
        <h2 class="mb-4">Students pursuing your Course</h2>
    </sec:authorize>
    <c:forEach var="student" items="${students}">
        <div class="student-card">
            <div class="student-info">
                <div class="student-avatar">
                        ${fn:toUpperCase(fn:substring(student.name, 0, 1))}
                </div>
                <div>
                    <h3 class="student-name"><c:out value="${student.name}"/></h3>
                    <p class="student-email"><c:out value="${student.email}"/></p>
                </div>
            </div>
            <div class="student-details">
                <p><strong>Date of Birth:</strong> <c:out value="${student.dateOfBirth}"/></p>
                <p><strong>Gender:</strong> <c:out value="${student.gender}"/></p>
            </div>
            <div class="student-courses">
                <c:if test="${student.courses != null}">
                    <c:forEach var="course" items="${student.courses}">
                        <span class="course-badge"><c:out value="${course.name}"/></span>
                    </c:forEach>
                </c:if>
                <c:if test="${student.courses == null}">
                    <span class="course-badge"><c:out value="N/A"/></span>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>