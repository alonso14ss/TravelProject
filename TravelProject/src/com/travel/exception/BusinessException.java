package com.travel.exception;

public class BusinessException extends RuntimeException{
	public BusinessException(Throwable e) {
		super(e);
	}
	public BusinessException(String msg) {
		super(msg);
	}
	public BusinessException(String msg,Throwable e) {
		super(msg,e);
	}
}
