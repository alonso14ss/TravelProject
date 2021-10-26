package com.travel.exception;

public class AdminAuthException extends InvalidException{
	public AdminAuthException(String msg) {
		super(msg);
	}
	public AdminAuthException(Throwable e) {
		super(e);
	}
	public AdminAuthException(String msg, Throwable e) {
		super(msg, e);
	}	
}
