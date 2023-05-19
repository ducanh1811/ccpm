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
								Manage <b>Call</b>
							</h2>
						</div>
						<div class="col-xs-6">
							<a href="#addEmployeeModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
									New Call</span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Id</th>
							<th>Phone</th>
							<th>Agent</th>
							<th>Type of Call</th>
							<th>Service Level</th>
							<th>Call content</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${callPage.content}" var="call">
							<tr>
								<td>${call.id }</td>
								<td>${call.phone }</td>
								<td>${call.agent.name }</td>
								<td>${call.callDetail.typeCall }</td>
								<td>${call.callDetail.serviceLevel }</td>
								<td><audio controls>
										<source src="${call.callDetail.callContent }"
											type="audio/mpeg">
										Your browser does not support the audio element.
									</audio></td>
								<td><a href="#editEmployeeModal" class="edit"
									data-toggle="modal" onclick=""> <i class="material-icons"
										data-toggle="tooltip" title="Edit">&#xE254;</i>
								</a> <a href="#deleteEmployeeModal" class="delete"
									data-toggle="modal"
									onclick="showDeleteConfirmation(${call.id})"><i
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
					<c:if test="${callPage.totalPages > 0}">
						<ul class="pagination">
							<li
								class="${ 1 == callPage.size + 1  ? 'page-item active' : 'page-item' }">
								<a class="page-link"
								href="<c:url value='/admin/call?page=${0}'/>" tabindex="-1"
								aria-disabled="true">First</a>
							</li>


							<c:forEach items="${pageNumbers}" var="pageNumber">
								<c:if test="${callPage.totalPages >1}">
									<li
										class="${pageNumber == callPage.number +1 ? 'page-item active' : 'page-item'}">
										<a class="page-link"
										href="<c:url value='/admin/call?page=${pageNumber-1}'/>">${pageNumber}</a>
									</li>
								</c:if>
							</c:forEach>



							<li
								class="${callPage.totalPages == callPage.number + 1 ? 'page-item active' : 'page-item'}">
								<a class="page-link"
								href="<c:url value='/admin/call?page=${callPage.totalPages-1}'/>">Last</a>
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
				<form action=<c:url value = "/admin/call/saveOrUpdate"/>
					method="POST" enctype="multipart/form-data">
					<div class="modal-header">
						<h4 class="modal-title">Add Call</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="businessHours">Choose one:</label> <select
								name="businessHours" id="businessHours">
								<option ${newCall.businessHours == true ? 'selected':'' }
									value="true">True</option>
								<option ${newCall.businessHours == false ? 'selected':'' }
									value="false">False</option>
							</select>
						</div>
						<div class="form-group">
							<label for="callOffer">Call offer:</label> <select
								name="callOffer" id="callOffer">
								<option ${newCall.callOffer == true ? 'selected':'' }
									value="true">True</option>
								<option ${newCall.callOffer == false ? 'selected':'' }
									value="false">False</option>
							</select>
						</div>
						<div class="form-group">
							<label for="callResponse">Call Response:</label> <select
								name="callResponse" id="callResponse">
								<option ${newCall.callResponse == true ? 'selected':'' }
									value="true">True</option>
								<option ${newCall.callResponse == false ? 'selected':'' }
									value="false">False</option>
							</select>
						</div>
						<div class="form-group">
							<label>Phone</label> <input type="text" class="form-control"
								name="phone" value="${newCall.phone }" required>
						</div>
						<div class="form-group">
							<label for="callResponse">Agent:</label> <select
								name="callResponse" id="callResponse">
								<option value="">--Chose one--</option>
								<c:forEach items="${agentList}" var="agent">
									<option value="${agent.id }">${agent.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Type of Call</label> <input type="text"
								class="form-control" name="typeCall"
								value="${newCallDetail.typeCall }" required>
						</div>
						<div class="form-group">
							<label>Time on Queue</label> <input type="time" step="1"
								class="form-control" name="timeOnQueue"
								value="${newCallDetail.timeOnQueue }" required>
						</div>
						<div class="form-group">
							<label>Time Abandoned</label> <input type="time" step="1"
								class="form-control" name="timeAbandoned"
								value="${newCallDetail.timeAbandoned }" required>
						</div>
						<div class="form-group">
							<label>Wait Time</label> <input type="time" step="1"
								class="form-control" name="waitTime"
								value="${newCallDetail.waitTime }" required>
						</div>

						<div class="form-group">
							<label>Service Level</label> <input type="number" min="0"
								step="0.01" max="1" class="form-control" name="serviceLevel"
								value="${newCallDetail.serviceLevel }" required>
						</div>

						<div class="form-group">
							<label>Call Content</label> <input type="file" class="form-control" name="callContent"
								value="${newCallDetail.callContent }" required>
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
						<h4 class="modal-title">Edit Call</h4>
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
			$('#yesOption').attr('href', '/admin/call/delete/' + id);
			$('#deleteEmployeeModal').modal('show');
		}
		function setAgent(id, name, email, address, phone, isactivate) {
			$('#id').val(id);
			$('#name').val(name);
			$('#email').val(email);
			$('#address').val(address);
			$('#phone').val(phone);
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
						<h4 class="modal-title">Delete Call</h4>
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
