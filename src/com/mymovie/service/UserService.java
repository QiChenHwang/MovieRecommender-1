package com.mymovie.service;

import java.util.ArrayList;
import java.util.List;

import com.mymovie.bean.User;
import com.mymovie.dao.UserDao;

public class UserService {
	
	public static boolean addUser(User user) {
		int result=0;
		try {
			result = UserDao.addUserDao(user);	
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		if (result > 0) {
			return true;
		}
		return false;
	}
 
	public static List<User> readUser(String userName,int page,String root) {
		List<User> userlist=new ArrayList<User>();
		try {
				if(userName == null) {
					userlist=UserDao.getuserlist(page,root);
				}else {
					userlist = UserDao.getUserByUserName(userName,page,root);
				}
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		return userlist;
	}
	
	public static boolean updateUser(User user) {
		int result=0;
		try {
			result = UserDao.updateUserDao(user);	
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		if (result > 0) {
			return true;
		}
		return false;
	}
 
	public static boolean deleteUser(Integer id) {
		int result=0;
		try {
			result = UserDao.delUserDao(id);	
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		if (result > 0) {
			return true;
		}
		return false;
	}
	public static List<User> findUserById(int userid) {
		List<User> userlist=new ArrayList<User>();
		try {
			userlist = UserDao.getUserByUserId(userid);
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		return userlist;
	}
}
