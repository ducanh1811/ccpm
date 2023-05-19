<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div class="back">
		<a href="/contact/1"><img src="images/back.png" alt="">Back</a>
	</div>
	<div id="wraper">
		<div class="tabel-call-history">
			<table>
				<tr>
					<td>ID</td>
				</tr>
				<tr>
					<td>Full Name</td>
				</tr>
				<tr>
					<td>Email Address</td>
				</tr>
				<tr>
					<td>Phone number</td>
				</tr>
				<tr>
					<td>Company</td>
				</tr>
			</table>
			<div class="form-update">
				<form action="" method="post">
					<input type="text" name="id" placeholder="ID" disabled> <input
						type="text" name="full_name" placeholder="Full Name"> <input
						type="text" name="email_address" placeholder="Email Address">
					<input type="text" name="phone_number" placeholder="Phone number">
					<input type="text" name="company" placeholder="Company">
					<div class="btn">
						<button type="submit" id="btn-update">Cập nhật</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>