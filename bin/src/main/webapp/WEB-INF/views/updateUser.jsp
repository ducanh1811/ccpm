<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div class="back">
		<a href="#"><img src="images/back.png" alt="">Back</a>
	</div>

	<div class="header">
		<h1>Cập nhật thông tin cá nhân</h1>
	</div>
	<div class="container">
		<div class="form">
			<form action="/update" method="post">
				<input type="hidden" name="id" value="id"> <label
					for="fullname">Full Name</label> <input type="text" name="fullname"
					id="fullname" placeholder="fullname" required> <label
					for="phonenumber">Phone Number</label> <input type="tel"
					name="phonenumber" id="phonenumber" placeholder="phonenumber"
					required> <label for="email">Email Address</label> <input
					type="email" name="email" id="email" placeholder="Email" required>

				<div class="submit">
					<button type="submit">Cập nhật</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		const phoneNumberInput = document.getElementById('phonenumber');

		phoneNumberInput
				.addEventListener(
						'input',
						function(event) {
							const phoneNumberRegex = /^0[0-9]{9}$/;
							const phoneNumber = event.target.value;

							if (!phoneNumberRegex.test(phoneNumber)) {
								phoneNumberInput
										.setCustomValidity('Invalid phone number format. Please enter a valid phone number.');
							} else {
								phoneNumberInput.setCustomValidity('');
							}
						});
	</script>
</body>