<!DOCTYPE html>
<html>
<head>
    <title>Add Instructor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f2f5;
        }

        form {
            max-width: 500px;
            margin: auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        div {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"], input[type="tel"], input[type="email"], textarea {
            width: calc(100% - 16px);
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        @media screen and (max-width: 600px) {
            form {
                width: 100%;
                margin: 10px;
            }
        }
    </style>
</head>
<body>
<%@ include file="profile.jsp" %>
<jsp:include page="sidebar.jsp"/>
<h2 style="text-align: center; margin-bottom: 20px;">Add Instructor</h2>
<form action="addInstructor" method="post">
    <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
    </div>
    <div>
        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required>
    </div>
    <div>
        <label for="phoneNumber">Phone Number:</label>
        <input type="tel" id="phoneNumber" name="phoneNumber">
    </div>
    <div>
        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="5" cols="30" required></textarea>
    </div>
    <div>
        <button type="submit">Submit</button>
    </div>
</form>
</body>
</html>