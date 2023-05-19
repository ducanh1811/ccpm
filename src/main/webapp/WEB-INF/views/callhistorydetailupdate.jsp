<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div class="back">
		<a href="/history/1"><img src="images/back.png" alt="">Back</a>
	</div>
	<div id="wraper">
		<div class="tabel-call-history">
			<table>
				<tr>
					<td>ID</td>
				</tr>
				<tr>
					<td>Call ID</td>
				</tr>
				<tr>
					<td>Type Call</td>
				</tr>
				<tr>
					<td>Time On Phone</td>
				</tr>
				<tr>
					<td>Time On Queue</td>
				</tr>
				<tr>
					<td>Time abandoned</td>
				</tr>
				<tr>
					<td>Call Content</td>
				</tr>
				<tr>
					<td>Feed Back</td>
				</tr>
			</table>
			<div class="form-update">
				<form action="/upload" method="post" enctype="multipart/form-data">
					<input type="text" name="id" placeholder="ID" disabled> <input
						type="text" name="call_id" placeholder="Call ID"> <input
						type="text" name="type_call" placeholder="Type Call"> <input
						type="text" name="time_on_phone" placeholder="Time On Phone">
					<input type="text" name="time_on_queue" placeholder="Time On Queue">
					<input type="text" name="time_abandoned"
						placeholder="Time abandoned"> <input type="text"
						name="call_content" placeholder="Call Content" disabled> <input
						type="text" name="feed_back" placeholder="Feed Back">
					<div class="btn">
						<button type="submit" id="btn-update">Cập nhật</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>