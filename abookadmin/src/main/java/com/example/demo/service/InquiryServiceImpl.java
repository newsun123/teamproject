package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.InquiryMapper;
import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MtmVo;

@Service
@Qualifier("is")
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryMapper mapper;
	
	@Override
	public String list(HttpServletRequest req, Model model,HttpSession ss) {
		String type=req.getParameter("type");
		String keyword=req.getParameter("keyword");
		String title=req.getParameter("title");
		// 페이지 처리
		int page=1;
		if(req.getParameter("page") ==null)
			page =1;
		else
			page=Integer.parseInt(req.getParameter("page"));
		
		int start=(page -1) * 10;
		
		int pstart = page/10;
		if(page%10 ==0)
			pstart--;
		pstart=pstart*10+1;
		
		int pend=pstart +9;
		
		int chong=mapper.getChong();
		
		if(pend > chong)
			pend=chong;
		// 번호매기기
		mapper.setRownum(start);
			
		if(keyword==null || keyword.length()==0) {
			type="title";
			keyword="";
			model.addAttribute("type","aa");
			model.addAttribute("glist",mapper.list(type,keyword,start));
			model.addAttribute("pstart",pstart);
			model.addAttribute("pend",pend);
			model.addAttribute("page", page);
			model.addAttribute("chong",chong);
		}
		else {
			model.addAttribute("chong", chong);
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("page", page);
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			model.addAttribute("start",start);
		}
		if(type.equals("aa")) // aa와 같을때. type은 필요가없다 다 필요하기 때문에.
		{
			model.addAttribute("ilist",mapper.list2(keyword, start));
		}
		else
			model.addAttribute("ilist",mapper.list(type,keyword,start));		
		return "/inquiry/list";
			
	}

	@Override
	public String content(HttpServletRequest req, Model model) {
		// inquiry no == mtm inno
		int no=Integer.parseInt(req.getParameter("no")); 
		String page=req.getParameter("page");
		
		InquiryVo ivo=mapper.content(no); // 유저 질문 가져오기
		String imsi=ivo.getContent().replace("\r\n", "<br>");
		ivo.setContent(imsi);
		
		// 내 답변 받아오기
		MtmVo mvo = mapper.getAnswer(no);
		
		model.addAttribute("mvo",mvo);
		// mvo 값을 모델로 전해줄려면 mapper 에 select 해줘야한다!
		model.addAttribute("ivo",ivo);
		model.addAttribute("page",page);
		return "/inquiry/content";
	}

	@Override
	public String writeOk(MtmVo mvo,HttpServletRequest req) {
		int inno = Integer.parseInt(req.getParameter("inno"));
		mvo.setInno(inno);
		String page = req.getParameter("page");
		mapper.writeOk(mvo);
		mapper.chgState(mvo);
		return "redirect:/inquiry/content?no="+inno+"&page="+page;
	}

	@Override
	public String updateOK(MtmVo mvo,HttpServletRequest req) {
		String page = req.getParameter("page");
		String inno = Integer.toString(mvo.getInno());
		mapper.updateOk(mvo);
		return "redirect:/inquiry/content?no="+inno;
	}

}
