<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Course Details</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            color: #007BFF;
            margin-bottom: 10px;
        }

        .course-details {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .course-name {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .course-description {
            font-size: 1.2rem;
            color: #6c757d;
        }

        .page-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #007BFF;
        }
    </style>
</head>
<body>
<%@ include file="profile.jsp" %>
<jsp:include page="sidebar.jsp"/>
<div class="container">
    <div class="page-header">
        <h1 class="page-title">Your Course Details</h1>
    </div>
    <div class="course-details">
        <h2 class="header course-name"><c:out value="${InstructorCourse.name}"/></h2>
        <p class="header course-description"><c:out value="${InstructorCourse.description}"/></p>
    </div>
</div>
</body>
</html>
