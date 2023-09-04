package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookregiVo;

@Mapper
public interface BreserveMapper {
	public ArrayList<BookregiVo> list(BookregiVo bvo,@Param("start") int start);
	public int getChong();
	public ArrayList<HashMap> content(String bcode);
	public void bresOk(String userid,String bcode);
	public void bresUpdate(String bcode);
}
