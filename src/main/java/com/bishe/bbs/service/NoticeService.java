package com.bishe.bbs.service;

import com.bishe.bbs.pojo.Notice;
import com.bishe.bbs.utils.PageBean;

public interface NoticeService {

    //获取通知列表
    PageBean<Notice> getNoticeList(Integer currentPage, Integer currentCount, Long id);

    //标记为已读
    void alreadyReadNotice(Long noticeId);

    //删除通知
    void deleteNotice(Long noticeId);

    // 发布通知
    void addNotice(Notice notice);
}
