package com.bishe.bbs.mapper;

import com.bishe.bbs.pojo.BBSFile;

import java.util.List;

public interface FileMapper {

    void addFile(BBSFile file);

    List<BBSFile> getFileList();

    void deleteFileById(Integer fileId);

    BBSFile getFileById(Integer fileId);
}