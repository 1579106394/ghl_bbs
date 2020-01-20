package com.bishe.bbs.mapper;

import com.bishe.bbs.pojo.Cart;
import com.bishe.bbs.pojo.CartExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {
    int countByExample(CartExample example);

    int deleteByExample(CartExample example);

    int deleteByPrimaryKey(Long cartId);

    int insert(Cart record);

    int insertSelective(Cart record);

    List<Cart> selectByExampleWithBLOBs(CartExample example);

    List<Cart> selectByExample(CartExample example);

    Cart selectByPrimaryKey(Long cartId);

    int updateByExampleSelective(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByExampleWithBLOBs(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByExample(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKeyWithBLOBs(Cart record);

    int updateByPrimaryKey(Cart record);
}