package com.travel.controller.common;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.travel.exception.AdminAuthException;
import com.travel.exception.MemberAuthException;

@ControllerAdvice
public class GlobalExceptionHandler {
   
   //일반 사용자가 로그인 하지 않았을때, 즉 권한이 없을때의 예외
   @ExceptionHandler(MemberAuthException.class)
   public String handleException(MemberAuthException e, Model model) {
      System.out.println("발생한 예외의 메시지 : "+e.getMessage());
      
      model.addAttribute("url", "/");
      model.addAttribute("msg", e.getMessage());
      
      return "view/message";
   }
   
   @ExceptionHandler(AdminAuthException.class)
   public String handleException(AdminAuthException e, Model model) {
      System.out.println("발생한 예외의 메시지 : "+e.getMessage());
      
      model.addAttribute("url", "/admin");
      model.addAttribute("msg", e.getMessage());
      
      return "view/message";
   }
}