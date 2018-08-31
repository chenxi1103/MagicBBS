package cn.chenxi.bbs.servlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.chenxi.bbs.DBUtils.C3p0Utils;
import cn.chenxi.bbs.beans.Post;

/**
 * Servlet implementation class IndexSelect
 */
public class IndexSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodName = request.getParameter("m");
		if("index".equals(methodName)) {
			indexSelect(request, response);
		}
		if("checkPost".equals(methodName)) {
			checkPost(request, response);
		}
		
		if("doSearch".equals(methodName)) {
			try {
				doSearch(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if("allPost".equals(methodName)) {
			allPost(request, response);
		}
	}
	
	private void allPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from post";
		try {
			List<Post> pList = qRunner.query(sql, new BeanListHandler<Post>(Post.class));
			request.setAttribute("cList", pList);
			request.getRequestDispatcher("allPost.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void checkPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from post where id = ?";
		try {
			List<Post> thisPost = qRunner.query(sql, new BeanListHandler<Post>(Post.class),id);
			request.setAttribute("thisPost", thisPost);
			request.getRequestDispatcher("checkPost.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void indexSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String category = request.getParameter("category");
		session.setAttribute("category", category);
		QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from post where postType = ?";
		try {
			List<Post> pList = qRunner.query(sql, new BeanListHandler<Post>(Post.class),category);
			request.setAttribute("cList", pList);
			request.getRequestDispatcher("category.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void doSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");
		String person = request.getParameter("person");
		//search post info by title and person in mysql
		QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
		String sql = "select * from post";
		String condition = "";
		if(null!=title && !"".equals(title)) {
			if("".equals(condition)) {
				condition += " where postTitle like '%"+title+"%'";
			}else {
				condition += " and postTitle like '%"+title+"%'";
			}
		}
		
		if(null!=person && !"".equals(person)) {
			if("".equals(condition)) {
				condition += " where postAuthor like '%"+person+"%'";
			}else {
				condition += " and postAuthor like '%"+person+"%'";
			}
		}
		
		sql = sql+condition;
		java.util.List<Post> pList = qRunner.query(sql, new BeanListHandler<Post>(Post.class));
		request.setAttribute("cList", pList);
		request.getRequestDispatcher("allPost.jsp").forward(request, response);
	}

}
