<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Assign Instructor to Course</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: inline-block;
            margin-bottom: 5px;
        }

        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@ include file="profile.jsp" %>
<jsp:include page="sidebar.jsp"/>
<h1 style="text-align: center">Assign Instructor to Course</h1>
<form action="assignInstructorCourse" method="post">
    <label for="instructorId">Instructor:</label>
    <select id="instructorId" name="instructorId">
        <c:forEach items="${unassignedInstructors}" var="instructor">
            <option value="${instructor.id}">${instructor.name}</option>
        </c:forEach>
    </select>
    <br>
    <label for="courseId">Course:</label>
    <select id="courseId" name="courseId">
        <c:forEach items="${unassignedCourses}" var="course">
            <option value="${course.id}">${course.name}</option>
        </c:forEach>
    </select>
    <br>
    <input type="submit" value="Assign">
</form>
</body>
</html>