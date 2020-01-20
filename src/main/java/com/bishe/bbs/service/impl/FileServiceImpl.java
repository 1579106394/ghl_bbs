package com.bishe.bbs.service.impl;

import com.bishe.bbs.mapper.FileMapper;
import com.bishe.bbs.pojo.BBSFile;
import com.bishe.bbs.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FileServiceImpl implements FileService {

    @Autowired
    private FileMapper fileMapper;

    @Override
    public void addFile(BBSFile file) {
        fileMapper.addFile(file);
    }

    @Override
    public List<BBSFile> getFileList() {
        return fileMapper.getFileList();
    }

    @Override
    public void deleteFileById(Integer fileId) {
        fileMapper.deleteFileById(fileId);
    }

    @Override
    public BBSFile getFileById(Integer fileId) {
        return fileMapper.getFileById(fileId);
    }
}
