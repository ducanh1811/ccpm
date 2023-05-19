<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div class="back">
		<a href="#"><img src="images/back.png" alt="">Back</a>
	</div>

	<div class="header">
		<h1>Đổi mật khẩu</h1>
	</div>
	<div class="container">
		<div class="form">
			<form action="/update" method="post">
				<input type="hidden" name="id" value="id"> <label
					for="oldpassword">Old Password</label> <input type="password"
					name="oldpassword" id="oldpassword" placeholder="Old password"
					required>

				<div class="password-container">
					<label for="password">New Password</label> <input type="password"
						name="password" id="password" placeholder="New Password" required>
					<div class="eye" id="eye-icon"></div>
				</div>

				<label for="Confirmpassword">Confirm New Password</label> <input
					type="password" name="Confirmpassword" id="Confirmpassword"
					placeholder="Confirm password" required>
				<div class="submit">
					<button type="submit">Cập nhật</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		const form = document.querySelector('form');
		const password = document.querySelector('#password');
		const confirm = document.querySelector('#Confirmpassword');

		form.addEventListener('submit', function(event) {
			if (password.value !== confirm.value) {
				event.preventDefault(); // ngăn chặn sự kiện submit
				alert('New Password and Confirm New Password do not match!');
			}
		});

		const eyeIcon = document.getElementById('eye-icon');
		const passwordInput = document.getElementById('password');

		eyeIcon
				.addEventListener(
						'click',
						function() {
							const type = passwordInput.getAttribute('type') === 'password' ? 'text'
									: 'password';
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
	</script>
</body>