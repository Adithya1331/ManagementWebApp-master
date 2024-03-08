<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            padding: 20px;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header {
            font-size: 24px;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
        }
        input[type="text"],
        input[type="date"],
        input[type="tel"],
        input[type="email"],
        input[type="radio"] + label {
            font-size: 14px;
            padding: 6px;
            margin-bottom: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .radio-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .radio-group label {
            margin: 0;
            font-weight: normal;
        }
        button {
            width: 100%;
            padding: 8px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        button:hover {
            background-color: #0056b3;
        }
        @media (max-width: 600px) {
            .container {
                width: 90%;
                margin: 10px;
            }
        }
    </style>
</head>
<body>
<%@ include file="profile.jsp" %>
<jsp:include page="sidebar.jsp"/>
<div class="container">
    <div class="header">Add Student</div>
    <form action="addStudent" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" required>
        </div>
        <div class="form-group">
            <label>Gender:</label>
            <div class="radio-group">
                <input type="radio" id="male" name="gender" value="M">
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="F">
                <label for="female">Female</label>
                <input type="radio" id="other" name="gender" value="O">
                <label for="other">Other</label>
            </div>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" pattern="[0-9]+" title="Please enter a valid phone number (numeric only)" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <button type="submit">Submit</button>
        </div>
    </form>
</div>
</body>
</html>
