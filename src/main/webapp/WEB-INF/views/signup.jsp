<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
    <div class="header">
        <h1>Sign up to <a href="/">Talkdesk</a>, Inc.</h1>
    </div>
    <div class="container">
        

        <div class="form">
            <form action="" method="post">
                <label for="fullname">Full Name</label>
                <input type="text" name="fullname" id="fullname" placeholder="fullname" required>

                <label for="phonenumber">Phone Number</label>
                <input type="tel" name="phonenumber" id="phonenumber" placeholder="phonenumber" required>

                <label for="email">Email Address</label>
                <input type="email" name="email" id="email" placeholder="Email" required>

                  
                <div class="password-container">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password" required>
                    <div class="eye" id="eye-icon"></div>
                </div>
        
                <label for="Confirmpassword">Confirm Password</label>
                <input type="password" name="Confirmpassword" id="Confirmpassword" placeholder="Confirm password" required>
                <div class="submit">
                    <button id="btn-signup" type="submit">Sign in</button>
                </div>
            </form>
        </div>

        <script type="text/javascript">
	        const form = document.querySelector('form');
	        const password = document.querySelector('#password');
	        const confirm = document.querySelector('#Confirmpassword');
	
	        form.addEventListener('submit', function(event) {
	        if (password.value !== confirm.value) {
	            event.preventDefault();
	            alert('Password and Confirm Password do not match!');
	        }
	        });	
        
            const eyeIcon = document.getElementById('eye-icon');
            const passwordInput = document.getElementById('password');

            eyeIcon.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                if (type === 'password') {
                	this.style.backgroundImage = 'url(images/eye1.png)';
                } else {
                	this.style.backgroundImage = 'url(images/eye2.png)';
                }
            });

            passwordInput.addEventListener('input', function(event) {
                eyeIcon.style.backgroundImage = 'url(images/eye1.png)';
            });

            const phoneNumberInput = document.getElementById('phonenumber');
          
            phoneNumberInput.addEventListener('input', function(event) {
              const phoneNumberRegex = /^0[0-9]{9}$/;
              const phoneNumber = event.target.value;
          
              if (!phoneNumberRegex.test(phoneNumber)) {
                phoneNumberInput.setCustomValidity('Invalid phone number format. Please enter a valid phone number.');
              } else {
                phoneNumberInput.setCustomValidity('');
              }
            });
        </script>
        
    </div>
    <div class="forgot">
        <div class="k1">
            <p>Login to talkdesk, Inc.? <a href="login">Login</a></p>
            <p class="p2">If you've communicated with our support staff through email previously,
                you're alraedy registered. You probably don't have a password yet,
                through.
            </p>
        </div> 
    </div>
    
</body>