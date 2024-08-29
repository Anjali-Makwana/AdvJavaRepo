<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
    function validateLoginForm() {
        let isValid = true;

        // Clear previous error messages
        document.querySelectorAll('.error').forEach(el => el.textContent = '');

        const email = document.getElementById("email").value.trim();
        if (email === "") {
            document.getElementById("emailError").textContent = "Email is required.";
            isValid = false;
        }

        const password = document.getElementById("password").value;
        if (password === "") {
            document.getElementById("passwordError").textContent = "Password is required.";
            isValid = false;
        }

        return isValid;
    }
    </script>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post" onsubmit="return validateLoginForm()">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email">
                <small id="emailError" class="form-text text-danger error"></small>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password">
                <small id="passwordError" class="form-text text-danger error"></small>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <br>
        <a href="forgot_password.jsp">Forgot Password?</a>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger mt-3">${errorMessage}</div>
        </c:if>
    </div>
</body>
</html>
