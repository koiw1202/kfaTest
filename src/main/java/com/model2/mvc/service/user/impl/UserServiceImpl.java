package com.model2.mvc.service.user.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Page;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserDao;
import com.model2.mvc.service.user.UserService;;


//==> ȸ������ ���� ����
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
//	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public User getUser(String userId) throws Exception {
		User user= userDao.getUser(userId);
		
		return user ;
	}
	
	public int addUser(User user) {
		return userDao.addUser(user) ;
	}

	public String checkDuplicate(String userId) {
		return userDao.checkDuplicate(userId) ;
	}
	
	public List<User> getUserList(Page page) {
		return userDao.getUserList(page) ;
	}
	
	public int updateUser(User user) {
		return userDao.updateUser(user) ;
	}
	
	public Map<String, Object> test(Page page) {
		return userDao.test(page) ;
	}
	
	public int deleteUser(String userId) {
		return userDao.deleteUser(userId) ;
	}
}

