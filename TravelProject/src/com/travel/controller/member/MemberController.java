package com.travel.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.travel.domain.Cs;
import com.travel.domain.Member;
import com.travel.domain.OrderSummary;
import com.travel.exception.DMLException;
import com.travel.exception.DataNotFoundException;
import com.travel.exception.FileException;
import com.travel.model.member.MemberService;
import com.travel.model.order.OrderService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/member/regist", method=RequestMethod.POST)
	public String regist(Model model, Member member,HttpServletRequest request) {
		System.out.println(member.getId());
		if(memberService.idCheck(member).equals("1")) {
			model.addAttribute("msg", "중복된 아이디 입니다.");
			model.addAttribute("url", "/");
			return "view/message";
		}
		memberService.insert(member);
		model.addAttribute("msg", "회원가입을 축하드립니다!");
		model.addAttribute("url", "/");
		return "view/message";
		
		
	}

	@RequestMapping(value="/member/login", method = {RequestMethod.GET, RequestMethod.POST}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String loginCheck(Member member, HttpServletRequest request,Model model) {
		
		Member obj=memberService.loginCheck(member);
		
	      if (obj != null) {
	         System.out.println("결과 id : " + obj.getId());
	         HttpSession session = request.getSession();
	         session.setAttribute("member", obj);// 회원 정보 저장!!!
	         // 관리자 모드 메인 페이지 보여줌
	         model.addAttribute("msg", "로그인 되었습니다.");
	 		 model.addAttribute("url", "/");
	      } else {
	         // 욕 페이지 보여줌
	    	  model.addAttribute("msg", "로그인에 실패하였습니다");
	  			model.addAttribute("url", "/");
	      }
	      return "view/message";
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(Model model ,HttpServletRequest request){
		//세션을 소멸시켜 버린다!!
		HttpSession session = request.getSession();
		session.invalidate();//현재 클라이언트와 관련된 세션을 무효화시킴!
		//주의 객체를 소멸하는건 아니다..자바에서는 객체를 죽일수는 없으니깐..
		model.addAttribute("msg", "로그아웃 처리되었습니다");
		model.addAttribute("url", "/");
		
		return "view/message";
	}
	
	
	//마이페이지 요청 처리
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String getMyPage(Model model,HttpServletRequest request) {
		//회원정보 MemberService 
		HttpSession session = request.getSession();
		Member member=(Member)session.getAttribute("member");
		model.addAttribute("member", member);
		
		//결제내역 OrderService
		List orderList=orderService.selectAllByMember(member);
		model.addAttribute("orderList", orderList);
		
		//상담내역 BoardService
		
		return "myPage";
	}
	
	@RequestMapping(value="/member/edit", method= RequestMethod.POST)
	public String update(Model model,Member member, HttpServletRequest request) {
		memberService.update(member);
		
		model.addAttribute("msg", "수정 성공");
		model.addAttribute("url", "/");
		return "view/message";

	}
	
	/*
	 * @RequestMapping(value = "/myPage", method = RequestMethod.GET) public String
	 * myPage(Model model, HttpServletRequest request,Member member) {
	 * orderService.selectAllByMember(member); return "myPage"; }
	 */
	
	
	
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










