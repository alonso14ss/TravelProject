package com.travel.controller.common;

import org.aspectj.lang.JoinPoint;

public interface LoggerParent {
	public void log(JoinPoint joinPoint);
}
