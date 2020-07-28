package com.mymovie.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mymovie.bean.User;
import com.mymovie.service.UserService;

public class UserModification extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String userName  = request.getParameter("username");
		System.out.println(userName);
		List<User> userlist=null;
		int page=0;
		String root="0";
		Integer pageint=Integer.valueOf(page);
		HttpSession session=request.getSession();
		
		userlist=UserService.readUser(userName,pageint,root);
		User user=userlist.get(0);
		
		session.setAttribute("user", user);
		response.sendRedirect("userUpdate.jsp");
	}

}
