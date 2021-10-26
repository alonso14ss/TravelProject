package com.travel.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.travel.domain.Event;
import com.travel.domain.Product;
import com.travel.exception.DMLException;
import com.travel.exception.FileException;
import com.travel.model.common.file.FileManager;
import com.travel.model.event.EventDAO;

@Service
public class ProductService {
   @Autowired
   private ProductDAO productDAO;

   @Autowired
   private FileManager fileManager;

   @Autowired
   private EventDAO eventDAO;

   public void regist(Product product, MultipartFile myFile, String realPath) throws DMLException, FileException {
      // 날짜 인트형식으로 가공
      String departuredate = product.getDeparturedateOri().substring(6)
            + product.getDeparturedateOri().substring(0, 2) + product.getDeparturedateOri().substring(3, 5);
      String arrivaldate = product.getArrivaldateOri().substring(6) + product.getArrivaldateOri().substring(0, 2)
            + product.getArrivaldateOri().substring(3, 5);

      product.setDeparturedate(Integer.parseInt(departuredate));
      product.setArrivaldate(Integer.parseInt(arrivaldate));

      String filename = fileManager.saveFile(myFile, realPath);
      product.setMyFile(myFile);
      product.setFilename(filename);
      productDAO.insert(product);
   }

   public List selectAll() {
      return productDAO.selectAll();
   }

   public Product select(int product_id) {
      Product product = productDAO.select(product_id);

      if (Integer.toString(product.getDeparturedate()) != null) {
         String departuredate = Integer.toString(product.getDeparturedate());
         String arrivaldate = Integer.toString(product.getArrivaldate());

         String departuredateOri = departuredate.substring(4, 6) + "/" + departuredate.substring(6) + "/"
               + departuredate.substring(0, 4);
         String arrivaldateOri = arrivaldate.substring(4, 6) + "/" + arrivaldate.substring(6) + "/"
               + arrivaldate.substring(0, 4);

         product.setDeparturedateOri(departuredateOri);
         product.setArrivaldateOri(arrivaldateOri);
      }

      return product;
   }

   public void delete(int product_id) throws DMLException {
      productDAO.delete(product_id);
   }

   public void update(Product product, String realPath) throws DMLException, FileException {
      // 날짜 인트형식으로 가공
      String departuredate = product.getDeparturedateOri().substring(6)
            + product.getDeparturedateOri().substring(0, 2) + product.getDeparturedateOri().substring(3, 5);
      String arrivaldate = product.getArrivaldateOri().substring(6) + product.getArrivaldateOri().substring(0, 2)
            + product.getArrivaldateOri().substring(3, 5);

      product.setDeparturedate(Integer.parseInt(departuredate));
      product.setArrivaldate(Integer.parseInt(arrivaldate));

      MultipartFile multi = product.getMyFile();
      System.out.println("multi is " + multi.isEmpty());

      if (multi.isEmpty()) {//    ε带           DB         Ʈ
         productDAO.update(product);
      } else {//    ε      쿣 DB +    ϵ  ó  
            //                     !!
         FileManager.removeFile(realPath + product.getFilename());

         String filename = FileManager.saveFile(multi, realPath);
         product.setFilename(filename);
         productDAO.update(product);

      }
   }

   public List searchArrivalplace(String departureplace) {
      return productDAO.searchArrivalplace(departureplace);
   }

   public List search(Product product) {
      // 날짜 인트형식으로 가공
      String departuredate = product.getDeparturedateOri().substring(6)
            + product.getDeparturedateOri().substring(0, 2) + product.getDeparturedateOri().substring(3, 5);
      String arrivaldate = product.getArrivaldateOri().substring(6) + product.getArrivaldateOri().substring(0, 2)
            + product.getArrivaldateOri().substring(3, 5);

      product.setDeparturedate(Integer.parseInt(departuredate));
      product.setArrivaldate(Integer.parseInt(arrivaldate));

      //가격 인트형식으로 가공
      int minusIndex = product.getSearchPrice().indexOf('-');
      int endIndex = product.getSearchPrice().indexOf('원');
      int minPrice =Integer.parseInt(product.getSearchPrice().substring(0,minusIndex-1));
      int maxPrice;
      if(product.getSearchPrice().substring((minusIndex+1)).equals("9")) {
         maxPrice =999999;
      }else {
         maxPrice =Integer.parseInt(product.getSearchPrice().substring(minusIndex+2,endIndex));
      }
      product.setMinPrice(minPrice);
      product.setMaxPrice(maxPrice);
      
      return productDAO.search(product);
   }

