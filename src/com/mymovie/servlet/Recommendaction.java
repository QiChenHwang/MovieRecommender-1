package com.mymovie.servlet;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import com.mymovie.bean.User;
import com.mymovie.bean.Movie;
import com.mymovie.dao.MovieDao;
import com.mymovie.service.ItemBasedService;
import com.mymovie.service.SlopeOneService;
import com.mymovie.service.UserBasedService;

public class Recommendaction extends HttpServlet implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		//接收用户id
		System.out.println(user.getUserid());
		
		long userID = user.getUserid();
		//long userID = Long.parseLong(request.getParameter("userID"));
		//接收size
		int size=10;
		//int size = Integer.parseInt(request.getParameter("size"));
		//接收推荐类型参数
		String recommendType = request.getParameter("recommendType");
		MovieDao getMovieInfo = new MovieDao();
		//用户的所有电影
		//ArrayList<Movie> ownMovieInfo = getMovieInfo.getMovieByUserId(userID);
		//推荐电影的List
		List<RecommendedItem> recommendation = null;
		if(recommendType.equals("userBased")){//基于用户
			UserBasedService mubr = new UserBasedService();
			//拿到推荐的电影
			recommendation = mubr.userBasedRecommender(userID,size);
			for(int i=0;i<recommendation.size();i++){
				System.out.println(recommendation.get(i).getItemID());
			}
			//拿到推荐的电影的详细信息
			ArrayList<Movie> recommendMovieInfo = getMovieInfo.getMovieByMovieId(recommendation);
			//页面跳转
			//request.setAttribute("ownMovieInfo", ownMovieInfo);
			session.setAttribute("recommendMovieInfo", recommendMovieInfo);
			request.getRequestDispatcher("recommend.jsp").forward(request, response);
		}
		else if(recommendType.equals("slopeOne")){//基于内容
			long start=System.currentTimeMillis();
			ItemBasedService mibr = new ItemBasedService();
			//拿到推荐的电影
			recommendation = mibr.myItemBasedRecommender(userID,size);
			ArrayList<Movie> recommendMovieInfo = getMovieInfo.getMovieByMovieId(recommendation);
			//页面跳转
			//request.setAttribute("ownMovieInfo", ownMovieInfo);
			session.setAttribute("recommendMovieInfo", recommendMovieInfo);
			request.getRequestDispatcher("moviedetail.jsp").forward(request, response);
			long stop=System.currentTimeMillis();
			System.out.println("推荐时间"+(stop-start));
		}
		
//		else if(recommendType.equals("slopeOne")){//slope one
//			long start=System.currentTimeMillis();
//			SlopeOneService msor = new SlopeOneService();
//			//拿到推荐的电影
//			recommendation = msor.mySlopeOneRecommender(userID,size);	
//			//拿到推荐的电影的详细信息
//			ArrayList<Movie> recommendMovieInfo = getMovieInfo.getMovieByMovieId(recommendation);
//			//页面跳转
//			//request.setAttribute("ownMovieInfo", ownMovieInfo);
//			session.setAttribute("recommendMovieInfo", recommendMovieInfo);
//			request.getRequestDispatcher("moviedetail.jsp").forward(request, response);
//			long stop=System.currentTimeMillis();
//			System.out.println("推荐时间"+(stop-start));
//		}

		
//		//拿到推荐的电影的详细信息
//		ArrayList<Movie> recommendMovieInfo = getMovieInfo.getMovieByMovieId(recommendation);
//		//页面跳转
//		//request.setAttribute("ownMovieInfo", ownMovieInfo);
//		request.setAttribute("recommendMovieInfo", recommendMovieInfo);
//		request.getRequestDispatcher("recommendResult.jsp").forward(request, response);
	}

}
