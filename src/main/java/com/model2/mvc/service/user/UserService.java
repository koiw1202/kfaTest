package com.model2.mvc.service.user;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Page;
import com.model2.mvc.service.domain.User;

public interface UserService {
	
	public User getUser(String userId) throws Exception;

	public int addUser(User user) ;

	public String checkDuplicate(String userId) ;

	public List<User> getUserList(Page page) ;

	public int updateUser(User user) ;

	public Map<String, Object> test(Page page) ; 

	public int deleteUser(String userId) ;
}