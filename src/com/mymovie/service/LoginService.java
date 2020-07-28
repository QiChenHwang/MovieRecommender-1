package com.mymovie.service;

import java.sql.SQLException;

import com.mymovie.bean.User;
import com.mymovie.dao.UserDao;;


public class LoginService {
	
	public static User loginService(String username,String password,int usersort) {
		User user=null;
        try {
		 user=UserDao.logindao(username, password,usersort);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       return user;
	}

}
