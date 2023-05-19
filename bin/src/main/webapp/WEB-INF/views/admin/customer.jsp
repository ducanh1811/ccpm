<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div class="container">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-xs-6">
							<h2>
								Manage <b>Customer</b>
							</h2>
						</div>
						<div class="col-xs-6">
							<a href="#addEmployeeModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
									New Customer</span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Email</th>
							<th>Address</th>
							<th>Phone</th>
							<th>Job Title</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerPage.content}" var="customer">
							<tr>
								<td>${customer.id }</td>
								<td>${customer.name }</td>
								<td>${customer.email }</td>
								<td>${customer.address }</td>
								<td>${customer.phone }</td>
								<td>${customer.jobTitle }</td>
								<td><a href="#editEmployeeModal" class="edit"
									data-toggle="modal"
									onclick="setAgent('${customer.id}', '${customer.name}', '${customer.email}', '${customer.address}', '${customer.phone}', '${customer.jobTitle}')">
										<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
								</a> <a data-id="${customer.id }" href="#deleteEmployeeModal"
									class="delete" data-toggle="modal"
									onclick="showDeleteConfirmation(this.getAttribute('data-id'))"><i
										class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="clearfix">
					<div class="hint-text">
						<c:if test="${size > 5 }">
						Showing <b>5</b> out of <b>${size}</b> entries</c:if>
						<c:if test="${size < 5 }">
						Showing <b>${size}</b> out of <b>${size}</b> entries</c:if>
					</div>
					<c:if test="${customerPage.totalPages > 0}">
						<ul class="pagination">
							<li
								class="${ 1 == customerPage.size + 1  ? 'page-item active' : 'page-item' }">
								<a class="page-link"
								href="<c:url value='/admin/customer?page=${0}'/>" tabindex="-1"
								aria-disabled="true">First</a>
							</li>


							<c:forEach items="${pageNumbers}" var="pageNumber">
								<c:if test="${customerPage.totalPages >1}">
									<li
										class="${pageNumber == customerPage.number +1 ? 'page-item active' : 'page-item'}">
										<a class="page-link"
										href="<c:url value='/admin/customer?page=${pageNumber-1}'/>">${pageNumber}</a>
									</li>
								</c:if>
							</c:forEach>



							<li
								class="${customerPage.totalPages == customerPage.number + 1 ? 'page-item active' : 'page-item'}">
								<a class="page-link"
								href="<c:url value='/admin/customer?page=${customerPage.totalPages-1}'/>">Last</a>
							</li>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action=<c:url value = "/admin/customer/saveOrUpdate"/>
					method="POST">
					<div class="modal-header">
						<h4 class="modal-title">Add Customer</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								name="name" value="${newCustomer.name }" required>
						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" class="form-control"
								name="email" value="${newCustomer.email }" required>
						</div>
						<div class="form-group">
							<label>Address</label> <input type="text" class="form-control"
								name="address" value="${newCustomer.address }" required>
						</div>
						<div class="form-group">
							<label>Phone</label> <input type="text" class="form-control"
								name="phone" value="${newCustomer.phone }" required>
						</div>
						<div class="form-group">
							<label>Job Title</label> <input type="text" class="form-control"
								name="jobTitle" value="${newCustomer.jobTitle }" required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form form action=<c:url value = "/admin/customer/saveOrUpdate"/>
					method="POST">
					<div class="modal-header">
						<h4 class="modal-title">Edit Customer</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="id" name="id" value="${newCustomer.id }">
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								id="name" name="name" value="${newCustomer.name }" required>
						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" class="form-control"
								id="email" name="email" value="${newCustomer.email }" required>
						</div>
						<div class="form-group">
							<label>Address</label> <input type="text" class="form-control"
								id="address" name="address" value="${newCustomer.address }"
								required>
						</div>
						<div class="form-group">
							<label>Phone</label> <input type="text" class="form-control"
								id="phone" name="phone" value="${newCustomer.phone }" required>
						</div>
						<div class="form-group">
							<label>Job Title</label> <input type="text" class="form-control"
								id="jobTitle" name="jobTitle" value="${newCustomer.jobTitle }"
								required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<script type="text/javascript">
		function showDeleteConfirmation(id) {
			$('#yesOption').attr('href', '/admin/customer/delete/' + id);
			$('#deleteEmployeeModal').modal('show');
		}
		function setAgent(id, name, email, address, phone, jobTitle) {
			$('#id').val(id);
			$('#name').val(name);
			$('#email').val(email);
			$('#address').val(address);
			$('#phone').val(phone);
			$('#jobTitle').val(jobTitle);
		}
	</script>
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Delete Customer</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <a id="yesOption" class="btn btn-primary">Yes</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
