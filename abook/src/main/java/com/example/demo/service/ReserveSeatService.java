package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.TableNameVo;

public interface ReserveSeatService {

	public String reserveseat(HttpSession session,Model model);
	public String rulelibrary();
	public TableNameVo tableName(TableNameVo tvo, HttpServletRequest request,Model model);
	
}
