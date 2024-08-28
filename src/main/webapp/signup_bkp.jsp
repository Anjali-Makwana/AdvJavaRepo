<%@ include file="header.jsp"%>
<style><%@include file="/WEB-INF/css/style.css"%></style>
<section class="vh-100 gradient-custom">
	<div class="container py-5 h-100">
		<div class="row justify-content-center align-items-center h-100">
			<div class="col-12 col-lg-9 col-xl-7">
				<div class="card shadow-2-strong card-registration"
					style="border-radius: 15px;">
					<div class="card-body p-4 p-md-5">
						<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Sign Up Form</h3>
						<form action="RegisterServlet" method="post"
							onsubmit="return validateForm()">

							<div class="row">
								<div class="col-md-6 mb-4">

									<div data-mdb-input-init class="form-outline">
										<label class="form-label" for="firstName">First Name</label> 
										<input type="text" id="firstName" class="form-control form-control-lg" name="firstName" /> 
										<small id="firstNameError" class="form-text text-danger error"></small>
									</div>

								</div>
								<div class="col-md-6 mb-4">

									<div data-mdb-input-init class="form-outline">
										<label class="form-label" for="lastName">Last Name</label> 
										<input type="text" id="lastName" class="form-control form-control-lg" name = "lastName" /> 
										<small id="lastNameError" class="form-text text-danger error"></small>
									</div>

								</div>

								<div class="col-md-6 mb-4">

									<h5 class="mb-2 pb-1">Gender:</h5>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gender"
											id="maleGender" checked /> <label class="form-check-label"
											for="maleGender">Male</label>
									</div>

									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gender"
											id="femaleGender" /> <label class="form-check-label"
											for="femaleGender">Female</label>
									</div>
								</div>

								<div class="col-md-6 mb-4">
								
									<div data-mdb-input-init class="form-outline">
										<label class="form-label" for="email">Email</label> 
										<input type="text" id="email" class="form-control form-control-lg" name = "email" /> 
										<small id="emailError" class="form-text text-danger error"></small>
									</div> 
								</div>
								
								<div class="col-md-6 mb-4">
								
									<div data-mdb-input-init class="form-outline">
										<label class="form-label" for="mobile">Mobile</label> 
										<input type="text" id="mobile" class="form-control form-control-lg" name = "mobile" /> 
										<small id="mobileError" class="form-text text-danger error"></small>
									</div> 
								</div>
								
								<div class="col-md-6 mb-4">
								
									<div data-mdb-input-init class="form-outline">
										<label class="form-label" for="address">Address</label> 
										<input type="text" id="address" class="form-control form-control-lg" name = "address" /> 
										<small id="addressError" class="form-text text-danger error"></small>
									</div> 
								</div>
								
								<div class="col-md-6 mb-4">
								
									<div data-mdb-input-init class="form-outline">
										<label class="form-label" for="password">Password:</label> 
										<input type="text" id="password" class="form-control form-control-lg" name = "password" /> 
										<small id="passwordError" class="form-text text-danger error"></small>
									</div> 
								</div>
								
								<div class="col-md-6 mb-4">
								
									<div data-mdb-input-init class="form-outline">
										<label class="form-label" for="confirmPassword">Confirm Password:</label> 
										<input type="text" id="confirmPassword" class="form-control form-control-lg" name = "confirmPassword" /> 
										<small id="confirmPasswordError" class="form-text text-danger error"></small>
									</div> 
								</div>

								<div class="mt-4 pt-2">
									<input data-mdb-ripple-init class="btn btn-primary btn-lg" type="submit" value="Submit" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
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