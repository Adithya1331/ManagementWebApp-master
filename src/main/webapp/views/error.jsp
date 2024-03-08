<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
           prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .error-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeInUp 1s ease-out;
        }

        h2 {
            color: #ff6347;
            font-size: 36px;
            margin-bottom: 10px;
            animation: bounceIn 1s ease-out;
        }

        h3 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            animation: fadeIn 1s ease-out;
        }

        p {
            color: #555;
            animation: fadeIn 1s ease-out;
        }

        i {
            color: #888;
            animation: fadeIn 1s ease-out;
        }


        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }


        @keyframes bounceIn {
            from, 20%, 40%, 60%, 80%, to {
                animation-timing-function: cubic-bezier(0.215, 0.610, 0.355, 1.000);

            }
            0% {
                opacity: 0;
                transform: scale3d(0 .3, 0 .3, 0 .3);
            }
            20% {
                transform: scale3d(
                        1 .1,
                        1 .1,
                        1 .1);
            }
            40% {
                transform: scale3d(
                        0 .9,
                        0 .9,
                        0 .9);


            }
            60% {
                opacity: 1;


                transform: scale3d(
                        1 .03,
                        1 .03,
                        1 .03);


            }

            80% {
                transform: scale3d(
                        0 .97,
                        0 .97,
                        0 .97);


            }

            to {
                opacity: 1;
                transform: scale3d(1, 1, 1);
            }

        }


        @keyframes fadeIn {
            from {
                opacity: 0;

            }

            to {
                opacity: 1;
            }
        }

        a {
            text-decoration: none;
            border-radius: 6px;
            padding: 5px 4px;
        }

        i a {
            color: grey;
            text-decoration: none;
            transition: color 0.3s, background-color 0.3s;
        }

        i a:hover {
            color: white;
            background-color: lightgrey;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h2>${message}</h2>
    <h3>${error}</h3>
    <p>${status}</p>
    <p>${timestamp}</p>
    <br>

    <sec:authorize access="hasRole('ADMIN')">
        <i><a href="/admin/dashboard">Back to Admin Panel</a></i>
    </sec:authorize>

    <sec:authorize access="hasRole('INSTRUCTOR')">
        <i><a href="/instructor/dashboard">Back to Instructor Panel</a></i>
    </sec:authorize>

    <sec:authorize access="hasRole('STUDENT')">
        <i><a href="/student/dashboard">Back to Student Panel</a></i>
    </sec:authorize>

</div>
</body>
</html>
