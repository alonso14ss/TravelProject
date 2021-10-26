package com.travel.controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.travel.controller.common.Pager;
import com.travel.domain.OrderSummary;
import com.travel.exception.DMLException;
import com.travel.exception.FileException;
import com.travel.model.order.OrderService;

//관리자의 주문 처리 
@Controller
@RequestMapping("/admin/order")
public class OrderController {
   @Autowired
   private OrderService orderService;
   
   @Autowired
   private Pager pager;
   
   //목록보기
   @RequestMapping(value="/list")
   public String selectAll(Model model, HttpServletRequest request) {
      System.out.println("주문 목록이 궁금해?");
      List orderList = orderService.selectAll();
      System.out.println(orderList.size());
      pager.init(orderList, request);
      model.addAttribute("orderList", orderList);
      model.addAttribute("pager", pager);
      
      return "admin/order/list";
   }
   
   //주문상세보기 요청 처리 
   @RequestMapping(value="/detail", method=RequestMethod.GET)
   public String select(Model model, @RequestParam int order_summary_id, HttpServletRequest request) {
      OrderSummary orderSummary=orderService.select(order_summary_id);
      
      System.out.println("orderSumamry " + orderSummary);
      
      List detailList=orderService.getOrderDetail(order_summary_id);

      model.addAttribute("detailList", detailList);
      model.addAttribute("orderSummary", orderSummary);
      
      return "admin/order/detail";
   }
   
   //주문삭제 
   @RequestMapping(value="/del", method=RequestMethod.GET)
   public String delete(@RequestParam int order_summary_id,Model model, HttpServletRequest request) {
      orderService.delete(order_summary_id);
      List orderList = orderService.selectAll();
      pager.init(orderList, request);
      model.addAttribute("orderList", orderList);
      model.addAttribute("pager", pager);
      return "admin/order/list";
   }
   
   //주문수정 
   @RequestMapping(value="/edit", method=RequestMethod.POST)
   public String edit() {
      return null;
   }
   
   //주문등록
   @RequestMapping(value="/regist", method=RequestMethod.POST)
   public String regist() {
      return null;
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