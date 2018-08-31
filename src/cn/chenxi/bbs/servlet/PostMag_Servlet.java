package cn.chenxi.bbs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.chenxi.bbs.DBUtils.C3p0Utils;
import cn.chenxi.bbs.beans.Post;

/**
 * Servlet implementation class PostMag_Servlet
 */
public class PostMag_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("un", request.getParameter("un"));
		String methodName = request.getParameter("m");
		if("init".equals(methodName)) {
			initSearch(request,response);
		}
		if("search".equals(methodName)) {
			try {
				doSearch(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if("batchDelete".equals(methodName)) {
			try {
				batchDelete(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if("edit".equals(methodName)){
			try {
				editPost(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if("add".equals(methodName)) {
			try {
				addPost(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	private void addPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String postTitle = request.getParameter("postTitle");
		String postContent =request.getParameter("postContent");
		String postAuthor = request.getParameter("un");
		String postType = request.getParameter("postType");
		
		String sql = "";
		QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
		//if id == null, then user want to write a new post,else, user want to update a post
		int result = 0;
		if(null == id ||"".equals(id)) {
			if(null!=postTitle&&!"".equals(postTitle)) {
			sql = "insert into post(postTitle, postContent, postAuthor, publishTime, postType) values(?,?,?,now(),?)";
			result = qRunner.update(sql,postTitle,postContent,postAuthor,postType);
			}
		}else {
			sql = "update post set postTitle = ?, postContent = ? where id = ?";
			result = qRunner.update(sql,postTitle,postContent,id);
		}
		if(result>0) {
			initSearch(request, response);
		}
	}

	private void batchDelete(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String pIds = request.getParameter("pIds");
		if(!"".equals(pIds)) {
			QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
			String sql = "delete from post where id in ("+pIds+")";
			qRunner.update(sql);
		}
		
		request.getRequestDispatcher("postMag_Servlet.do?m=init&un="+request.getParameter("un")).forward(request, response);

	}

	/**
	 * to query
	 * @param request
	 * @param response
	 */
	private void doSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user = request.getParameter("un");
		String title = request.getParameter("title");
		//search post info by title and person in mysql
		QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "";
		if("admin".equals(user)) {
			sql = "select * from post where postTitle like '%"+title+"%'";
		}else {
			sql = "select * from post where postTitle like '%"+title+"%' and  postAuthor = '"+user+"'";
		}
		java.util.List<Post> pList = qRunner.query(sql, new BeanListHandler<Post>(Post.class));
		request.setAttribute("postList", pList);
		request.getRequestDispatcher("postMag.jsp").forward(request, response);
	}
	
	
	/**
	 * The first time that user visit post manager
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void initSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get all the information of the posts
		String user = request.getParameter("un");
		QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "";
		if("admin".equals(user)) {
			sql = "select * from post";
		}else {
			sql = "select * from post where postAuthor = '"+user+"'";
		}

		try {
			java.util.List<Post> pList = qRunner.query(sql, new BeanListHandler<>(Post.class));
			HttpSession session = request.getSession();
			session.setAttribute("postList", pList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("postMag.jsp").forward(request, response);
		
	}
	
	//edit your post logic
		private void editPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
			//get post information based on id
			String id = request.getParameter("id");
			
			QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
			String sql = "select * from post where id = ?";

			Post post = queryRunner.query(sql, new BeanHandler<Post>(Post.class),id);
			request.setAttribute("p", post);
			request.getRequestDispatcher("post.jsp").forward(request, response);
		}
}
