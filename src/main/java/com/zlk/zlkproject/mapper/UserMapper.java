package com.zlk.zlkproject.mapper;

import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 〈功能概述〉<br>
 *
 * @className: UserMapper
 * @package: com.zlk.zlkproject.mapper
 * @author: zhc
 * @date: 2020/8/17 10:41
 */
@Mapper
@Repository
public interface UserMapper {
    /**
     *
     *查询数据库中是否有用户登录数据
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/8/16 22:30
     */
    Integer selectUserLogin(User user);
    /**
     *
     *查询数据库中是否有此用户名
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/8/17 14:57
     */
    Integer selectUserByName(String username);
    /**
     *
     *注册用户
     * @description: * @param null
     * @return:
     * @author: zhc
     * @time: 2020/8/17 11:37
     */
    Integer saveUser(User user);
}
