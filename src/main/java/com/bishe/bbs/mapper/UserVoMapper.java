package com.bishe.bbs.mapper;

import com.bishe.bbs.pojo.User;
import com.bishe.bbs.vo.UserVo;

public interface UserVoMapper {

    UserVo selectUserByUsernameOrMobile(User user);

    void addUser(User user);

    UserVo selectUserById(Long userId);

}