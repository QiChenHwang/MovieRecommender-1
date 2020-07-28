package com.mymovie.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import com.mymovie.bean.Movie;
import com.mymovie.util.JdbcUtil;


public class MovieDao {
	public static List<Movie> getdefaulttop() throws SQLException{
		List<Movie> topList=new ArrayList<Movie>();
		String sql="select movie.movieid,movie.moviename,\n" + 
				"movie.showyear,movie.nation,movie.director,\n" + 
				"movie.leadactors,movie.screenwriter,movie.picture,\n" + 
				"movie.averating,movie.numrating,movie.description,\n" + 
				"movie.typelist,movie.backpost from mymovie.movie,mymovie.topdefaultmovies where mymovie.movie.movieid=mymovie.topdefaultmovies.movieid;";
		QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());
		topList = qr.query(sql, new BeanListHandler<Movie>(Movie.class));
		return topList;	
	}
	
	
	public static List<Movie> getmovielist(int page) throws SQLException{
		int ideax=page*36;
		List<Movie> movielist=new ArrayList<Movie>();
		String sql="select *from movie order by averating desc limit ?,36";
	    QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());  
	    movielist=qr.query(sql, new BeanListHandler<Movie>(Movie.class),ideax);
	    return movielist;
	}
	public static List<Movie> getmovielist(String type,int page) throws SQLException{
		int ideax=page*36;
		List<Movie> movielist=new ArrayList<Movie>();
		String sql="select movie.movieid,movie.moviename,\n" + 
				"movie.showyear,movie.nation,movie.director,\n" + 
				"movie.leadactors,movie.screenwriter,movie.picture,\n" + 
				"movie.averating,movie.numrating,movie.description,\n" + 
				"movie.typelist,movie.backpost from movie,moviecategory "
				+ "where movie.movieid=moviecategory.movieid and moviecategory.categoryid=? order by averating desc limit ?,36";
	    QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());  
	    movielist=qr.query(sql, new BeanListHandler<Movie>(Movie.class),type,ideax);
	    return movielist;
	}
	
    public static List<Movie> getmovielist(String type,String order,int page) throws SQLException{
    	int ideax=page*36;
    	List<Movie> movielist=new ArrayList<Movie>();
    	String sql;
    	if(type.equals("0")) {
    		if(order.equals("showyear")) {
    		sql="select movie.movieid,movie.moviename,movie.showyear,movie.nation,movie.director,movie.leadactors,movie.screenwriter,movie.picture,movie.averating,movie.numrating,movie.description,movie.typelist,movie.backpost from movie,moviecategory where movie.movieid=moviecategory.movieid  order by showyear desc limit ?,36";
    		}
    		else {
    			sql="select movie.movieid,movie.moviename,movie.showyear,movie.nation,movie.director,movie.leadactors,movie.screenwriter,movie.picture,movie.averating,movie.numrating,movie.description,movie.typelist,movie.backpost from movie,moviecategory where movie.movieid=moviecategory.movieid order by averating desc limit ?,36";	
			}
    		QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());  
    	    movielist=qr.query(sql, new BeanListHandler<Movie>(Movie.class),ideax);
    	}
    	else{
    		if(order.equals("showyear")) {
    		sql="select movie.movieid,movie.moviename,movie.showyear,movie.nation,movie.director,movie.leadactors,movie.screenwriter,movie.picture,movie.averating,movie.numrating,movie.description,movie.typelist,movie.backpost from movie,moviecategory where movie.movieid=moviecategory.movieid and moviecategory.categoryid=? order by showyear desc limit ?,36";
    		}
    		else {
    			sql="select movie.movieid,movie.moviename,movie.showyear,movie.nation,movie.director,movie.leadactors,movie.screenwriter,movie.picture,movie.averating,movie.numrating,movie.description,movie.typelist,movie.backpost from movie,moviecategory where movie.movieid=moviecategory.movieid and moviecategory.categoryid=? order by averating desc limit ?,36";
    			
    		}
    		QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());  
    	    movielist=qr.query(sql, new BeanListHandler<Movie>(Movie.class),type,ideax);
    	}
	    
	    return movielist;
	}
    //根据电影ID获取电影信息
	public static List<Movie> getMovieByMovieId(int movieid) throws SQLException{
		List<Movie> movielist=new ArrayList<Movie>();
		Movie movie=null;
	    String sql="select * from movie where movieid=?";
	    QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource()); 
	    movie=qr.query(sql, new BeanHandler<Movie>(Movie.class),movieid);
	    movielist.add(movie);            
		return movielist;		
	}
	//根据电影名字获取电影信息
	public static List<Movie> getMovieByMovieName(String moviename,int page) throws SQLException{
		int ideax=page*36;
		List<Movie> movielist=new ArrayList<Movie>();
	    String sql="select * from movie where moviename like concat('%',?,'%') limit ?,36" ;
	    QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());  
	    movielist=qr.query(sql, new BeanListHandler<Movie>(Movie.class),moviename,ideax);
		return movielist;		
	}
	
	//根据推荐的movie的ID，获得movie的详细信息
	public ArrayList<Movie> getMovieByMovieId(List<RecommendedItem> recommendations){
		ArrayList<Movie> movielist = new ArrayList<Movie>();
		try {
			String sql = "";
			QueryRunner qr=new QueryRunner(JdbcUtil.getDataSource());
			for(int i=0;i<recommendations.size();i++){
				Movie movie=null;
				sql = "select * from movie where movieid=?";
				movie=qr.query(sql, new BeanHandler<Movie>(Movie.class),recommendations.get(i).getItemID());
				movielist.add(movie);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return movielist;
	}
    
	public static boolean commentdao(int userid,int movieid,double star) throws SQLException {
		int commentflag=0;
		//String sql="insert into review (userid,movieid,content,star,reviewtime) values(?,?,?,?,?)";
		
		//增加评分的精确度
		Random rand =new Random();
		double a=rand.nextDouble();
		star=star+a;
		String sql="insert into movie_preferences (userId,movieId,rating) values(?,?,?)";
		QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
		//commentflag=qr.update(sql,userid,movieid,content,star,reviewtime);
		commentflag=qr.update(sql,userid,movieid,star);
		if(commentflag==0) return false;
        else {
			return true;
		}		
	}
	
	/*
	 * 以下为电影管理模块数据库处理
	 */
	//添加电影
	public static int addMovieDao(Movie movie) throws SQLException{
		//创建queryrunner对象
		QueryRunner qr = new QueryRunner();
		String sql = "INSERT INTO movie (moviename,showyear,director,leadactors,picture,averating,numrating,description,typelist)"
				+ "VALUES(?,?,?,?,?,?,?,?,?)";
		//创建object数组
		Object[] params = {movie.getMoviename(),movie.getShowyear(),movie.getDirector(),movie.getLeadactors(),movie.getPicture(),movie.getAverating(),movie.getNumrating(),movie.getDescription(),movie.getTypelist()};
		//执行queryrunner的插入方法
		int row = qr.update(JdbcUtil.getConn(), sql, params);
		return row;
	}
	//修改电影
	public static int updateMovieDao(Movie movie) throws SQLException {
		//创建queryrunner对象
		QueryRunner queryRunner = new QueryRunner();
		String sql = "UPDATE movie SET moviename=?,showyear=?,director=?,leadactors=?,picture=?,averating=?,"
				+ "numrating=?,description=?,typelist=? WHERE movieid=?";
		//创建object数组
		Object[] params = {movie.getMoviename(),movie.getShowyear(),movie.getDirector(),movie.getLeadactors(),movie.getPicture(),movie.getAverating(),movie.getNumrating(),movie.getDescription(),movie.getTypelist(),movie.getMovieid()};
		int row = queryRunner.update(JdbcUtil.getConn(), sql, params);
		return row;
	}
	//删除电影
	public static int delMovieDao(int movieid) throws SQLException {
		//创建queryrunner对象
		QueryRunner queryRunner = new QueryRunner();
		String sql = "delete from movie where movieid = ?";
		int row = queryRunner.update(JdbcUtil.getConn(), sql, movieid);
		return row;
	}
}
