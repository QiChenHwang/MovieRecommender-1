package com.mymovie.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mymovie.bean.User;
import com.mymovie.service.LoginService;


public class Loginaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userName=request.getParameter("login");
		String username = new String(userName.getBytes("ISO8859-1"), "utf-8");
		String password=request.getParameter("pwd");
		System.out.println("用户名："+username);
		int usersort=Integer.parseInt(request.getParameter("usersort"));
		User user=LoginService.loginService(username, password,usersort);
		HttpSession session=request.getSession();
		//PrintWriter pw = response.getWriter();
		if(user != null) {
			if(user.getUsersort()==1){//
			session.setAttribute("user", user);
			session.setAttribute("msg","管理员登录成功！");
			//request.getRequestDispatcher("movieManage.jsp").forward(request, response);
			response.sendRedirect("MovieManageaction?method=showMovie");	
			}else if(user.getUsersort()==0){
			session.setAttribute("user", user);
			session.setAttribute("msg","用户登录成功！");
			response.sendRedirect("index.jsp");	
			}else {
				response.sendRedirect("index.jsp");
				}
		}else{
			session.setAttribute("msg","登录失败！");
			response.sendRedirect("index.jsp");
		}
		//pw.close();
	};
}
