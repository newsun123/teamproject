package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.BookregiVo;

public interface BookregiService {
	public String list(Model model,BookregiVo bvo,HttpServletRequest request);
	public String write();
	public String write_ok(BookregiVo bvo,HttpServletRequest request);
	public String content(BookregiVo bvo,HttpServletRequest request,Model model);
}