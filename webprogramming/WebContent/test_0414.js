function solution(n, money) {
    var answer = 0;

	// n을 money라는 배열에 저장된 거스름돈으로 나누어서 성공하면 카운트 1증가 
	
    var n = 5; // 잔돈으로 줘야할 돈 
//    var n=10;
	var money = [1,2,5]; // 잔돈으로 줄 수 있는 돈
	var z = 0; // n을 money로 나눈 몫
    
//	for(var i=1; i<=5 ; i++){
//		z = n%(money[0]*i);
////		z = n%(1*i);
//		if(z==0){
//			answer++;
//		}
//		if(z!=0){
//			answer--;
//			for(var j=1;j<=5;j++){
//				z = z%(money[1]*j);
////				z = z%(2*j);
//				if(z==0){
//					answer++;
//				}
//				if(z!=0){
//					for(var k=1;k<=5;k++){
//						z = z%(money[2]*k);
////						z = z%(5*j);
//						if(z==0){
//							answer++;
//						}
//						
//					}
//					break;
//				}
//			}
//		}
//		
//	}
	for(var i=1; i<=5 ; i++){
		for(var j=0;j<=money.length;j++){
		z = n%(money[j]*i);
		if(z==0){
			answer++;
			console.log(1);
		}
		if(z!=0){
				z = z%(money[j+1]*i);
				if(z==0){
					answer++;
					console.log(2);
				}
				if(z!=0){
						z = z%(money[j+2]*i);
						if(z==0){
							answer++;
							console.log(3);
							break;
						}
					}
				}
			}
		}
		
	alert(answer);
	
	return answer; //경우의 수 
	}


//console.log(solution(5,[1,2,5])); //4

