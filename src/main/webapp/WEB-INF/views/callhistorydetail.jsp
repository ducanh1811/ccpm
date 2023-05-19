<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div id="wraper">
		<div class="tabel-call-history">
			<table>
				<tr>
					<td>ID</td>
					<td>${callDetail.id }</td>
				</tr>
				<tr>
					<td>Call ID</td>
					<td>${callDetail.call.id }</td>
				</tr>
				<tr>
					<td>Type Call</td>
					<td>${callDetail.typeCall }</td>
				</tr>
				<tr>
					<td>Time On Queue</td>
					<td>${callDetail.timeOnQueue }</td>
				</tr>
				<tr>
					<td>Time abandoned</td>
					<td>${callDetail.timeAbandoned }</td>
				</tr>
				<tr>
					<td>Wait Time</td>
					<td>${callDetail.waitTime }</td>
				</tr>
				<tr>
					<td>Call Content</td>
					<td><audio controls>
							<source src="${callDetail.callContent }" type="audio/mpeg">
							Your browser does not support the audio element.
						</audio></td>
				</tr>
				<tr>
					<td>Feed Back</td>
					<td>${callDetail.feedBackDetail.feedBackContent }</td>

				</tr>
			</table>
		</div>
	</div>
</body>

