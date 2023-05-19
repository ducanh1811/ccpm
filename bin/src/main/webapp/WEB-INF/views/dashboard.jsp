
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<body>
	<div id="wraper">
		<div class="dashboard">
			<h3 style="font-size: 30px">My Dashboard</h3>
			<div class="service-list">
				<div class="service-item">
					<div class="service-content">
						<h3 style="padding: 0px 0px 0px 10px">Contact on Queue</h3>
						<p
							style="padding: 0px 0px 0px 10px; margin-top: -20px; color: #146df2;">
							Live</p>
						<p style="text-align: center; font-size: 50px; margin: 0px">${nowCallList.size() }</p>
					</div>
				</div>
				<div class="service-item">
					<div class="service-content">
						<h3 style="padding: 0px 0px 0px 10px">Service Level</h3>
						<p
							style="padding: 0px 0px 0px 10px; margin-top: -20px; color: #146df2;">
							To day</p>
						<p style="text-align: center; font-size: 50px; margin: 0px">
							${serviceLevel }%</p>
					</div>
				</div>
				<div class="service-item">
					<div class="service-content">
						<h3 style="padding: 0px 0px 0px 10px">Abandon Rate</h3>
						<p
							style="padding: 0px 0px 0px 10px; margin-top: -20px; color: #146df2;">
							To day</p>

						<c:if test="${abandonRate == 0 }">
							<p style="text-align: center; font-size: 50px; margin: 0px">
								100%</p>
						</c:if>
						<c:if test="${abandonRate != 0 }">
							<p style="text-align: center; font-size: 50px; margin: 0px">
								${abandonRate }%</p>
						</c:if>
					</div>
				</div>
				<div class="service-item">
					<div class="service-content">
						<h3 style="padding: 0px 0px 0px 10px">Average Handle Time</h3>
						<p
							style="padding: 0px 0px 0px 10px; margin-top: -20px; color: #146df2;">
							To day</p>
						<p style="text-align: center; font-size: 50px; margin: 0px">
							${avgHandleTime }</p>
					</div>
				</div>
			</div>
			<br />
			<div class="container">
				<div class="service-agent">
					<div class="item1">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 10px; font-size: 20px">
								Contact List</h3>
							<p
								style="padding: 0px 0px 0px 10px; margin-top: -20px; color: #146df2;">
								Live</p>
						</div>
						<div class="tabel-contact-list">
							<table>
								<thead>
									<tr id="title-table">
										<th>Direction</th>
										<th>Status</th>
										<th>Agent</th>
										<th>Contact Numbers</th>
										<th>Duration</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${nowCallList }" var="call">
										<tr>
											<c:if test="${call.callOffer == true }">
												<td>Receive</td>
											</c:if>
											<c:if test="${call.callResponse == true }">
												<td>Response</td>
											</c:if>
											<c:if test="${call.callResponse == false }">
												<td>No Response</td>
											</c:if>
											<td>In progress</td>
											<td>${call.agent.name }</td>
											<td>${call.phone }</td>
											<td>${call.callDetail.timeOnQueue }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="item2">
						<div class="service-content">
							<h3 style="padding: 0px 0px 0px 10px; font-size: 20px">
								Inbound Contact</h3>
							<p
								style="padding: 0px 0px 0px 10px; margin-top: -20px; color: #146df2;">
								Live</p>
						</div>

						<div class="ChartDashboard">
							<canvas id="myChart" width="300" height="300"></canvas>
						</div>
						<script>
                //setup block
                const data = {
                  labels: ["Missed", "In progress", "Answered"],
                  datasets: [
                    {
                      label: "Call",
                      data: [${callAbandon}, ${nowCallList.size() - callAbandon - callResponse}, ${callResponse}],
                      backgroundColor: [
                        "rgba(231, 76, 60, 1)",
                        "rgba(241, 196, 15, 1)",
                        "rgba(46, 204, 113, 1)"
                      ],
                      borderColor: [
                        "rgba(255, 255, 255 ,1)",
                        "rgba(255, 255, 255 ,1)",
                        "rgba(255, 255, 255 ,1)"
                      ],
                      borderWidth: 1,
                      cutout: "80%",
                    },
                  ],
                };
                //Counter plugin block
                const counter = {
                  id: "counter",
                  beforeDraw(chart, args, options) {
                    const {
                      ctx,
                      chartArea: { top, right, bottom, left, width, height },
                    } = chart;
                    ctx.save();
                    ctx.font = "90px sans-serif";
                    ctx.textAlign = "center";
                    ctx.fillText(${nowCallList.size()}, width / 2, (top + height) / 2);
                  },
                };
                //Config block
                const config = {
                  type: "doughnut",
                  data,
                  options: {},
                  plugins: [counter],
                };
                //Render init block
                var myChart = new Chart(
                  document.getElementById("myChart"),
                  config
                );
              </script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>