package com.cci.oms.login.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cci.core.feature.orm.page.Page;
import com.cci.core.generic.GenericDao;
import com.cci.core.generic.GenericServiceImpl;
import com.cci.oms.login.container.User;
import com.cci.oms.login.container.UserExample;
import com.cci.oms.login.repository.UserMapper;
import com.cci.oms.login.service.UserService;

/**
 * 用户Service实现类
 *
 * @author fcj
 * 
 */
@Service
public class UserServiceImpl extends GenericServiceImpl<User, User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public int insert(User model) {
        return userMapper.insert(model);
    }

    @Override
    public int update(User model) {
        return userMapper.updateByPrimaryKey(model);
    }

    @Override
    public int delete(User model) {
        return userMapper.deleteByPrimaryKey(model);
    }

    @Override
    public User authentication(User user) {
        return userMapper.authentication(user);
    }

    @Override
    public User selectById(User model) {
        return userMapper.selectByPrimaryKey(model);
    }

    @Override
    public GenericDao<User, User> getDao() {
        return userMapper;
    }

    
    @Override
    public User selectByUsername(String username) {
        UserExample example = new UserExample();
        example.createCriteria().andEqualTo("username",username);
        final List<User> list = userMapper.selectByExample(example);
        return list.get(0);
    	
    }

	@Override
	public List<User> selectByExampleAndPage(Page<User> page,
			UserExample example) {
		return userMapper.selectByExampleAndPage(page, example);
		
	}

	@Override
	public int updatePassWord(User record) {
		return userMapper.updatePassWord(record);
	}

	@Override
	public int selectOldPwd(User record) {
		return userMapper.selectOldPwd(record);
	}

	@Override
	public int selectIsSameUser(User record) {
		
		return userMapper.selectIsSameUser(record);
	}

}
