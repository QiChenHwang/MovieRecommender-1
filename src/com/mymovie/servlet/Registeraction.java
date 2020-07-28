package com.mymovie.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mymovie.service.RegistService;


public class Registeraction extends HttpServlet {
	private static final long serialVersionUID = 1L;
   @Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("login");
		String password = request.getParameter("pwd");
		String email = request.getParameter("code");
		int usersort=0;
		
		boolean registerflag=RegistService.register(username, password, email,usersort);
		if(registerflag==true) {
			request.setAttribute("msg","用户注册成功，请登录");
			response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("msg","用户注册失败");
			response.sendRedirect("index.jsp");
		}
		
		
}
	
	
    
}
