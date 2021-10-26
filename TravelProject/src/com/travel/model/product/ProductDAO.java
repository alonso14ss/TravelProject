package com.travel.model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.domain.Product;
import com.travel.exception.DMLException;

@Repository
public class ProductDAO {
   @Autowired
   private SqlSessionTemplate sessionTemplate;
   
   public void insert(Product product) throws DMLException{
      int result=sessionTemplate.insert("Product.insert", product);
      if(result==0) {
         throw new DMLException("상품이 등록되지 않았습니다");
      }
   }
   

   //모든 상품 가져오기 
   public List selectAll() {
      return sessionTemplate.selectList("Product.selectAll");
   }
   
   
   public Product select(int product_id) {
      return sessionTemplate.selectOne("Product.select", product_id);
   }
   
   public void delete(int product_id) throws DMLException{
      int result=sessionTemplate.delete("Product.delete",product_id);
      if(result==0) {
         throw new DMLException("상품이 삭제처리 되지 않았습니다");
      }
   }
   public void update(Product product) {
      int result=sessionTemplate.update("Product.update", product);
      if(result==0) {
         throw new DMLException("수정되지 않았습니다");
      }
   }
   
   public List searchArrivalplace(String departureplace) {
      return sessionTemplate.selectList("Product.searchArrivalplace",departureplace);
   }

   
   public List search(Product product) {
      System.out.println("출발장소"+product.getDepartureplace());
      System.out.println("도착장소"+product.getArrivalplace());
      System.out.println("출발날짜"+product.getDeparturedate());
      System.out.println("도착날짜"+product.getArrivaldate());
      System.out.println("최소값"+product.getMinPrice());
      System.out.println("최대값"+product.getMaxPrice());
      List productList = sessionTemplate.selectList("Product.search",product);
      System.out.println(productList.size());
      return productList;
      //return sessionTemplate.selectList("Product.search",product);
   }
   
   public void event(int product_id) throws DMLException {
      sessionTemplate.update("Event.eventing",product_id);
   }
   
   public void eventProduct(Product Product) throws DMLException {
      sessionTemplate.update("Product.eventing",Product);
   }
   
   public void eventEnd(int product_id) throws DMLException{
      sessionTemplate.update("Product.eventend",product_id);
   }
}














