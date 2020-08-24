/**
 * 
 */




function proc1(){
	//var now = new Date("2020.10.10");
	//파라미터값을 지정해주지 않으면 당일 날짜기준으로 출력되지만 지정된 날짜를입력하면 지정된 날짜 12:00 가 출력된다.
	
	//var now = new Date(2020,10,10,15,00);
	//10월을 넣으면 11월에 해당하는 날짜와 시간이 나온다. (시간표시는 선택사항)
	//11월 10일(month는 0부터 세팅 )
	
	var now = new Date(1000);
	//출력방식 >> 1970. 1. 1. 오전 9:00:01 --> 1.1 기준으로 밀리세컨드 만큼 지난 시간이 세팅 
	
	now = now.toLocaleString();
	
	//now = now.toLocaleDateString();
	
	//now = now.toLocaleTimeString();
	
	document.getElementById("result").innerHTML = now;
}

function changeDay(day){
	/* 숫자값 day를 요일로 변환하세요*/
	
	/*switch(day)
	{
	case 0: day="일"; break;
	case 1: day="월"; break;
	case 2: day="화"; break;
	case 3: day="수"; break;
	case 4: day="목"; break;
	case 5: day="금"; break;
	case 6: day="토"; break;
	}*/
	
	var days = ["일","월","화","수","목","금","토"];
	
	return  days[day];
	
	 //일요일 , 월요일 ,.....
}


function proc2(){
	var now = new Date(); // 오늘 날짜
	var day = now.getDay(); //요일 숫자값
	document.getElementById("result").innerHTML = "오늘은 " + changeDay(day) +"요일 입니다. ";
}

function proc3(){
	
	var now = new Date(); //오늘 날짜
	
	var birth = new Date(1993,00,07); //자신의 생일 세팅
	
	/* 자기가 태어난  날부터 오늘까지의 날짜를 리턴*/
	/* 힌트 : bitth.getTime() 하면 1970.01.01 부터 birth날짜 까지의 밀리세컨드를 반환*/
	
	var mil = now.getTime()-birth.getTime();
	mil =  parseInt(mil/(1000*60*60*24));
	//1000초 60분 60시 24일
	document.getElementById("result").innerHTML = mil +" 일";
	//1970년 1월1일 부터의 밀리세컨드 
	
	
	
}

function proc4(){
	/*오늘 부터 100일 후 날짜 출력*/
	
	
	/*(100*1000*60*60*24)*/
	
	var mil2 =24*60*60*1000*100;
	//하루 시간 분 초 백일
	var now = new Date();
	
	var times = now.getTime() + mil2;
	
	var date = new Date(times);
		
	document.getElementById("result").innerHTML = date.toLocaleString();;
	
	
}

function proc5(){
	
	/*
	 	getDate() <!-- 1~31일을 가져온다. -->
		getMonth() <!-- 0~11 달을 가져온다.  -->
		getFullYear() <!-- 년도를 가져온다. 2020 -->
		getHours() <!-- 0~23시간을 가져온다.-->
		getMinutes() <!-- 0~59분을 가져온다. -->
		getSeconds() <!-- 0~59초를 가져온다. -->
		getMilliseconds() <!--  0~999 밀리초를 가져온다.  -->
		getTime() <!-- 경과시간 -->
	 */
	
	var res ="";
	var now = new Date();
	//2020년 02월 20일 10시 42분 20초 입니다. 
	
	res += now.getFullYear() +" 년  ";
	res += (now.getMonth()+1)+ " 월 ";
	res += now.getDate() + " 일 ";
	res += now.getHours() + " 시 ";
	res += now.getMinutes() + " 분 ";
	res += now.getSeconds() + " 초 ";
	
	document.getElementById("result").innerHTML = res;
	
}

function checkDate(){
	// 오늘 기준으로 13일 이후에 산건 환불 가능 
	// 12일을 포함한 12일 이전에 산건 환불 불가능 
	//value값으로 가져간다. 
	
	var today = new Date();
	var date = document.getElementById("pdate").value;
	var chdate = new Date(date); 
	
	var res = "";
	
	var chkdate =  parseInt(today.getTime()/1000/60/60/24) 
					- parseInt(chdate.getTime()/1000/60/60/24);
	
	//var checkDay = parseInt(chkdate /1000/60/60/24);
	
	//res += checkDay + " 일이 지났습니다. ";
	
	
	if(chkdate > 7){
		res = "교환기간이 지났습니다.";
	}else{
		res = "교환이 가능합니다.";
	}
	
	document.getElementById("result").innerHTML = res;
	
}









