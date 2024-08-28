<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Main Page</h2>
        <p>Welcome, ${user.firstName} ${user.lastName}!</p>
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ChangePasswordServlet">Change Password</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet">Logout (${user.email})</a>
            </li>
        </ul>
    </div>
</body>
</html>
