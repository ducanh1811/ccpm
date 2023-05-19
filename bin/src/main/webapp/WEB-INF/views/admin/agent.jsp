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
								Manage <b>Agent</b>
							</h2>
						</div>
						<div class="col-xs-6">
							<a href="#addEmployeeModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
									New Agent</span></a>
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
							<th>Role</th>
							<th>Is Active</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${agentPage.content}" var="agent">
							<tr>
								<td>${agent.id }</td>
								<td>${agent.name }</td>
								<td>${agent.email }</td>
								<td>${agent.address }</td>
								<td>${agent.phone }</td>
								<td><c:if test="${agent.role == 1}">Manager</c:if>
								<c:if test="${agent.role == 0}">Agent</c:if></td>
								<td>${agent.isActivate }</td>
								<td><a data-id="${agent.id }" data-name="${agent.name }"
									data-email="${agent.email }" data-address="${agent.address }"
									data-phone="${agent.phone }"
									data-isactivate="${agent.isActivate }"
									href="#editEmployeeModal" class="edit" data-toggle="modal"
									onclick="setAgent('${agent.id}', '${agent.name}', '${agent.email}', '${agent.address}', '${agent.phone}', '${agent.role }', '${agent.isActivate}')">
										<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
								</a> <a data-id="${agent.id }" href="#deleteEmployeeModal"
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
						Showing <b>5</b> out of <b>${size}</b> entries
					</div>
					<c:if test="${agentPage.totalPages > 0}">
						<ul class="pagination">
							<li
								class="${ 1 == agentPage.size + 1  ? 'page-item active' : 'page-item' }">
								<a class="page-link"
								href="<c:url value='/admin/agent?page=${0}'/>" tabindex="-1"
								aria-disabled="true">First</a>
							</li>


							<c:forEach items="${pageNumbers}" var="pageNumber">
								<c:if test="${agentPage.totalPages >1}">
									<li
										class="${pageNumber == agentPage.number +1 ? 'page-item active' : 'page-item'}">
										<a class="page-link"
										href="<c:url value='/admin/agent?page=${pageNumber-1}'/>">${pageNumber}</a>
									</li>
								</c:if>
							</c:forEach>



							<li
								class="${agentPage.totalPages == agentPage.number + 1 ? 'page-item active' : 'page-item'}">
								<a class="page-link"
								href="<c:url value='/admin/agent?page=${agentPage.totalPages - 1}'/>">Last</a>
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
				<form action=<c:url value = "/admin/agent/saveOrUpdate"/>
					method="POST">
					<div class="modal-header">
						<h4 class="modal-title">Add Agent</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								name="name" value="${newAgent.name }" required>
						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" class="form-control"
								name="email" value="${newAgent.email }" required>
						</div>
						<div class="form-group">
							<label>Address</label> <input type="text" class="form-control"
								name="address" value="${newAgent.address }" required>
						</div>
						<div class="form-group">
							<label>Phone</label> <input type="text" class="form-control"
								name="phone" value="${newAgent.phone }" required>
						</div>
						<div class="form-group">
							<label for="role">Choose level:</label> <select
								name="role" id="role">
								<option ${newAgent.role == 1 ? 'selected':'' }
									value="1">Manager</option>
								<option ${newAgent.role == 0 ? 'selected':'' }
									value="0">Agent</option>
							</select>
						</div>
						<div class="form-group">
							<label for="isActivate">Choose one:</label> <select
								name="isActivate" id="isActivate">
								<option ${newAgent.isActivate == true ? 'selected':'' }
									value="true">Activate</option>
								<option ${newAgent.isActivate == false ? 'selected':'' }
									value="false">No activate</option>
							</select>
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
				<form form action=<c:url value = "/admin/agent/saveOrUpdate"/>
					method="POST">
					<div class="modal-header">
						<h4 class="modal-title">Edit Agent</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="id" name="id" value="${newAgent.id }">
						<div class="form-group">
							<label>Name</label> <input type="text" class="form-control"
								id="name" name="name" value="${newAgent.name }" required>
						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" class="form-control"
								id="email" name="email" value="${newAgent.email }" required>
						</div>
						<div class="form-group">
							<label>Address</label> <input type="text" class="form-control"
								id="address" name="address" value="${newAgent.address }"
								required>
						</div>
						<div class="form-group">
							<label>Phone</label> <input type="text" class="form-control"
								id="phone" name="phone" value="${newAgent.phone }" required>
						</div>
						<div class="form-group">
							<label for="role">Choose level:</label> <select
								name="role" id="role">
								<option value="1">Manager</option>
								<option value="0">Agent</option>
							</select>
						</div>
						<div class="form-group">
							<label for="isActivate">Choose one:</label> <select
								name="isActivate" id="isActivate">
								<option value="true">Activate</option>
								<option value="false">No activate</option>
							</select>
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
			$('#yesOption').attr('href', '/admin/agent/delete/' + id);
			$('#deleteEmployeeModal').modal('show');
		}
		function setAgent(id, name, email, address, phone, role, isactivate) {
			$('#id').val(id);
			$('#name').val(name);
			$('#email').val(email);
			$('#address').val(address);
			$('#phone').val(phone);
			var selectedRoleOption = role.toString();
			$('#role option').removeAttr('selected');
			$('#role option[value="' + selectedRoleOption + '"]').attr(
					'selected', 'selected');
			var selectedOption = isactivate.toString();
			$('#isActivate option').removeAttr('selected');
			$('#isActivate option[value="' + selectedOption + '"]').attr(
					'selected', 'selected');
		}
	</script>
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Delete Agent</h4>
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
