package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Mapper
public interface ReserveSeatMapper {
public TableNameVo getTableName(String num);
}
