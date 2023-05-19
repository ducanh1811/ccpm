<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div id="wraper">
		<div class="tabel-call-history">
			<table>
				<tr>
					<td>ID</td>
					<td>1</td>
				</tr>
				<tr>
					<td>Full Name</td>
					<td>Nguyễn Đình Thiện</td>
				</tr>
				<tr>
					<td>Email Address</td>
					<td>ndhthien@gmail.com</td>
				</tr>
				<tr>
					<td>Phone number</td>
					<td>0336549532</td>
				</tr>
				<tr>
					<td>Company</td>
					<td>HCMUTE</td>
				</tr>
			</table>
		</div>
	</div>
	<!--nút sửa-->
	<div class="btn">
		<button onclick="window.location.href='/contact/1/update'" id="btn-edit">Chỉnh sửa</button>
	</div>
	<div class="btn">
		<button id="btn-delete">Xóa</button>
	</div>
</body>