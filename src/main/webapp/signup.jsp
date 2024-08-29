<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container mt-4">
    <h2>User Sign Up</h2>
   <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" class="form-control" id="firstName" name="firstName">
                <small id="firstNameError" class="form-text text-danger error"></small>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" class="form-control" id="lastName" name="lastName">
                <small id="lastNameError" class="form-text text-danger error"></small>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" class="form-control" id="email" name="email">
                <small id="emailError" class="form-text text-danger error"></small>
            </div>

            <div class="form-group">
                <label for="mobile">Mobile:</label>
                <input type="text" class="form-control" id="mobile" name="mobile">
                <small id="mobileError" class="form-text text-danger error"></small>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <textarea class="form-control" id="address" name="address"></textarea>
                <small id="addressError" class="form-text text-danger error"></small>
            </div>

            <div class="form-group">
                <label>Gender:</label><br>
                <input type="radio" id="genderMale" name="gender" value="Male"> Male<br>
                <input type="radio" id="genderFemale" name="gender" value="Female"> Female<br>
                <small id="genderError" class="form-text text-danger error"></small>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password">
                <small id="passwordError" class="form-text text-danger error"></small>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                <small id="confirmPasswordError" class="form-text text-danger error"></small>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
         <c:if test="${not empty message}">
            <div class="alert alert-danger mt-3">${message}</div>
        </c:if>
</div>

<script>
function validateForm() {
    let isValid = true;

    // Clear previous error messages
    document.querySelectorAll('.error').forEach(el => el.textContent = '');

    const firstName = document.getElementById("firstName").value.trim();
    if (firstName === "") {
        document.getElementById("firstNameError").textContent = "First Name is required.";
        isValid = false;
    }

    const lastName = document.getElementById("lastName").value.trim();
    if (lastName === "") {
        document.getElementById("lastNameError").textContent = "Last Name is required.";
        isValid = false;
    }

    const email = document.getElementById("email").value.trim();
    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (email === "") {
        document.getElementById("emailError").textContent = "Email is required.";
        isValid = false;
    } else if (!emailPattern.test(email)) {
        document.getElementById("emailError").textContent = "Invalid email format.";
        isValid = false;
    }

    const mobile = document.getElementById("mobile").value.trim();
    const mobilePattern = /^[0-9]{10}$/;
    if (mobile === "") {
        document.getElementById("mobileError").textContent = "Mobile number is required.";
        isValid = false;
    } else if (!mobilePattern.test(mobile)) {
        document.getElementById("mobileError").textContent = "Invalid mobile number. Must be 10 digits.";
        isValid = false;
    }

    const address = document.getElementById("address").value.trim();
    if (address === "") {
        document.getElementById("addressError").textContent = "Address is required.";
        isValid = false;
    }

    const genderMale = document.getElementById("genderMale").checked;
    const genderFemale = document.getElementById("genderFemale").checked;
    if (!genderMale && !genderFemale) {
        document.getElementById("genderError").textContent = "Gender is required.";
        isValid = false;
    }

    const password = document.getElementById("password").value;
    if (password === "") {
        document.getElementById("passwordError").textContent = "Password is required.";
        isValid = false;
    } else if (password.length < 8) {
        document.getElementById("passwordError").textContent = "Password must be at least 8 characters long.";
        isValid = false;
    }

    const confirmPassword = document.getElementById("confirmPassword").value;
    if (confirmPassword === "") {
        document.getElementById("confirmPasswordError").textContent = "Confirm Password is required.";
        isValid = false;
    } else if (password !== confirmPassword) {
        document.getElementById("confirmPasswordError").textContent = "Passwords do not match.";
        isValid = false;
    }

    return isValid;
}
</script>