function getSelectID(cell) {
	var seat1 = 0;
	var seat2 = 0;
	var seat3 = 0;
	var seat4 = 0;
	var seat5 = 0;
	var count = 1;
	for (var i = 1; i <= 9; i++) {
		for (var j = 1; j <= 15; j++) {
			if (j == 8)
				continue;
			var seatid = i + "_" + j;
			var seat = document.getElementById(seatid);
			if (seat.getAttribute("class") == "seatCharts-seat seatCharts-cell selected") {
				var id = (i - 1) * 15 + j;
				if (count == 1)
					seat1 = id;
				else if (count == 2)
					seat2 = id;
				else if (count == 3)
					seat3 = id;
				else if (count == 4)
					seat4 = id;
				else if (count == 5)
					seat5 = id;
				count++;
			}
		}
	}
	var datetime1 = choosedDate+" "+choosedTime;
	$.ajax({
		url : "./updseat",
		type : "get",
		data : {
			seat1 : seat1,
			seat2 : seat2,
			seat3 : seat3,
			seat4 : seat4,
			seat5 : seat5,
			movie : choosed,
			datetime : datetime1
		},
		success : function(data) {
			$("span").text(data);
		},
		error : function() {
			alert("뭔가 이상해요.ajax처리가 잘 안됫어요.");
		}
	});
}

function setUnSeat(data)
{
	var tempArr = data.split("|");
	for(var i=1;i<=9;i++)
	{
		for(var j=1;j<=15;j++)
		{
			if(j==8)
				continue;
			var id = i+"_"+j;
			sc.get(id).status('available');
		}
	}
	for(var i=0;i<tempArr.length-1;i++)
	{
		var seatid = parseInt(tempArr[i]);	
		if(seatid % 135 != 0)
			seatid = seatid % 135;
		else
			seatid = 135;
		var seatRow = parseInt(seatid/15)+1;
		var seatCol;
		if(seatid %15 != 0)
		 	seatCol = seatid%15;
		else
			seatCol = 15;
		if(seatCol ==8)
			continue;
		var seatRC = seatRow+"_"+seatCol;
		sc.get(seatRC).status('unavailable');
	}	
	document.getElementById("seatPmnane").innerText = movieName[choosed]; 
	document.getElementById("seatPstarttime").innerHTML = choosedDate+" "+choosedTime;
}
function gochooseSeat()
{
	//sc.get(['1_2','1_1','1_3']).status('unavailable');
	$.ajax({
		//url : "http://localhost:8080/dbhw/test1",
		url : "./test1",
		type : "get",
		data : {
			movie_id : choosed,
			mhall_id : 1,
			starttime : choosedTime,
			date : choosedDate
		},
		success : function(data){
			//$("span").text(data);
			//console.log("=========================="+data);
			setUnSeat(data);
		},
		error : function(){
			//alert("뭔가 이상해요.ajax처리가 잘 안됫어요.");
			alert("连接出错！");
		}
	});
}
function fillForDayshowList(date)
{
	firstDate = date.substring(0,10);	
	date = date.substring(10,data.length);
	var temp = data.split("|");
	showList1 = temp[0].split(",");
	showList2 = temp[1].split(",");
	showList3 = temp[2].split(",");
	showList4 = temp[3].split(",");
	for(var i=0;i < showList1.length;i++)  
	{
		document.getElementById("showtime"+(i+1)).innerText = showList1[i];
	}
}
function setDate(firstDate)
{
	var month = parseInt(firstDate.substring(5,7));
	var date = parseInt(firstDate.substring(8,10));
	//fourDate[0] = month+"月"+date+"号";
	fourDate[0] = firstDate.substring(5,10);
	choosedDate = fourDate[0];	
	choosedTime = firstDayMovie[choosed][0];
	for(var i=1;i<4;i++)
	{
		date++;
		if(month ==2 && date ==29)
		{
			month++;
			date =1;
		}
		else if((month==4 ||month==6 ||month==9 ||month==11 )&&date==31)
		{
			month++;
			date =1;
		}
		else if(date == 32)
		{
			month++;
			date =1;
		}
		//fourDate[i] = month+"月"+date+"号";
		if(month <10 && date>=10)
			fourDate[i] = "0"+month+"-"+date;
		else if(month >= 10 && date>=10)
			fourDate[i] = month+"-"+date;
		else if(month >= 10 && date< 10)
			fourDate[i] = month+"-"+"0"+date;
		else if(month < 10 && date < 10)
			fourDate[i] = "0"+month+"-"+"0"+date;
	}	
	for(var i =1;i<=4;i++)
	{
		document.getElementById("date"+i).innerHTML = fourDate[i-1];
	}
	//document.getElementById("date1").innerHTML = "1111";
	for(var i=0;i < ind[choosed];i++) 
	{
		document.getElementById("showtime"+(i+1)).innerText = firstDayMovie[choosed][i];
	}
	//document.getElementById("showtime1").innerText = "10:00";
}
function loadFirstPlays()
{
	$.ajax({
		//url : "http://localhost:8080/dbhw/gettimeservelet",
		url : "./gettimeservelet",
		type : "get",
		data : {
			movie : choosed
		},
		success : function(data) {
			//$("span").text(data);
			firstDate = data;
			setDate(firstDate);
		},
		error : function() {
			alert("뭔가 이상해요.ajax처리가 잘 안됫어요.");
		}
	});
}

function chooseTime(id)
{
	for(var i=1;i<=8;i++)
	{
		document.getElementById("showtime"+i).setAttribute("class","");
		if("showtime"+i == id)
		{
			choosedTime = document.getElementById(id).innerHTML;
			console.log("================= "+choosedTime);
		}
	}
	document.getElementById(id).setAttribute("class","current");
}
function chooseDate(id)
{
	for(var i=1;i<=4;i++)
		document.getElementById("date"+i).setAttribute("class","");
	document.getElementById(id).setAttribute("class","current");
	choosedDate = document.getElementById(id).innerHTML;
	console.log("================= "+choosedDate);
}
