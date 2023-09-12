package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/member")
	public String memeber(Model model) {
		return service.member(model);
	}
	
	@RequestMapping("/member/memberBan")
	public String memberBan(Model model) {
		return service.memberBan(model);
	}
	
	@RequestMapping("/member/detail")
	public String detail(Model model,HttpServletRequest req) {
		return service.detail(model,req);
	}
}
