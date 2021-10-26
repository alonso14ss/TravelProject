package com.travel.exception;

public class DataNotFoundException extends BusinessException{
	public DataNotFoundException(String msg) {
		super(msg);
	}
	public DataNotFoundException(Throwable e) {
		super(e);
	}
	public DataNotFoundException(String msg, Throwable e) {
		super(msg, e);
	}
	
}








