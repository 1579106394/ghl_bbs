package com.bishe.bbs.controller;

import com.bishe.bbs.pojo.User;
import com.bishe.bbs.service.UserService;
import com.bishe.bbs.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 注册功能
 */
@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @RequestMapping("/register.html")
    public String register(UserVo user, Model model, HttpServletRequest request) {
        //查询数据库，确定用户名或者手机号是否已被注册
        user.setImage(request.getContextPath() + "/photo/moren.jpg");
        User user2 = userService.getUserByUsernameOrMobile(user);
        if (user2 != null) {
            model.addAttribute("error", "该账号或手机号已被注册！建议使用自己的学号作为用户名！");
            return "register";
        }
        userService.addUser(user);
        return "redirect:loginsuccess.jsp";
    }


}
