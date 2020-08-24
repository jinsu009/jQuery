/**
 * 
 */

function proc1() {

	/*
	 * 1~10까지의 난수를 발생하고 해당 수를 맞추는 문제
	 * 
	 * prompt로 숫자를 입력하면 해당 난수보다 작성한 값이 작으면 '작성한 값이 작습니다.' 해당 난수보다 작성한 값이 크면
	 * '작성한값이 큽니다' 동일하면 '맞췄습니다.' 출력
	 * 
	 * 추가. 정답을 시도한 횟수 count
	 */
	var count = 0;
	var num = Math.floor(Math.random() * 10 + 1);
	do {
		var a = parseInt(prompt("숫자를 입력해주세요 "));
		count++;

		if (a > num) {
			alert("작성한 값이 큽니다.");

		}
		if (a < num) {
			alert("작성한 값이 작습니다.");

		}
		if (a == num) {

			break;
		}

	} while (true);

	alert("정답. " + num + " 시도 횟수 >> " + count);
	document.getElementById("result").innerHTML = num;
}

function proc2() {

	var arr = [ "가위", "바위", "보" ];
	/* 0~2까지의 난수를 발생시켜서 컴퓨터가 가위,바위, 보중에서 하나 선택할 수 있게 지정 */
	/*
	 * prompt로 가위, 바위, 보를 입력하여 컴퓨터와 비교하고 이겼습니다. 졌습니다./ 비겼습니다 출력 비겼을꼉우 한번더 가위바위보
	 * 실행
	 */
	do {
		var num = Math.floor(Math.random() * 2);
		var com = arr[num];
		var a = (prompt("가위, 바위, 보 입력"));

		switch (com) {
		case "가위":
			if (a == "바위") {
				alert("이겼습니다.");
				document.write("컴퓨터  >> " + com + "  사용자 >> " + a);
				break;
			}
			if (a == "보") {
				alert("졌습니다.");
				document.write("컴퓨터  >> " + com + "  사용자 >> " + a);
				break;
			} else {
				var b = parseInt(prompt("비겼습니다. 한번더 하시겠습니까?(1.계속 0.종료)"));

				if (b == 0) {
					break;
				} else {
					continue;
					/* 가위바위보가 계속되는게 아니라 한번더가 계속됨 */
				}
			}
		case "바위":
			if (a == "보") {
				alert("이겼습니다.");
				document.write("컴퓨터  >> " + com + "  사용자 >> " + a);
				break;
			}
			if (a == "가위") {
				alert("졌습니다.");
				document.write("컴퓨터  >> " + com + "  사용자 >> " + a);
				break;
			} else {
				var b = parseInt(prompt("비겼습니다. 한번더 하시겠습니까?(1.계속 0.종료)"));

				if (b == 0) {
					break;
				} else {
					continue;
					/* 가위바위보가 계속되는게 아니라 한번더가 계속됨 */
				}
			}
		case "보":
			if (a == "가위") {
				alert("이겼습니다.");
				document.write("컴퓨터  >> " + com + "  사용자 >> " + a);
				break;
			}
			if (a == "바위") {
				alert("졌습니다.");
				document.write("컴퓨터  >> " + com + "  사용자 >> " + a);
				break;
			} else {
				var b = parseInt(prompt("비겼습니다. 한번더 하시겠습니까?(1.계속 0.종료)"));

				if (b == 0) {
					break;
				} else {
					continue;
					/* 가위바위보가 계속되는게 아니라 한번더가 계속됨 */
				}
			}

		}
		break;
	} while (true);

	document.getElementById("result").innerHTML = "컴퓨터  >> " + com + "  사용자 >> " + a;

}

function proc3() {
	/*
	 * 출력형태는 5*6의 테이블 형태로 가로로 한줄씩 랜덤수가 중복되지 않도록
	 */
	var lottoarr = [];
	var idx =0;
	var str = " ";
	

	str += "<table>";

	for (var i = 0; i < 5; i++) {
		str += "<tr>";

		for (var z = 0; z < 6; z++) {
			var lotto = Math.floor(Math.random() * 45) + 1;
			idx=lottoarr.indexOf(lotto);
			
			if(idx==-1)	lottoarr.push(lotto);
					
			console.log(lotto);
						
			if(lottoarr.length >= 6) break;
		}

		for (var j = 0; j < 6; j++) {

			str += "<td>";

			str += lottoarr[j];

			str += "</td>";
		}

		str += "</tr>";

		lottoarr = [];
	}

	str += "</table>";

	document.getElementById("result").innerHTML = str;
}
