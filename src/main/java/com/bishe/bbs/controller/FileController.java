package com.bishe.bbs.controller;

import com.bishe.bbs.pojo.BBSFile;
import com.bishe.bbs.pojo.User;
import com.bishe.bbs.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

//文件相关Controller
@Controller
public class FileController {

    @Autowired
    private FileService fileService;

    @RequestMapping("/file/addFile.html")
    public String addFile(BBSFile file, HttpSession session) {
        User user = (User) session.getAttribute("user");
        file.setUser(user);
        fileService.addFile(file);

        return "redirect:/file.html";
    }

    @RequestMapping("/file/deleteFile{fileId}.html")
    public String deleteFie(@PathVariable Integer fileId) {
        fileService.deleteFileById(fileId);
        return "redirect:/file.html";
    }

    @RequestMapping("/file/download{fileId}.html")
    public void download(@PathVariable Integer fileId, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BBSFile file = fileService.getFileById(fileId);
        // 获取文件名
        String fileName = file.getFileName();
        // 获取文件路径
        String fileUrl = file.getFileUrl();
        // 获取真实文件名
        String fileRealName = file.getFileRealName();

        //模拟文件，myfile.txt为需要下载的文件
        String path = "C:\\BBS\\photo\\" + fileRealName;
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
        //转码，免得文件名中文乱码
        fileName = URLEncoder.encode(fileName,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();

    }

    @RequestMapping("/file/getFileList.action")
    @ResponseBody
    public List<BBSFile> fileList() {
        List<BBSFile> fileList = fileService.getFileList();
        return fileList;
    }

    @RequestMapping("/file/userFileList.html")
    public String userFileList(Model model) {
        List<BBSFile> fileList = fileService.getFileList();
        model.addAttribute("fileList",fileList);
        return "fileList";
    }

}
