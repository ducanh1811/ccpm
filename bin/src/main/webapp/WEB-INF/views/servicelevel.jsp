<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<body>
	<div id="wraper">

		<br>
		<div id="wraper">
			<div class="Live">
				<div class="service-list">
					<div class="service-item">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 20px;">Avg. Abandon Time</h3>
							<p style="text-align: center; font-size: 50px; margin: -5px;">${avgAbandonTime }</p>
						</div>
					</div>
					<div class="service-item">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 20px;">Longest Abandon Time</h3>
							<p style="text-align: center; font-size: 50px; margin: -5px;">${longestAbandonTime }</p>
						</div>
					</div>
					<div class="service-item">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 20px;">Avg. Wait Time</h3>
							<p style="text-align: center; font-size: 50px; margin: -5px;">${avgWaitTime }</p>
						</div>
					</div>
					<div class="service-item">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 20px;">Longest Wait Time</h3>
							<p style="text-align: center; font-size: 50px; margin: -5px;">${longestWaitTime }</p>
						</div>
					</div>
				</div>
				<br>
				<div class="container">
					<div class="service-agent">
						<div class="item1">
							<div class="service-content">
								<h3 style="padding: 0px 0px 0px 20px; font-size: 20px">Service
									Level</h3>
							</div>
							<div class="ChartLive">
								<canvas id="myChart1" width="250" height="250"></canvas>
							</div>

							<script>
                //setup block
                const data = {
                  // labels: ["Red", "Green", "Blue"],
                  datasets: [
                    {
                      label: "Sự hài lòng",
                      data: [${serviceLevel}, 100 - ${serviceLevel}],
                      backgroundColor: [
                        // "red", "green", "blue"
                        "rgba(46, 204, 113, 1)",
                        "rgba(255, 255, 255 ,1)",
                      ],
                      borderColor: [
                        "rgba(255, 255, 255 ,1)",
                        "rgba(255, 255, 255 ,1)",
                      ],
                      borderWidth: 1,
                      cutout: "70%",
                      circumference: 180,
                      rotation: -90,
                    },
                  ],
                };
  
                //plugin block
                const gaugeChartText = {
                  id: "gaugeChartText",
                  beforeDraw(chart, args, options) {
                    const {
                      ctx,
                      chartArea: { top, right, bottom, left, width, height },
                    } = chart;
                    ctx.save();
  
                    ctx.font = "40px sans-serif";
                    ctx.textBaseline = "middle";
                    ctx.fillStyle = "black";
                    ctx.textAlign = "center";
                    ctx.fillText(
                    	`${serviceLevel}%`,
                      left + width / 2,
                      (top + height + 70) / 2
                    );
                  },
                };
                //config block
                const config = {
                  type: "doughnut",
                  data,
                  options: {},
                  plugins: [gaugeChartText],
                };
                //render init block
                const myChart1 = new Chart(
                  document.getElementById("myChart1"),
                  config
                );
              </script>
						</div>
						<div class="item2">
							<div class="service-content">
								<h3 style="padding: 0px 0px 0px 20px; font-size: 20px">Inbound
									Service Level</h3>
							</div>

							<div class="ChartLive2">
								<canvas id="myChart" width="800" height="220"></canvas>
							</div>
							<script>
							
							var labels = ${labels};
						  	var values = ${values};	
							
                const ctx = document.getElementById('myChart').getContext('2d');
                const myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        /* labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'], */
                        labels : labels,
                        datasets: [{
                            label: 'Service Level',
                            /* data: [12, 19, 3,12, 19, 3,12, 19, 3,12, 19, 3], */
                            data : values,
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
                            borderColor: '#777',
                            borderWidth: 2,
                            hoverBorderColor : '#000'
                        }]
                    },
                });
                </script>
						</div>
					</div>
				</div>
				<br>
				<div class="service-list2">
					<div class="service-item2">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 20px;">Totel duration</h3>
							<p style="text-align: center; font-size: 50px; margin: -5px;">${totalDuration}</p>
						</div>
					</div>
					<div class="service-item2">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 20px;">Avg. duration</h3>
							<p style="text-align: center; font-size: 50px; margin: -5px;">${avgDuration }</p>
						</div>
					</div>
					<div class="service-item2">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 20px;">Longest duration</h3>
							<p style="text-align: center; font-size: 50px; margin: -5px;">${longestDuration }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
