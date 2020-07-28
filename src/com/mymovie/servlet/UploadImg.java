package com.mymovie.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSON;

@WebServlet("/servlet/UploadImg")
public class UploadImg extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadImg() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * # 服务器的路径，项目运行在tomcat中，因此路径为tomcat服务器路径
		 * # 由于项目部署会讲文件删除，因此下行的代码仅供练习记录
		 * # request.getSession().getServletContext().getRealPath("images/upimgs")
		 * */
		
		/*
		 * # File.separator为分隔符，在linux与Window中表现不一致，因此统一使用该变量
		 * # path为保存的绝对路径
		 * */
		String path= "d:" + File.separator +"imgs";
        DiskFileItemFactory factory=new DiskFileItemFactory();
        ServletFileUpload sfu=new ServletFileUpload(factory);
        sfu.setHeaderEncoding("UTF-8");  //处理中文问题
        sfu.setSizeMax(1024*1024);   //限制文件大小
        
        /*
         * # 新建目录，如果不存在则创建
         * # 为下边的File.write()提供目录
         * */
        File f = new File(path);
        if(!f.exists()) {
        	f.mkdir();
        }
        
        try {
            List<FileItem> fileItems= sfu.parseRequest(request);  //解码请求 得到所有表单元素
            for (FileItem fi : fileItems) {
                //有可能是 文件，也可能是普通文字 
                if (fi.isFormField()) { //这个选项是 文字 
                    System.out.println("表单值为："+fi.getString());
                }else{
                    // 是文件
                	//获取图片后缀名
                    String format=fi.getName().substring(fi.getName().indexOf("."), fi.getName().length());
                    //图片命名，文件名
                    String url = UUID.randomUUID().toString().replaceAll("-", "")+format;
                    // url 是可能是这样的 c:\abc\de\tt\fish.jpg
                    fi.write(new File(path,url));
                    Map result = new HashMap<>();
        			result.put("error", 0);
        			result.put("url", url);
        			String jsonStr = JSON.toJSONString(result);
    		        PrintWriter writer = response.getWriter();
    		        writer.write(jsonStr);
                }                
            }    
            
        } catch (Exception e) {
            e.printStackTrace();
            Map result = new HashMap<>();
			result.put("error", 0);
			result.put("url", "图片上传失败");
			String jsonStr = JSON.toJSONString(result);
	        PrintWriter writer = response.getWriter();
	        writer.write(jsonStr);
        }
        //页面显示上传的文件  
        //request.getRequestDispatcher("toimgs").forward(request, response);
	}
}
