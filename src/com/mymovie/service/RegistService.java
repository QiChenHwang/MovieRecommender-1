package com.mymovie.service;

import java.sql.SQLException;

import com.mymovie.dao.UserDao;

public class RegistService {
	public static boolean register(String username,String password,String email,int usersort) {
		boolean flag=false;
		try {
			flag=UserDao.registrdao(username, password, email,usersort);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
		
	}

}
