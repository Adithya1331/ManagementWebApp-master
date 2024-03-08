<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <style>
        .profile-section {
            position: fixed;
            top: 0;
            right: 0;
            padding: 10px;
            background-color: #FFFFFF;
            border: 1px solid #CCCCCC; /* Adjust border color */
            z-index: 1000;
            display: flex;
            align-items: center;
        }

        .profile-image {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-right: 10px;
            background-color: #3498db; /* Adjust background color */
        }

        .profile-info {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .profile-name {
            font-size: 14px;
            font-weight: bold;
        }

        .profile-role {
            font-size: 12px;
            color: #777777; /* Adjust text color */
        }
    </style>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<div class="profile-section">
    <div class="profile-image"></div>
    <div class="profile-info">
        <span class="profile-name"><sec:authentication property="principal.username"/></span>
        <span class="profile-role"><sec:authorize access="hasRole('ADMIN')">ADMIN</sec:authorize>
					<sec:authorize access="hasRole('INSTRUCTOR')">INSTRUCTOR</sec:authorize>
					<sec:authorize access="hasRole('STUDENT')">STUDENT</sec:authorize></span>
    </div>
</div>
</body>
</html>
