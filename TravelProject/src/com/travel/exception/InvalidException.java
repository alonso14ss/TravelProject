package com.travel.exception;

public class InvalidException extends BusinessException{
	public InvalidException(String msg) {
		super(msg);
	}
	public InvalidException(Throwable e) {
		super(e);
	}
	public InvalidException(String msg, Throwable e) {
		super(msg, e);
	}
	
}








