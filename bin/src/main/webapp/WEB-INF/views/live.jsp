
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<body>
	<br>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<div class="Live">
		<div class="service-list">
			<div class="service-item">
				<div class="service-content">
					<h3 style="text-align: center">Service Levels</h3>
					<p style="text-align: center; font-size: 20px">Today</p>
				</div>
				<div class="ChartLive">
					<canvas id="myChart" width="230" height="230"></canvas>
				</div>
				<script>
              //setup block
              const data = {
                // labels: ["Red", "Green", "Blue"],
                datasets: [
                  {
                    label: "# of Votes",
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
                    cutout: "60%",
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
              const myChart = new Chart(
                document.getElementById("myChart"),
                config
              );
            </script>
			</div>
			<div class="service-item">
				<div class="service-content">
					<h3 style="text-align: center">Avg. Abandon Time</h3>
					<p style="text-align: center; font-size: 20px">Today</p>
					<p style="text-align: center; font-size: 50px">${avgAbandonTime }</p>
				</div>
			</div>
			<div class="service-item">
				<div class="service-content">
					<h3 style="text-align: center">Avg. Wait Time</h3>
					<p style="text-align: center; font-size: 20px">Today</p>
					<p style="text-align: center; font-size: 50px">${avgWaitTime }</p>
				</div>
			</div>
			<div class="service-item">
				<div class="service-content">
					<h3 style="text-align: center">Longest Wait Time</h3>
					<p style="text-align: center; font-size: 20px">Today</p>
					<p style="text-align: center; font-size: 50px">${longestWaitTime }</p>
				</div>
			</div>
		</div>
		<br />
		<div class="container">
			<div class="service-agent">
				<div class="item">
					<div class="service-content">
						<h3 style="text-align: center; font-size: 30px">Live Agent</h3>
					</div>
					<div class="content">
						<p style="text-align: center; font-size: 30px">Today</p>
					</div>
					<div class="ChartLive2">
						<canvas id="myChart2" width="200" height="200"></canvas>
					</div>
					<script>
                //setup block
                const data2 = {
                  // labels: ["Red", "Orange", "Green"],
                  datasets: [
                    {
                      label: "# of Votes",
                      data: [34, 33, 33],
                      backgroundColor: [
                        "rgba(231, 76, 60, 1)",
                        "rgba(255, 164, 46, 1)",
                        "rgba(46, 204, 113, 1)",
                      ],
                      borderColor: [
                        "rgba(255, 255, 255 ,1)",
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
                //Counter plugin block
                const counter2 = {
                  id: "counter2",
                  beforeDraw(chart, args, options) {
                    const {
                      ctx,
                      chartArea: { top, right, bottom, left, width, height },
                    } = chart;
                    ctx.save();
                    ctx.font = "60px sans-serif";
                    ctx.textAlign = "center";
                    ctx.fillText("42", width / 2, (top + height + 100) / 2);
                  },
                };
                //Config block
                const config2 = {
                  type: "doughnut",
                  data: data2,
                  options: {
                    rotation: 1 * Math.PI,
                    circumference: 1 * Math.PI,
                    cutoutPercentage: 90,
                  },
                  plugins: [counter2],
                };
                //Render init block
                var myChart2 = new Chart(
                  document.getElementById("myChart2"),
                  config2
                );
              </script>
				</div>
				<div class="item">
					<div class="service-content">
						<h3 style="text-align: center; font-size: 30px">Live Calls</h3>
					</div>
					<div class="content">
						<p style="text-align: center; font-size: 30px">Today</p>
					</div>
					<div class="ChartLive2">
						<canvas id="myChart3" width="200" height="200"></canvas>
					</div>
					<script>
                //setup block
                const data3 = {
                  // labels: ["Red", "Orange", "Green"],
                  datasets: [
                    {
                      label: "# of Votes",
                      data: [34, 23, 20, 23],
                      backgroundColor: [
                        "rgba(231, 76, 60, 1)",
                        "rgba(255, 164, 46, 1)",
                        "rgba(46, 204, 113, 1)",
                        "rgba(241, 196, 15, 1)",
                      ],
                      borderColor: [
                        "rgba(255, 255, 255 ,1)",
                        "rgba(255, 255, 255 ,1)",
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
                //Counter plugin block
                const counter3 = {
                  id: "counter3",
                  beforeDraw(chart, args, options) {
                    const {
                      ctx,
                      chartArea: { top, right, bottom, left, width, height },
                    } = chart;
                    ctx.save();
                    ctx.font = "60px sans-serif";
                    ctx.textAlign = "center";
                    ctx.fillText("15", width / 2, (top + height + 100) / 2);
                  },
                };
                //Config block
                const config3 = {
                  type: "doughnut",
                  data: data3,
                  options: {
                    rotation: 1 * Math.PI,
                    circumference: 1 * Math.PI,
                    cutoutPercentage: 90,
                  },
                  plugins: [counter3],
                };
                //Render init block
                var myChart3 = new Chart(
                  document.getElementById("myChart3"),
                  config3
                );
              </script>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
    $(document).ready(function () {
      $("#main-menu li").removeClass("active");
      $("#main-menu li").click(function () {
        $("#main-menu li").removeClass("active");
        $(this).addClass("active");
        return false;
      });
    });
  </script>
