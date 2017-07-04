package com.neusoft.mapper;

import com.neusoft.model.BlogUser;

import java.util.List;

/**
 * Created by Administrator on 2017/7/4.
 */
public interface BlogUserMapper {
    int regUser(BlogUser blogUser);
    List<BlogUser> loginUser(BlogUser blogUser);
    List<BlogUser> getAllUser();
}
