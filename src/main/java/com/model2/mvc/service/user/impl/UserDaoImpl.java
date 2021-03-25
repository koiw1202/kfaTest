package com.model2.mvc.service.user.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Page;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public User getUser(String userId)  {
		return sqlSession.selectOne("UserMapper.getUser", userId) ;
	}
	
	public int addUser(User user) {
		return sqlSession.insert("UserMapper.addUser", user) ;
	}
	
	public String checkDuplicate(String userId) {
		
		return sqlSession.selectOne("UserMapper.checkDuplicate", userId) ;
	}

	public List<User> getUserList(Page page) {
		return 	sqlSession.selectList("UserMapper.getUserList", page) ;
	}
	
	public int updateUser(User user) {
		return sqlSession.update("UserMapper.updateUser", user) ;
	}
	
	public Map<String, Object> test(Page page) {
		return sqlSession.selectMap("UserMapper.test", page, "UserList") ;
		
	}
	
	public int deleteUser(String userId) {
		return sqlSession.delete("UserMapper.deleteUser",userId) ;
	}
}







