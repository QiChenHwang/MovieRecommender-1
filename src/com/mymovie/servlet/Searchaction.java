package com.mymovie.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mymovie.bean.Movie;
import com.mymovie.service.MovieService;


public class Searchaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String movieName=request.getParameter("movieName");
		String page=request.getParameter("page");
		System.out.println("来到了查找电影，page="+page+";moviename="+movieName);
		List<Movie> movielist=null;
		List<Integer> pagelist=new ArrayList<Integer>();
		HttpSession session=request.getSession();
		
		if (page == null||page.isEmpty()) {
			page="1";
		}
		Integer pageint=Integer.valueOf(page);
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
		
		movielist=MovieService.getmovielist(movieName,pageint);
		session.setAttribute("page", pageint);
		session.setAttribute("movieName", movieName);
		session.setAttribute("toplist",movielist);
		response.sendRedirect("index.jsp");	
	};
}
