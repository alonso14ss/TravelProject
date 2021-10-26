package com.travel.model.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.Member;
import com.travel.domain.OrderSummary;
import com.travel.exception.DMLException;

@Service
public class OrderService {
   @Autowired
   private OrderSummaryDAO orderSummaryDAO;
   
   @Autowired
   private OrderDetailDAO orderDetailDAO;
   
   //     ֹ              
   public List selectAll() {
      return orderSummaryDAO.selectAll();
   }
   public OrderSummary select(int order_summary_id) {
      return orderSummaryDAO.select(order_summary_id);
   }
   
   // ش   ֹ  ڵ忡  Ҽӵ   ֹ                 
   public List getOrderDetail(int order_summary_id) {
      return orderDetailDAO.selectAll(order_summary_id);
   }
   // ش  ȸ          ֹ             ⤿ 
   public List selectAllByMember(Member member) {
      return orderSummaryDAO.selectAllByMember(member);
   }
   
   public void delete(int order_summary_id) throws DMLException{
      orderSummaryDAO.delete(order_summary_id);
   }
}




