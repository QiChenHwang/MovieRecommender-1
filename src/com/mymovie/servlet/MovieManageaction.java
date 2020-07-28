package com.mymovie.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.alibaba.fastjson.JSON;
import com.mymovie.bean.Category;
import com.mymovie.bean.Movie;
import com.mymovie.service.MovieService;
import com.mymovie.util.JdbcUtil;


public class MovieManageaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		System.out.println("要执行的电影操作为："+method);
		if ("addMovie".equals(method)) {
			addMovie(request, response);
		} else if ("showMovie".equals(method)) {
			showMovie(request, response);
		} else if ("deleteMovie".equals(method)){
			deleteMovie(request, response);
		}else if("updateMovie".equals(method)){
			updMovie(request, response);
		}else if("getMovieById".equals(method)){
			getMovieById(request, response);
		}else {}
	}
	
	private void showMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String order = null;
		String movieName  = request.getParameter("movieName");
		System.out.println("movieName="+movieName);
		String type  = request.getParameter("categoryId");
		System.out.println("type="+type);
		String page = request.getParameter("page");	
		String sql="select * from category";
		List<Movie> movielist=null;
		
		List<Category> catelist=new ArrayList<Category>();
		List<Integer> pagelist=new ArrayList<Integer>();
		if (page == null||page.isEmpty()) {
			page="1";
		}
		if (type == null||type.isEmpty()) {
			type="0";
		}
		Integer pageint=Integer.valueOf(page);
		HttpSession session=request.getSession();
		
		QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());
		try {
			catelist=qr.query(sql, new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//搜索电影为空，根据显示电影
		if(movieName==null || movieName.isEmpty()) {
			movielist=MovieService.getmovielist(type, order,pageint);
			session.removeAttribute("movieName");
		}else {	
			String movieName1 = new String(movieName.getBytes("ISO8859-1"), "utf-8");
			System.out.println("电影名字"+movieName1);
			movielist=MovieService.getmovielist(movieName1,pageint);
			session.setAttribute("movieName", movieName1);
		}
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
		session.setAttribute("sortType", type);
		System.out.println(type);
		session.setAttribute("categorylist", catelist);
		session.setAttribute("page", pageint);
		session.setAttribute("pagelist", pagelist);	
		session.setAttribute("movielist", movielist);
		response.sendRedirect("movieManage.jsp");
    }
	
	/*
	 * 添加电影模块
	 */

	private void addMovie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//String movieId = request.getParameter("movieid");
		String moviename = request.getParameter("moviename");
		String showyear = request.getParameter("showyear");
		String picture = request.getParameter("picture");
		int numrating = Integer.valueOf(request.getParameter("numrating")) ;
		String director = request.getParameter("director");
		String leadactors = request.getParameter("leadactors");
		double averating = Double.valueOf(request.getParameter("averating")) ;
		String description = request.getParameter("description");
		String categoryId = request.getParameter("categoryId");
		Movie addMovie = new Movie(moviename, showyear, director,leadactors,picture, averating,numrating, description,categoryId);
		MovieService.addMovie(addMovie);

		response.sendRedirect("movieManage.jsp");
	}
	/*
	 * 修改电影
	 */
	private String updMovie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] categorys= {"All","Action", "Adventure", "Anime", "Children", "Comedy", "Crime", "Record", "Drama", "Fantasy", "Black", "Horror", "Music", "Mystery", "Romantic" ," Science Fiction "," Thriller "," War "," Western "," Family "," Other "};
		String movieId = request.getParameter("movieid");
		String moviename = request.getParameter("moviename");
		String showyear = request.getParameter("showyear");
		String picture = request.getParameter("picture");
		int numrating = Integer.valueOf(request.getParameter("numrating")) ;
		String director = request.getParameter("director");
		String leadactors = request.getParameter("leadactors");
		double averating = Double.valueOf(request.getParameter("averating")) ;
		String description = request.getParameter("description");
		String categoryId = request.getParameter("categoryId");
		
		//String page = request.getParameter("page");
		int movieid=Integer.valueOf(movieId);
		/*
		 * if (page == null||page.isEmpty()) { page="1"; }
		 * System.out.println(moviename); System.out.println(page); int
		 * page1=Integer.valueOf(page); List<Movie> movies =
		 * MovieService.getmovielist(moviename,page1); System.out.println(movies);
		 */
		System.out.println(categorys[Integer.valueOf(categoryId)]);
		
		Movie updMovie = new Movie(movieid,moviename, showyear, director,leadactors,picture, averating,numrating, description,categorys[Integer.valueOf(categoryId)]);
		MovieService.updateMovie(updMovie);
		System.out.println("修改成功");
		return "修改成功";
	}
	
	private void getMovieById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("id="+request.getParameter("id"));
		List<Movie> movies = MovieService.findMovieById(Integer.parseInt(request.getParameter("id")));
		System.out.println("movies=="+movies);
		
		String jsonStr = JSON.toJSONString(movies);
        PrintWriter writer = response.getWriter();
        writer.write(jsonStr);
	}
	/*
	 * 删除电影
	 */
	private void deleteMovie(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.valueOf(request.getParameter("id"));
		System.out.println("删除的电影id:"+id);
		MovieService.deleteMovie(id);
	}
}
