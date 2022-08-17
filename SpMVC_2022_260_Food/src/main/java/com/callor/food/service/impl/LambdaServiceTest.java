package com.callor.food.service.impl;

import com.callor.food.service.LambdaService;

public class LambdaServiceTest {
	
	public static void main(String[] args) {
		
		// Java8에서 사용하여 funcional interface 개념
		//LambdaService interface에 한개의 method만 존재할 경우
		//별도의 클래스를 선언하거나 하지 않고 직접 Lambda 코드를 사용하여
		//객체를 생성하고 객체의 method를 사용할 수 있다.
		LambdaService lService = (nation,name,num)->{
			return nation+name+num;
		};
		String result = lService.getObject("아","이", "야");
		
		
	}
}
