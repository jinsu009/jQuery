/**
 * 외부 스크립트 파일입니다. 
 */


/*function gradeFunc(){
	var grade = prompt("성적을 입력해 주세요 (A~F 까지)");

	switch(grade)
	{	
		case "A" : alert("잘했어요"); break;
		case "B" : alert("좋은 점수 에용"); break;
		case "C" : alert("괜찮은점수에요"); break;
		case "D" : alert("조금더 노력하세요"); break;
		case "F" : alert("다음학기 수강하세요"); break;
		default : alert("알 수 없는 학점 입니다.");
	}
}*/

/*힌트 : parseint는 소수점일 경우 정수형으로 변경됨*/
/*
	  	90 점 이상 a , 80점 이상 b, 70점 이상 c , 60점 이상 d, 59점 이하는  f
	  	switch문을 이용!!
 */

//function gradeInput(grade){
//	if((grade*1) >=90)
//		{
//		 alert("A");
//		}
//	if((grade*1) >=80)
//	{
//	 alert("B");
//	}
//	if((grade*1) >=70)
//	{
//	 alert("C");
//	}
//	if((grade*1) >=60)
//	{
//	 alert("D");
//	}
//	if((grade*1) < 60)
//	{
//	 alert("F");
//	}
	//var jum = parseInt(grade/10);
	
//	var jum = (grade/10);
//	
//	switch(parseInt(jum))
//	{	
//	case 10 : alert("A"); break;
//	case 9 : alert("A"); break;
//	case 8 : alert("B"); break;
//	case 7 : alert("C"); break;
//	case 6 : alert("D"); break;
//	default : alert("F"); break;
//	}
//	
//	document.write(grade);
//	document.write();
//	document.write(jum);
//	
//}

/*	
  가위, 바위, 보 문제 
  함수호출 형태 result(p1,p2)
  <<p1, p2파라미터는 html 내부 스크립트에서 prompt로 입력받기>>
 p1은 가위, 바위, 보 중에 하나의 텍스트 
 p2는 가위, 바위, 보 중에 하나의 텍스트를 입력받아
 
 p1이 가위, p2가 보라면 
 "p1이 가위로 이겼습니다. 라고 출력"

 p1이 바위, p2가 바위라면 
 "p1과 p2가 바위로 비겼습니다." 라고 출력
 */

function gameInput(p1, p2)
{
	if(p1 == p2)
		{
			document.write("p1과 p2가 '" + p1 + "' 비겼습니다.");
		}
	if((p1=='가위' && p2=='보') ||(p1=='보' && p2=='바위')|| (p1=='바위' && p2=='가위') )
		{
			document.write("p2가 '"+p2+"' 로 졌습니다.");
		}
	if((p1=='보' && p2=='가위') ||(p1=='바위' && p2=='보')|| (p1=='가위' && p2=='바위') ) {		
		document.write("p2가 '"+p2+"' 로 이겼습니다.");		
	}
	
}















