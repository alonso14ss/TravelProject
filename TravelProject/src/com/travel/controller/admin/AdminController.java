package com.travel.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.travel.domain.Admin;
import com.travel.domain.Cs;
import com.travel.domain.Event;
import com.travel.domain.Member;
import com.travel.domain.Product;
import com.travel.exception.DMLException;
import com.travel.exception.FileException;
import com.travel.model.admin.AdminService;
import com.travel.model.common.file.FileManager;
import com.travel.model.cs.CsService;
import com.travel.model.member.MemberService;
import com.travel.model.product.ProductService;

@Controller
public class AdminController {
   @Autowired
   private AdminService adminService;
   @Autowired
   private ProductService productService;
   
   @Autowired
   private MemberService memberService;

   @Autowired
   private Pager pager;
   
   @Autowired
   private CsService csService;

   @RequestMapping(value = "/admin/product/regist", method = RequestMethod.POST)
   public ModelAndView regist(Product product, HttpServletRequest request) {

      // 파일업로드 처리~~~

      // Product VO가 보유한 MultipartFile 안에 업로드된 파일 정보가
      // 들어있다..따라서 메모리상에서 존재하므로, 원하는 경로에 저장하자!!
      // FileManager.saveFile(product.getMyFile(),
      // request.getServletContext().getRealPath("/data/"));
      productService.regist(product, product.getMyFile(), request.getServletContext().getRealPath("/data/"));

      ModelAndView mav = new ModelAndView();
      mav.addObject("url", "/admin/product/list");
      mav.addObject("msg", "파일업로드 성공");
      mav.setViewName("view/message");

      return mav;
   }

   @RequestMapping(value = "/admin/product/list", method = RequestMethod.GET)
   public ModelAndView selectAll(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();

      List productList = productService.selectAll();

      // 페이징 처리 객체
      pager.init(productList, request);
      mav.addObject("productList", productList);
      mav.addObject("pager", pager);

      mav.setViewName("admin/product/index");
      return mav;
   }

   // 상세보기 요청
   @RequestMapping(value = "/admin/product/detail", method = RequestMethod.GET)
   public String select(Model model, @RequestParam int product_id,HttpServletRequest request) {
      List<Product> productList = productService.selectAll();
      Product product = productService.select(product_id);
      model.addAttribute("product", product);
      model.addAttribute("productList", productList);
      return "admin/product/detail";
   }

   @RequestMapping(value = "/admin/product/delete2", method = { RequestMethod.GET, RequestMethod.POST })
   @ResponseBody
   public String checkEventProduct(@RequestParam int product_id,HttpServletRequest request) {
      if (productService.eventProductSelect(product_id)) {
         return "1";
      }
      return "0";
   }

   // 상세보기 요청
   @RequestMapping(value = "/admin/product/delete", method = { RequestMethod.GET, RequestMethod.POST })
   public String delete(HttpServletRequest request, Model model, @RequestParam int product_id,
         @RequestParam String filename) {

      // 파일도 삭제!!
      String realPath = request.getServletContext().getRealPath("/data/" + filename);

      FileManager.removeFile(realPath);
      productService.delete(product_id);

      model.addAttribute("url", "/admin/product/list");
      model.addAttribute("msg", "삭제 성공");
      return "view/message";
   }

   // 수정 요청 처리
   @RequestMapping(value = "/admin/product/edit", method = RequestMethod.POST)
   public String update(Model model, Product product, HttpServletRequest request) {
      productService.update(product, request.getServletContext().getRealPath("/data/"));

      model.addAttribute("msg", "수정 성공");
      model.addAttribute("url", "/admin/product/detail?product_id=" + product.getProduct_id());
      return "view/message";

   }

   /* 기획상품 관리 */
   @RequestMapping(value = "/admin/event/list", method = RequestMethod.GET)
   public ModelAndView getEventListAdmin(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();

      List eventList = productService.getEvenetList();

      // 페이징 처리 객체
      pager.init(eventList, request);
      mav.addObject("eventList", eventList);
      mav.addObject("pager", pager);

      mav.setViewName("admin/event/list");
      return mav;
   }
   
   
   @RequestMapping(value = "/admin/member/list", method = RequestMethod.GET)
   public ModelAndView memberList(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();

      List memberList = memberService.selectAll();

      // 페이징 처리 객체
      pager.init(memberList, request);
      mav.addObject("memberList", memberList);
      mav.addObject("pager", pager);

      mav.setViewName("admin/member/list");
      return mav;
   }
   

   @RequestMapping(value = "/admin/event/regist", method = RequestMethod.POST)
   public ModelAndView registEvent(Event event, HttpServletRequest request, @RequestParam int product_id) {
      String result = productService.registEvent(event, product_id);
      ModelAndView mav = new ModelAndView();

      if (result == "1") {
         mav.addObject("url", "/admin/event/list");
         mav.addObject("msg", "파일업로드 성공");
         mav.setViewName("view/message");
      } else {
         mav.addObject("url", "history.back();");
         mav.addObject("msg", result);
         mav.setViewName("view/message");
      }
      return mav;

   }

