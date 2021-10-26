package com.travel.exception;

public class FileException extends RuntimeException{
	public FileException(String msg) {
		super(msg);
	}
	public FileException(Throwable e) {
		super(e);
	}
	public FileException(String msg, Throwable e) {
		super(msg, e);
	}
	
	
}
