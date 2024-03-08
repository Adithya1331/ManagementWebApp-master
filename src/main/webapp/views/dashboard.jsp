<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@ include file="profile.jsp" %>
<jsp:include page="sidebar.jsp"/>
    <h1 style="display: flex; justify-content: center; align-items: center; height: 100vh;">Welcome to your Dashboard <sec:authentication property = "principal.username" /></h1>
</body>
</html>
