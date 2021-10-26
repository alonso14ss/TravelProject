package com.travel.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.travel.controller.common.Pager;
import com.travel.domain.Event;
import com.travel.domain.Product;
import com.travel.exception.DMLException;
import com.travel.exception.FileException;
import com.travel.model.common.file.FileManager;
import com.travel.model.product.ProductService;

@Controller
public class ProductController {
   /*DI방식도 100% 의존성을 탈피하지는 못한 것*/
   @Autowired
   private ProductService productService;
   
   @Autowired
   private Pager pager;
   
   
   //사용자 요청 처리 
   //상세보기 요청 
   @RequestMapping(value="/shop/detail", method=RequestMethod.GET)
   public String getDetail(Model model,@RequestParam int product_id) {
      Product product=productService.select(product_id);
      model.addAttribute("product", product);
      return "shop/detail";
   }
   
      
   
   
   
   @ExceptionHandler({FileException.class, DMLException.class})
   public ModelAndView handle(FileException e, DMLException e2) {
      ModelAndView mav = new ModelAndView();
      
      //파일 업로드 에러인 경우
      if(e !=null) {
         mav.addObject("e", e);//에러 객체 자체를 담는다!!
         mav.addObject("msg", e.getMessage());//에러 객체 자체를 담는다!!
      }else if(e2 !=null) {
         mav.addObject("e", e2);//에러 객체 자체를 담는다!!
         mav.addObject("msg", e2.getMessage());//에러 객체 자체를 담는다!!
      }
      //입력 에러엔 경우 
      mav.setViewName("view/error");
      return mav;
   }
   
}














