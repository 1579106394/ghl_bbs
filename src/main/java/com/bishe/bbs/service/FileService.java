package com.bishe.bbs.service;

import com.bishe.bbs.pojo.BBSFile;

import java.util.List;

public interface FileService {

    void addFile(BBSFile file);

    List<BBSFile> getFileList();

    void deleteFileById(Integer fileId);

    BBSFile getFileById(Integer fileId);
}
