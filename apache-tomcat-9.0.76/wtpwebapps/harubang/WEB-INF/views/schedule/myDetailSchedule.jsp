<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루방</title>
   <style>
      .title{
         text-align: center;
      }
      .wrap{
         display: flex;
         justify-content: center;
         align-items: center;
         text-align: center;
         flex-direction: column;      
      }
      
        table {
            border-collapse: collapse;
            width: 50%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/subtop.jsp"/>
   
   <h2 class="title"></h2>
   
   <div class="wrap">
      <h2 class="date">동적 하루 일정표</h2>
       <table id="scheduleTable">
           <tr>
               <th>장소명</th>
               <th>시작시간</th>
               <th>종료시간</th>
           </tr>
       </table>
   </div>
   
   
   <script src="${path}/resources/js/jquery.min.js"></script>
   <script>
   $(document).ready(function() {
       const dataFromPreviousPage = JSON.parse(localStorage.getItem("dataFromPreviousPage"));
      
        var name = dataFromPreviousPage['scheduleName'];
        $(".title").text(name);
       // 데이터를 사용하여 원하는 작업 수행
       var detail = Object.keys(JSON.parse(dataFromPreviousPage['detailSchedule']));
        
       var innerHtml = "";
       for(var i = 0; i < detail.length; i++){
          innerHtml += '<h2>'+detail[i]+'</h2>';
          innerHtml += ' <table id="scheduleTable">';
          innerHtml += '<tr>';
          innerHtml += '<th>장소명</th>';
          innerHtml += '<th>시작시간</th>';
          innerHtml += '<th>종료시간</th>';
          innerHtml += '</tr>';
          innerHtml += '</table>';
          $(".wrap").html(innerHtml);
          var newdetail = JSON.parse(dataFromPreviousPage['detailSchedule']);
          var scheduleData = newdetail[detail[i]];
          console.log(scheduleData);
          if(scheduleData.length != 0){
             for (var j = 0; j < scheduleData.length; j++) {
                  addScheduleToTable(scheduleData[j]);

             }
          }
          
       }
         
         
       
       function addScheduleToTable(schedule) {
              var table = document.getElementById('scheduleTable');
            var row = table.insertRow(-1);
            var timeCell = row.insertCell(0);
            var eventCell = row.insertCell(1);
            var locationCell = row.insertCell(2);
            timeCell.innerHTML = schedule['text'];
            eventCell.innerHTML = schedule['startTime'];
            locationCell.innerHTML = schedule['endTime']; 
        }
 
        // 일정 데이터 배열을 순회하며 테이블에 추가
        /* for (var i = 0; i < scheduleData.length; i++) {
            addScheduleToTable(scheduleData[i]);
        } */
       // ... (추가적인 작업)

       // 작업이 끝난 후 웹 스토리지에서 데이터 제거 (선택적)
       localStorage.removeItem("dataFromPreviousPage");
   });
   </script>
</body>
</html>