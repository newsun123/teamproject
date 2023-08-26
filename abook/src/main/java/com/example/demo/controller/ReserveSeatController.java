package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ReserveSeatService;
import com.example.demo.vo.TableNameVo;

@Controller
public class ReserveSeatController {

	@Autowired
	@Qualifier("rs")
	private ReserveSeatService rs;
	
	@RequestMapping("/seat/reserveseat")
	public String reserveseat() {
		return rs.reserveseat();
	}
	
	@RequestMapping("/seat/rulelibrary")
	public String rulelibrary() {
		return rs.rulelibrary();
	}
	
	@RequestMapping("/seat/table")
	public String table(TableNameVo tvo, HttpServletRequest request,Model model) {
		return rs.table(tvo,request,model);
	}
	
	
}
