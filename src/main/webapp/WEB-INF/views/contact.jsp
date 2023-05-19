
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div id="wraper">
		<div class="Search">
			<div class="tag">
				<h3>
					Tags <input id="input2" class="input_find" onkeyup="tabelSearch2()"
						type="text" placeholder="Find Phone" />
				</h3>
			</div>
			<div class="name">
				<h3>
					Name <input id="input" class="input_find" onkeyup="tabelSearch()"
						type="text" placeholder="Find name..." />
				</h3>
			</div>
		</div>

		<!-- create table callhistory -->
		<div class="tabel-call-history">
			<table>
				<thead>
					<tr id="title-table">
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Address</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${customerList }" var="customer">
						<tr>
							<td>${customer.name}</td>
							<td>${customer.email}</td>
							<td>${customer.phone}</td>
							<td>${customer.address}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
	$(document).ready(function() {
		$("#main-menu li").removeClass("active");
		$("#main-menu li").click(function() {
			$("#main-menu li").removeClass("active");
			$(this).addClass("active");
			return false;
		});
	});
</script>

