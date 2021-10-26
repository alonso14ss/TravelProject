package com.travel.log;

import org.aspectj.lang.JoinPoint;

public class MyLogger {
	
	//AOP에 의해 공통코드가 관여한 지점에 대한 정보 객체
	public void log(JoinPoint joinPoint) {
		String className=joinPoint.getTarget().getClass().getName();//공통코드가 적용된 객체
		String methodName=joinPoint.getSignature().getName();
		
		System.out.println(className+"의 "+methodName+"메서드 호출");
	}
}




