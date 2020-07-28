package com.mymovie.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.mymovie.bean.User;
import com.mymovie.service.UserService;


public class AdminManageaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		System.out.println(method);
		if ("addUser".equals(method)) {
			addUser(request, response);
		} else if ("showUser".equals(method)) {
			showUser(request, response);
		} else if ("deleteUser".equals(method)){
			deleteUser(request, response);
		}else if("updateUser".equals(method)){
			updUser(request, response);
		}else if("getUserById".equals(method)){
			getUserById(request, response);
		}else {}
	}
	
	private void showUser(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userName  = request.getParameter("username");
		System.out.println("userName="+userName);
		String page = request.getParameter("page");	
		String root=request.getParameter("root");
		List<User> userlist=null;
		
		List<Integer> pagelist=new ArrayList<Integer>();
		if (page == null||page.isEmpty()) {
			page="0";
		}
		if (root == null||root.isEmpty()) {
			root="0";
		}
		Integer pageint=Integer.valueOf(page);
		HttpSession session=request.getSession();
		
		userlist=UserService.readUser(userName,pageint,root);
		if(userName!=null) {
			session.setAttribute("userName", userName);
		}
		//session.removeAttribute("userName");
		if(pageint==100) {
			for(int i=100-5;i<100;i++) {
				pagelist.add(i);
			}
		}else {
	    for(int i=1;i<5;i++) {
	    	pagelist.add(pageint+i);
	    }
	    }
		if(pageint==0) {
		session.setAttribute("prepage", 0);}
		else {
			session.setAttribute("prepage",pageint-1);
		}
		if(pageint!=100) {
			session.setAttribute("lastpage",pageint+1);
			}else {
			session.setAttribute("lastpage",100 );
		}
		session.setAttribute("page", pageint);
		session.setAttribute("pagelist", pagelist);	
		session.setAttribute("userlist", userlist);
		response.sendRedirect("adminManage.jsp");
    }
	
	/*
	 * 添加用户模块
	 */

	private void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//String userId = request.getParameter("userid");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		int usersort = Integer.valueOf(request.getParameter("usersort")) ;

		User addUser = new User(username, password, email,usersort);
		UserService.addUser(addUser);
		
		response.sendRedirect("adminManage.jsp");
	}
	/*
	 * 修改用户
	 */
	private String updUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userid");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		int usersort = Integer.valueOf(request.getParameter("usersort")) ;
		
		//String page = request.getParameter("page");
		int userid=Integer.valueOf(userId);
		
		User updUser = new User(userid,username, password, email,usersort);
		UserService.updateUser(updUser);
		System.out.println("修改成功");
		return "修改成功";
	}
	
	private void getUserById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<User> users = UserService.findUserById(Integer.parseInt(request.getParameter("id")));
		
		String jsonStr = JSON.toJSONString(users);
        PrintWriter writer = response.getWriter();
        writer.write(jsonStr);
	}
	/*
	 * 删除用户
	 */
	private void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.valueOf(request.getParameter("id"));
		UserService.deleteUser(id);
	}
}
