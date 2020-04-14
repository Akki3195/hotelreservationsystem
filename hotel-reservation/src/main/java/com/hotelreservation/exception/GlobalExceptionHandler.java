package com.hotelreservation.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public String handleAnyException(HttpServletRequest request, Exception ex){
		ex.printStackTrace();
		return "error";
	}

}
