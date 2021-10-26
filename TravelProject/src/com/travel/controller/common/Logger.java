package com.travel.controller.common;

import org.aspectj.lang.JoinPoint;


public class Logger implements LoggerParent{
	public void log(JoinPoint joinPoint) {
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		
		System.out.println(className + "의 "+ methodName+ " 메서드 호출");
	}
}
