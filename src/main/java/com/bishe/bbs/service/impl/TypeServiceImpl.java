package com.bishe.bbs.service.impl;

import com.bishe.bbs.mapper.TypeMapper;
import com.bishe.bbs.pojo.Type;
import com.bishe.bbs.pojo.TypeExample;
import com.bishe.bbs.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeMapper typeMapper;

    @Override
    public List<Type> getTypeList() {
        TypeExample example = new TypeExample();
        List<Type> list = typeMapper.selectByExample(example);
        return list;
    }

    @Override
    public Type getTypeById(Long typeId) {
        return typeMapper.selectByPrimaryKey(typeId);
    }

    @Override
    public void deleteTypeById(Long typeId) {
        typeMapper.deleteByPrimaryKey(typeId);
    }

    @Override
    public void addType(Type type) {

        typeMapper.insert(type);
        Long typeId = type.getTypeId();
        type.setUrl("cart/cartList.html?typeId="+typeId);
        typeMapper.updateByPrimaryKey(type);
    }

    @Override
    public void editType(Type type) {
        typeMapper.updateByPrimaryKey(type);
    }

}
