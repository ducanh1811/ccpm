
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<body>
	<div id="wraper">
		<div class="container">
			<div class="abc">
				<h3>Inbound Call Metrics</h3>
			</div>
			<div class="Matrics">
				<div>
					<h3 class="h3Matrics">${totalCall }</h3>
					<p>Total Calls</p>
				</div>
				<div>
					<h3 class="h3Matrics">${answeredCall }</h3>
					<p>Answered Calls</p>
				</div>
				<div>
					<h3 class="h3Matrics">${missedCall }</h3>
					<p>Missed Calls</p>
				</div>
				<div>
					<h3 class="h3Matrics">${abandonedCall }</h3>
					<p>Abandoned Calls</p>
				</div>
				<div>
					<h3 class="h3Matrics">${shortAbandonedCall }</h3>
					<p>Short Abandoned Calls</p>
				</div>
				<div>
					<h3 class="h3Matrics">985</h3>
					<p>Voicemalls</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<canvas id="myChart"></canvas>
	</div>


	<script>
		var labels = ${labelsJson};
	  	var values = ${values};	
	
		let myChart = document.getElementById('myChart').getContext('2d');
		// Global Options
		Chart.defaults.global.defaultFontFamily = 'Lato';
		Chart.defaults.global.defaultFontSize = 18;
		Chart.defaults.global.defaultFontColor = '#777';

		let massPopChart = new Chart(myChart, {
			type : 'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
			data : {
				/* labels:['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4'], */
				labels : labels,
				datasets : [ {
					label : 'Call',
					/* data:[
					  617594,
					  181045,
					  153060,
					  106519,
					  105162,
					  95072
					], */
					data : values,
					//backgroundColor:'green',
					backgroundColor : [ 'rgba(255, 99, 132, 0.6)',
							'rgba(54, 162, 235, 0.6)',
							'rgba(255, 206, 70, 0.6)',
							'rgba(75, 192, 192, 0.6)',
							'rgba(100, 99, 50, 0.6)',
							'rgba(20, 40, 150, 0.6)',
							'rgba(255, 1, 150, 0.6)',
							'rgba(1, 192, 100, 0.6)',
							'rgba(2, 50, 230, 0.6)',
							'rgba(54, 231, 132, 0.6)',
							'rgba(123, 54, 6, 0.6)',
							'rgba(34, 156, 79, 0.6)'],
					borderWidth : 1,
					borderColor : '#777',
					hoverBorderWidth : 3,
					hoverBorderColor : '#000'
				} ]
			},
			options : {
				title : {
					display : true,
					text : 'Number of inbound calls',
					fontSize : 25
				},
				legend : {
					display : true,
					position : 'right',
					labels : {
						fontColor : '#000'
					}
				},
				layout : {
					padding : {
						left : 50,
						right : 0,
						bottom : 0,
						top : 0
					}
				},
				tooltips : {
					enabled : true
				}
			}
		});
	</script>

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
