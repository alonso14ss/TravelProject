package com.travel.controller.cs;

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
import org.springframework.web.servlet.ModelAndView;

import com.travel.controller.common.Pager;
import com.travel.domain.Admin;
import com.travel.domain.Cs;
import com.travel.domain.Member;
import com.travel.exception.DMLException;
import com.travel.exception.FileException;
import com.travel.model.cs.CsService;

@Controller
public class CsController {
	
	@Autowired
	private Pager pager;
	
	@Autowired
	private CsService csService;
	
	@RequestMapping(value="/cs/list", method=RequestMethod.GET)
	public String selectAll(Model model, HttpServletRequest request) {
		List csList = csService.selectAll();
		model.addAttribute("csList", csList);
		model.addAttribute("pager", pager);//이거 넣기!!!
		
		pager.init(csList, request);
		
		return "cs/list";
	}
	
	@RequestMapping(value="/cs/detail", method=RequestMethod.GET)
	public String detail(Model model,@RequestParam int cs_id,HttpServletRequest request) {	
		Cs cs=csService.detail(cs_id);
		model.addAttribute("cs", cs);
		return "cs/detail";
	}

	
	@RequestMapping(value="/cs/regist", method= RequestMethod.GET)
	public String insert(Model model, HttpServletRequest request) {
		return "cs/regist";
	}
	
	@RequestMapping(value="/cs/insert", method=RequestMethod.POST)
	public ModelAndView insert(Cs cs,Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member obj = (Member)session.getAttribute("member");
		cs.setWriter(obj.getId());
		csService.insert(cs);	
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", "/cs/list");
		mav.addObject("msg", "글 등록 성공");
		mav.setViewName("view/message");
		return mav;
	}
	
	
	@RequestMapping(value="/cs/update", method= RequestMethod.POST)
	public String update(Model model,Cs cs, HttpServletRequest request) {
		csService.update(cs);
		
		model.addAttribute("msg", "수정 성공");
		model.addAttribute("url", "/cs/detail?cs_id="+cs.getCs_id());
		return "view/message";

	}
	
	@RequestMapping(value="/cs/del", method=RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model,@RequestParam int cs_id) {
		csService.delete(cs_id);
		
		model.addAttribute("url", "/cs/list");
		model.addAttribute("msg", "삭제 성공");
		return "view/message";
	}
	
	@RequestMapping(value= "/cs/reply", method=RequestMethod.POST)
	   public String adminCsLists(HttpServletRequest request, Model model, int cs_id) {
			Cs cs=csService.detail(cs_id);
			model.addAttribute("cs", cs);
			return "admin/cs/reply";
	   }
	   
	   @RequestMapping(value="/cs/reply/regist", method=RequestMethod.POST)
		public ModelAndView reply(Cs cs,Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
			Admin adminObj = (Admin)session.getAttribute("admin");
			cs.setWriter(adminObj.getId());
			csService.reply(cs);	
//			csService.updateRank(cs);
			ModelAndView mav = new ModelAndView();
			mav.addObject("url", "/admin/cs/list");
			mav.addObject("msg", "글 등록 성공");
			mav.setViewName("view/message");
			return mav;
		}
	}








