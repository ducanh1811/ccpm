<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div id="wraper">
		<div class="Search">
			<form>
				<input id="input" class="input_find" type="text"
					onkeyup="tabelSearch()" placeholder="Find phone number..." />
			</form>
		</div>
		<br>
		<!-- create table callhistory -->
		<div class="tabel-call-history">
			<table>
				<thead>
					<tr id="title-table">
						<th>ID</th>
						<th>Date Time</th>
						<th>AgenId</th>
						<th>Phone</th>
						<th>Call Offer</th>
						<th>Call Respond</th>
						<th>Business Hours</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${callList }" var="call">
						<tr>
							<td><a href="/history/${call.id }">${call.id }</a></td>
							<td>${call.createAt }</td>
							<td>${call.agent.name }</td>
							<td>${call.phone }</td>
							<td>${call.callOffer }</td>
							<td>${call.callResponse }</td>
							<td>${call.businessHours }</td>
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
