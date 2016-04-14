package com.cci.oms.login.service;

import java.util.List;

import com.cci.core.feature.orm.page.Page;
import com.cci.core.generic.GenericService;
import com.cci.oms.login.container.User;
import com.cci.oms.login.container.UserExample;

/**
 * 用户 业务 接口
 * 
 * @author fcj
 * 
 **/
public interface UserService extends GenericService<User, User> {

    /**
     * 用户验证
     * 
     * @param user
     * @return
     */
    User authentication(User user);

    /**
     * 根据用户名查询用户
     * 
     * @param username
     * @return
     */
    User selectByUsername(String username);

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
    /**
     *    查询用户名不能重复
     * @param record
     * @return 0 代表用户名没重复,1 代表用户名重复
     */
    int selectIsSameUser(User record);
}
