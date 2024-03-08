<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }


        .sidebar {
            width: 200px;
            background-color: #f1f1f1;
            padding: 20px;
        }


        .container {
            flex: 1;
            padding: 20px;
        }


        .page-header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }


        .course-details {
            margin-top: 20px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }


        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-weight: bold;
            margin-bottom: 10px;
        }

        select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%@ include file="profile.jsp" %>
<jsp:include page="sidebar.jsp"/>
<div class="container">
    <div class="page-header">
        <h1 class="page-title">Assign Course to Student</h1>
    </div>
    <div class="course-details">
        <form action="assignStudentCourse" method="post">
            <input type="hidden" name="courseId" value="${course.id}">
            <label for="studentId">Select Student:</label>
            <select name="studentId" id="studentId">
                <c:forEach var="student" items="${studentsNotInCourse}">
                    <option value="${student.id}">${student.name}</option>
                </c:forEach>
            </select>
            <button type="submit">Assign Student</button>
        </form>
    </div>
</div>
</body>
</html>
