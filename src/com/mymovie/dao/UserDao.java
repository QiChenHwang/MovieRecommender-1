package com.mymovie.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mymovie.bean.User;
import com.mymovie.util.JdbcUtil;

public class UserDao {
	
	public static User logindao(String username,String password,int usersort) throws SQLException{
		User user=null;
		String sql="select *from user where username=? and password=? and usersort=?";
		QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());
		user = qr.query(sql, new BeanHandler<User>(User.class),username,password,usersort);		
        return user;		
	}
	
	public static boolean registrdao(String username,String password,String email,int usersort) throws SQLException {
		int registflag=0;
		String sql="insert into mymovie.user (username,password,email,usersort) values(?,?,?,?)";
		QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
		registflag=qr.update(sql,username,password,email,usersort);
		if(registflag==0) return false;
        else {
			return true;
		}		
	}
	//根据用户名查询用户
	public static List<User> getUserByUserName(String username,int page,String root) throws SQLException{
		int ideax=page*36;
		System.out.println("root为"+root);
		List<User> userlist=new ArrayList<User>();
		String sql="";
		if("1".equals(root)) {
			sql="select * from user where username like CONCAT('%', ?,'%') and usersort=1 limit ?,36";
		}else if("0".equals(root)) {
			sql="select * from user where username like CONCAT('%', ?,'%') and usersort=0 limit ?,36";
		}
		else {
			System.out.println("root获取失败");
		}
	    QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());  
	    userlist=qr.query(sql, new BeanListHandler<User>(User.class),username,ideax);
		return userlist;		
	}
	
	//根据id查用户
	public static List<User> getUserByUserId(int userid) throws SQLException{
		List<User> userlist=new ArrayList<User>();
		User user=null;
	    String sql="select * from user where userid=?";
	    QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource()); 
	    user=qr.query(sql, new BeanHandler<User>(User.class),userid);
	    userlist.add(user);            
		return userlist;		
	}
	
	//添加用户
	public static int addUserDao(User user) throws SQLException {
		int registflag=0;
		String sql="insert into mymovie.user (username,password,email,usersort) values(?,?,?,?)";
		QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
		registflag=qr.update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getUsersort());
		return registflag;
	}
	
	//修改用户
	public static int updateUserDao(User user) throws SQLException {
		int registflag=0;
		String sql="UPDATE user SET username=?,password=?,email=?,usersort=? where userid=?";
		QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
		registflag=qr.update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getUsersort(),user.getUserid());
		return registflag;
	}
	//删除用户
	public static int delUserDao(int userid) throws SQLException {
		int registflag=0;
		String sql="delete from user where userid=?";
		QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
		registflag=qr.update(sql,userid);
		return registflag;
	}
	//分页
	public static List<User> getuserlist(int page,String root) throws SQLException{
		int ideax=page*36;
		List<User> userlist=new ArrayList<User>();
		String sql="";
		if("1".equals(root)) {
			sql="select *from user where usersort=1 order by userid asc limit ?,36";
		}else if("0".equals(root)) {
			sql="select *from user where usersort=0 order by userid asc limit ?,36";
		}else {
			System.out.println("root获取失败");
		}
	    QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());  
	    userlist=qr.query(sql, new BeanListHandler<User>(User.class),ideax);
	    System.out.println("page的列表"+userlist);
	    return userlist;
	}
}
