package com.zlk.zlkproject.service;

import com.zlk.zlkproject.entity.User;

import java.util.List;

/**
 * 〈功能概述〉<br>
 *
 * @className: UserService
 * @package: com.zlk.zlkproject.service
 * @author: zhc
 * @date: 2020/8/17 10:27
 */
public interface UserService {
    /**
     *
     *查询数据库中是否有用户登录数据
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/8/17 10:36
     */
    Integer selectUserLogin(User user);
    /**
     *
     *查询数据库中是否有此用户名
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/8/17 14:55
     */
    Integer selectUserByName(String username);
    /**
     *
     *注册用户
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/8/17 11:34
     */
    Integer saveUser(User user);

}