   @RequestMapping(value = "/admin/event/registForm", method = RequestMethod.GET)
   public String registForm(Model model,HttpServletRequest request) {
      List<Product> productList = productService.selectAll();
      model.addAttribute("productList", productList);
      return "admin/event/registForm";
   }

   @RequestMapping(value = "/admin/event/detail", method = RequestMethod.GET)
   public String eventSelect(Model model, @RequestParam int event_id,HttpServletRequest request) {
      List<Product> productList = productService.selectAll();
      Event event = productService.eventSelect(event_id);
      model.addAttribute("event", event);
      model.addAttribute("productList", productList);
      return "admin/event/detail";
   }
   
   @RequestMapping(value = "/admin/member/detail", method = RequestMethod.GET)
   public String memberSelect(Model model, @RequestParam int member_id , HttpServletRequest request) {
      Member member = memberService.select(member_id);
      model.addAttribute("member", member);
      return "admin/member/detail";
   }

   // 수정 요청 처리
   @RequestMapping(value = "/admin/event/edit", method = RequestMethod.POST)
   public String eventUpdate(Model model, Event event, HttpServletRequest request, @RequestParam int product_id) {
      productService.eventUpdate(event, product_id);
      model.addAttribute("msg", "수정 성공");
      model.addAttribute("url", "/admin/event/detail?event_id=" + event.getEvent_id());
      return "view/message";

   }

   @RequestMapping(value = "/admin/event/delete", method = { RequestMethod.GET, RequestMethod.POST })
   public String eventDelete(HttpServletRequest request, Model model, Event event) {
      int event_id = event.getEvent_id();
      productService.eventDelete(event_id);
      model.addAttribute("url", "/admin/event/list");
      model.addAttribute("msg", "삭제 성공");
      return "view/message";
   }
   
   
   @RequestMapping(value = "/admin/member/del", method = { RequestMethod.GET, RequestMethod.POST })
   public String memberDelete(HttpServletRequest request, Model model, @RequestParam int member_id) {
      memberService.delete(member_id);
      model.addAttribute("url", "/admin/member/list");
      model.addAttribute("msg", "삭제 성공");
      return "view/message";
   }

   // 관리자모드 메인 페이지를 요청하면...
   @RequestMapping(value = "/admin", method = RequestMethod.GET)
   public String adminMain(HttpServletRequest request) {
      return "admin/login";
   }

   @RequestMapping(value = "/admin/login", method = RequestMethod.POST)
   public ModelAndView loginCheck(Admin admin, HttpServletRequest request) {
      Admin result = adminService.loginCheck(admin);

      // 로그인 인증을 성공한 사람은, 브라우저를 닫을때까지 데이터를 유지할 수 있는
      // 효과를 부여해줘야 한다...HttpSession 내장객체는 session
      ModelAndView mav = new ModelAndView();
      if (result != null) {
         System.out.println("결과 id : " + result.getId());
         HttpSession session = request.getSession();
         session.setAttribute("admin", result);// 회원 정보 저장!!!
         // 관리자 모드 메인 페이지 보여줌
         mav.setViewName("admin/main");
      } else {
         // 욕 페이지 보여줌
         mav.setViewName("view/error");
         mav.addObject("msg", "로그인 정보가 올바르지 않습니다");
      }

      return mav;
   }
   
   
   @RequestMapping(value="/admin/cs/list", method=RequestMethod.GET)
	public String selectAll(Model model, HttpServletRequest request) {
		List csList = csService.selectAll();
		model.addAttribute("csList", csList);
		model.addAttribute("pager", pager);//이거 넣기!!!
		
		pager.init(csList, request);
		
		return "admin/cs/list";
	}
	
	@RequestMapping(value="/admin/cs/detail", method=RequestMethod.GET)
	public String detail(Model model,@RequestParam int cs_id,HttpServletRequest request) {	
		Cs cs=csService.detail(cs_id);
		model.addAttribute("cs", cs);
		return "admin/cs/detail";
	}

	
	@RequestMapping(value="/admin/cs/regist", method= RequestMethod.GET)
	public String insert(Model model, HttpServletRequest request) {
		return "admin/cs/regist";
	}
	
	@RequestMapping(value="/admin/cs/insert", method=RequestMethod.POST)
	public ModelAndView insert(Cs cs,Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Admin obj = (Admin)session.getAttribute("admin");
		cs.setWriter(obj.getId());
		csService.insert(cs);	
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", "/admin/cs/list");
		mav.addObject("msg", "글 등록 성공");
		mav.setViewName("view/message");
		return mav;
	}
	
	
	@RequestMapping(value="/admin/cs/update", method= RequestMethod.POST)
	public String update(Model model,Cs cs, HttpServletRequest request) {
		csService.update(cs);
		
		model.addAttribute("msg", "수정 성공");
		model.addAttribute("url", "/admin/cs/detail?cs_id="+cs.getCs_id());
		return "view/message";

	}
	
	@RequestMapping(value="/admin/cs/del", method=RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model,@RequestParam int cs_id) {
		csService.delete(cs_id);
		
		model.addAttribute("url", "/admin/cs/list");
		model.addAttribute("msg", "삭제 성공");
		return "view/message";
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