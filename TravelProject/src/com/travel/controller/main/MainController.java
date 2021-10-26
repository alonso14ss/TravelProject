package com.travel.controller.main;

import java.util.GregorianCalendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.travel.domain.Event;
import com.travel.domain.Product;
import com.travel.exception.DMLException;
import com.travel.exception.FileException;
import com.travel.model.product.ProductService;

@Controller
public class MainController {
   @Inject
   private ProductService productService;

   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String main(Model model, HttpServletRequest request) {
      System.out.println("main called !!");

      GregorianCalendar today = new GregorianCalendar();
      int year = today.get(today.YEAR);
      int month = today.get(today.MONTH) + 1;
      int nowdate = today.get(today.DATE);
      int nowhours = today.get(today.HOUR);
      String nowMonth;
      String nowDate;
      String nowHours;
      if (month < 9) {
         nowMonth = "0" + Integer.toString(month);
      } else {
         nowMonth = Integer.toString(month);
      }
      if (nowdate < 10) {
         nowDate = "0" + Integer.toString(nowdate);
      } else {
         nowDate = Integer.toString(nowdate);
      }
      if (nowhours < 10) {
         nowHours = "0" + Integer.toString(nowhours);
      } else {
         nowHours = Integer.toString(nowhours);
      }

      String nowTimes = year + nowMonth + nowDate + nowHours;
      int nowTime = Integer.parseInt(nowTimes);
      
      List eventList = productService.getEvenetList();
      
      if(eventList.size()>1) {
         Event obj = (Event)eventList.get(1);
         if(obj.getStart_time() <= nowTime) {
            productService.event(-1);
            obj.getProduct().setPrice((int)((obj.getProduct().getPrice_ori() * (100-obj.getDiscount())) / 100));
            productService.eventProduct(obj.getProduct());
         }else {
            productService.event(-2);
            productService.eventEnd(obj.getProduct().getProduct_id());
         }
      }
      
      
      List productList = productService.selectAll();
      model.addAttribute("productList", productList);
      model.addAttribute("eventList", eventList);
      return "main";
   }

   @RequestMapping(value = "/destination", method = RequestMethod.GET)
   public String destination(Model model, HttpServletRequest request) {
      System.out.println("detination called !!");
      List productList = productService.selectAll();
      model.addAttribute("productList", productList);
      return "destination";
   }

   @RequestMapping(value = "/searchDestination", method = RequestMethod.POST)
   public String searchDestination(Model model, HttpServletRequest request, Product product) {
      List productList = productService.search(product);
      model.addAttribute("productList", productList);
      return "searchDestination";
   }

   @RequestMapping(value = "/regist", method = RequestMethod.GET)
   public String regist(Model model, HttpServletRequest request) {
      return "registForm";
   }


   @RequestMapping(value = "/product/search", method = RequestMethod.GET)
   @ResponseBody
   public List search(@RequestParam String departureplace,HttpServletRequest request) {
      List arrivalList = productService.searchArrivalplace(departureplace);
      return arrivalList;
   }

   @ExceptionHandler({ FileException.class, DMLException.class })
   public ModelAndView handle(FileException e, DMLException e2) {
      ModelAndView mav = new ModelAndView();

      // 파일 업로드 에러인 경우
      if (e != null) {
         mav.addObject("e", e);// 에러 객체 자체를 담는다!!
         mav.addObject("msg", e.getMessage());// 에러 객체 자체를 담는다!!
      } else if (e2 != null) {
         mav.addObject("e", e2);// 에러 객체 자체를 담는다!!
         mav.addObject("msg", e2.getMessage());// 에러 객체 자체를 담는다!!
      }
      // 입력 에러엔 경우
      mav.setViewName("view/error");
      return mav;
   }

}