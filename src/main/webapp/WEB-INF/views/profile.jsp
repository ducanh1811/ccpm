<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<body>
	<div class="container rounded bg-white mt-5 mb-5">

		<form action=<c:url value = "/profile/update"/> method="POST">
			<input type="hidden" name="id" value="${agent.id }"> <input
				type="hidden" name="password" value="${agent.password }">
				<input
				type="hidden" name="role" value="${agent.role }">
			<div class="col-md-5 border-right">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">Profile Settings</h4>
					</div>
					<div class="row mt-2">
						<div class="col-md-12">
							<label class="labels">Name</label><input type="text" id="name"
								class="form-control" placeholder="first name" name="name"
								value="${agent.name }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-md-12">
							<label class="labels">Email</label><input type="text" id="email"
								class="form-control" placeholder="first name" name="email"
								value="${agent.email }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-md-12">
							<label class="labels">BirthDay</label><input type="date"
								class="form-control" placeholder="first name" name="dob"
								value="${agent.dob }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-md-12">
							<label class="labels">Address</label><input type="text" id="address"
								class="form-control" placeholder="first name" name="address"
								value="${agent.address }">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-md-12">
							<label class="labels">Phone</label><input type="text" id="phone"
								class="form-control" placeholder="first name" name="phone"
								value="${agent.phone }">
						</div>
					</div>


					<div class="mt-5 text-center">
						<input id="submit" type="submit" class="btn btn-success" value="Save Profile">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>