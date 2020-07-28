package com.mymovie.dao;

import org.apache.mahout.cf.taste.impl.model.jdbc.ConnectionPoolDataSource;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.model.JDBCDataModel;

import com.mymovie.util.JdbcUtil;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class DataDao {

	public static JDBCDataModel myDataModel() {
		JDBCDataModel dataModel = null;
		try {
			ConnectionPoolDataSource connectionPool = new ConnectionPoolDataSource(JdbcUtil.getDataSource());
			dataModel = new MySQLJDBCDataModel(connectionPool, "movie_preferences", "userId", "movieId", "rating");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("建立模型了");
		return dataModel;
	}

}
