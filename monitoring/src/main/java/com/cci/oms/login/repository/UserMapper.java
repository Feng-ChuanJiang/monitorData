package com.cci.oms.login.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cci.core.feature.orm.page.Page;
import com.cci.core.generic.GenericDao;
import com.cci.oms.login.container.Role;
import com.cci.oms.login.container.User;
import com.cci.oms.login.container.UserExample;

/**
 * 用户Dao接口
 * 
 * @author fcj
 * 
 **/
public interface UserMapper extends GenericDao<User, User> {
    int countByExample(UserExample example);

//    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(User record);

    int insert(User record);

//    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(User record);

//    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

//    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

//    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    /**
     * 用户登录验证查询
     * 
     * @param record
     * @return
     */
    User authentication(@Param("record") User record);

    /**
     * 分页条件查询
     * 
     * @param page
     * @param example
     * @return
     */
    List<User> selectByExampleAndPage(Page<User> page, UserExample example);
    /**
     *   修改密码
     * @param record
     * @return
     */
     int updatePassWord(User record);
    /**
     *   查询用户原密码是否正确
     * @param record
     * @return  0 代表原密码不正确 ,1 代表原密码正确
     */
     int selectOldPwd(User record);
     int selectIsSameUser(User record);
}