package com.mymovie.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mymovie.bean.Movie;
import com.mymovie.dao.MovieDao;

public class MovieService {
	public static List<Movie> getdefaulttop(){
		
		List<Movie> topList=new ArrayList<Movie>();
		try {
			topList = MovieDao.getdefaulttop();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return topList;
	}
	public static List<Movie> getmovielist(String type,String order,int page) {
		
		  List<Movie> movielist=new ArrayList<Movie>();
		  try {
			  if(type.equals("0")&&order==null) {
						movielist=MovieDao.getmovielist(page);
				  }else {
		          if(order==null) {
		        	  movielist=MovieDao.getmovielist(type,page);
		        	  System.out.println("来到了type+page");
				  }else {
		             movielist=MovieDao.getmovielist(type, order,page);			
				  }
	          }
		  } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return movielist;
	}
	public static List<Movie> getmovielist(String movieName,int page) {
		  page=page-1;
		  List<Movie> movielist=new ArrayList<Movie>();
		  try {
			  movielist=MovieDao.getMovieByMovieName(movieName,page);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return movielist;
	}
	
	//后台增删改查
	public static boolean addMovie(Movie movie) {
		int result=0;
		try {
			result = MovieDao.addMovieDao(movie);	
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		if (result > 0) {
			return true;
		}
		return false;
	}
 
	public static List<Movie> findMovie(String movieName,int page) {
		List<Movie> movielist=new ArrayList<Movie>();
		try {
			movielist = MovieDao.getMovieByMovieName(movieName,page);
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		return movielist;
	}
	
	public static List<Movie> findMovieById(int movieid) {
		List<Movie> movielist=new ArrayList<Movie>();
		try {
			movielist = MovieDao.getMovieByMovieId(movieid);
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		return movielist;
	}
	
	public static boolean updateMovie(Movie movie) {
		int result=0;
		try {
			result = MovieDao.updateMovieDao(movie);	
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		if (result > 0) {
			return true;
		}
		return false;
	}
 
	public static boolean deleteMovie(Integer movieid) {
		int result=0;
		try {
			result = MovieDao.delMovieDao(movieid);	
		}
		catch (Exception e){
			e.printStackTrace();
		  }
		if (result > 0) {
			return true;
		}
		return false;
	}
}
