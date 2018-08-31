package cn.chenxi.bbs.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;

import cn.chenxi.bbs.DBUtils.C3p0Utils;

/**
 * Servlet implementation class PostDelete
 */
public class PostDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("un", request.getParameter("un"));
		String id = request.getParameter("id");
		if(!"".equals(id)) {
			QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
			String sql = "delete from post where id = ?";
			try {
				qRunner.update(sql,id);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.getRequestDispatcher("postMag_Servlet.do?m=init&un="+request.getParameter("un")).forward(request, response);
	}
}