   //  ̺ Ʈ    
   public String registEvent(Event event, int product_id) throws DMLException {
      String result = "1";

      String starttimeOri = event.getStarttimeOri().substring(6) + event.getStarttimeOri().substring(0, 2)
            + event.getStarttimeOri().substring(3, 5);
      String endtimeOri = event.getEndtimeOri().substring(6) + event.getEndtimeOri().substring(0, 2)
            + event.getEndtimeOri().substring(3, 5);

      if (event.getStart_time() < 10) {
         starttimeOri += "0";
         starttimeOri += Integer.toString(event.getStart_time());
      } else {
         starttimeOri += Integer.toString(event.getStart_time());
      }
      if (event.getEnd_time() < 10) {
         endtimeOri += "0";
         endtimeOri += Integer.toString(event.getEnd_time());
      } else {
         endtimeOri += Integer.toString(event.getEnd_time());
      }

      int start_time = Integer.parseInt(starttimeOri);
      int end_time = Integer.parseInt(endtimeOri);

      List eventList = eventDAO.selectAll();
      event.setProduct(productDAO.select(product_id));

      for (int i = 0; i < eventList.size(); i++) {
         Event obj = (Event) eventList.get(i);

         // 상품 출발 날짜 전에 이벤트가 종료되어아햔다.
         if ((end_time / 100) >= event.getProduct().getDeparturedate()) {
            result = "상품 날짜와 이벤트 적용 날짜를 확인해주세요";
            break;
         }
         if ((start_time / 100) >= event.getProduct().getDeparturedate()) {
            result = "상품 날짜와 이벤트 적용 날짜를 확인해 주세요";
            break;
         }
         if (start_time < obj.getStart_time()) {
            if (end_time > obj.getStart_time()) {
               result = "기존 이벤트 날짜와 중복됩니다";
               break;
            }
         }

         if (start_time > obj.getStart_time()) {
            if (start_time < obj.getEnd_time()) {
               result = "기존 이벤트 날짜와 중복됩니다";
               break;
            }
         }

         if (end_time > obj.getEnd_time()) {
            if (start_time < obj.getEnd_time()) {
               result = "기존 이벤트 날짜와 중복됩니다.";
               break;
            }
         }

         if (end_time < obj.getEnd_time()) {
            if (end_time > obj.getStart_time()) {
               result = "기존 이벤트 날짜와 중복됩니다.";
               break;
            }
         }

      }

      event.setStart_time(start_time);
      event.setEnd_time(end_time);

      if (result == "1") {
         eventDAO.insert(event);
      }
      return result;
   }

   //  ̺ Ʈ    
   public List getEvenetList() {
      return eventDAO.selectAll();
   }

   public Event eventSelect(int event_id) {
      Event event = eventDAO.select(event_id);

      if ((Integer.toString(event.getStart_time()) != null) && (Integer.toString(event.getEnd_time()) != null)) {
         String startdate = Integer.toString(event.getStart_time()).substring(0, 8);
         String enddate = Integer.toString(event.getEnd_time()).substring(0, 8);

         String starttimeOri = startdate.substring(4, 6) + "/" + startdate.substring(6) + "/"
               + startdate.substring(0, 4);
         String endtimeOri = enddate.substring(4, 6) + "/" + enddate.substring(6) + "/" + enddate.substring(0, 4);

         event.setStarttimeOri(starttimeOri);
         event.setEndtimeOri(endtimeOri);

         String start_time = Integer.toString(event.getStart_time()).substring(8);
         String end_time = Integer.toString(event.getEnd_time()).substring(8);
         event.setStart_time(Integer.parseInt(start_time));
         event.setEnd_time(Integer.parseInt(end_time));
      }

      return event;

   }

   public boolean eventProductSelect(int product_id) {
      return eventDAO.eventProductSelect(product_id);
   }

   public void eventUpdate(Event event, int product_id) throws DMLException {
      String starttimeOri = event.getStarttimeOri().substring(6) + event.getStarttimeOri().substring(0, 2)
            + event.getStarttimeOri().substring(3, 5);
      String endtimeOri = event.getEndtimeOri().substring(6) + event.getEndtimeOri().substring(0, 2)
            + event.getEndtimeOri().substring(3, 5);

      if (event.getStart_time() < 10) {
         starttimeOri += "0";
         starttimeOri += Integer.toString(event.getStart_time());
      } else {
         starttimeOri += Integer.toString(event.getStart_time());
      }
      if (event.getEnd_time() < 10) {
         endtimeOri += "0";
         endtimeOri += Integer.toString(event.getEnd_time());
      } else {
         endtimeOri += Integer.toString(event.getEnd_time());
      }

      event.setStart_time(Integer.parseInt(starttimeOri));
      event.setEnd_time(Integer.parseInt(endtimeOri));

      event.setProduct(productDAO.select(product_id));
      eventDAO.update(event);
   }

   public void eventDelete(int event_id) throws DMLException {
      Event event = eventDAO.select(event_id);
      Product product = event.getProduct();
      product.setPrice(product.getPrice_ori());
      product.setPrice_ori(0);
      eventDAO.delete(event_id);
      productDAO.update(product);
      
   }
   
   public void event(int product_id) throws DMLException{
      productDAO.event(product_id);
   }
   
   public void eventProduct(Product Product) throws DMLException{
      productDAO.eventProduct(Product);
   }
   
   public void eventEnd(int product_id) throws DMLException{
      productDAO.eventEnd(product_id);
   }
   
}