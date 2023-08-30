package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Mapper
public interface ReserveSeatMapper {
	public TableNameVo tableName(String tname);
	public void reserveSeater(ReserveSeatVo rvo);
	public void updateTableName(String time,String tname);
	public ReserveSeatVo reserveok(String userid);
}
