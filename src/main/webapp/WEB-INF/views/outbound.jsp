 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<body>
    <div id="wraper">
      <div class="outbound">
        <h3 style="font-size: 25px;">Outbound Dialer Campaigns</h3>
        <div class="outbound-list">
          <div class="outbound-item2">
            <p style="text-align: center; font-size: 50px; margin: 10px;">50.7%</p>
            <p style="text-align: center; font-size: 18px;">Outbound Dialer Pickup Rate</p>
          </div>
          <div class="outbound-item2">
            <p style="text-align: center; font-size: 50px; margin: 10px;">12.0%</p>
            <p style="text-align: center; font-size: 18px;">Outbound Dialer Abandon Rate</p>
          </div>
          <div class="outbound-item2">
            <p style="text-align: center; font-size: 50px; margin: 10px;">4</p>
            <p style="text-align: center; font-size: 18px;">Avg. Attempts Until Record is Connected</p>
          </div>
        </div>
        <div class="">
            <canvas id="myChart" width="1000" height="400"></canvas>
        </div>
        <script>
            const ctx = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['25/3','26/3','27/3','28/3','29/3','30/3','31/3','1/4','2/4','3/4','4/4','5/4'],
                    datasets: [{
                        label: 'Average Pickup Rate per Day',
                        data: [0, 80, 40, 75, 85, 30, 60, 25, 70, 35, 50, 91],
                        backgroundColor: [
                            'rgba(54, 162, 235, 0.2)',
                        ],
                        borderColor: [
                            'rgba(1, 255, 212, 1)',
                        ],
                        borderWidth: 1
                    }]
                },
            });
        </script>
        <h3 style="text-align: center;">Day Of Month</h3>
      </div>
    </div>
  </body>