package cn.chenxi.bbs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.chenxi.bbs.DBUtils.C3p0Utils;
import cn.chenxi.bbs.beans.Users;
/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get md first!
				String method = request.getParameter("md");
				//User want to register!
				if("register".equals(method)) {
					register(request, response);
				}else if("login".equals(method)) {
					try {
						login(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else if("checkAccount".equals(method)) {
					try {
						checkAccount(request, response);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else if("myAccount".equals(method)) {
					try {
						myAccount(request, response);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else if("logout".equals(method)) {
					logout(request, response);
				}else if("changeInfo".equals(method)) {
					try {
						changeInfo(request,response);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else if("changed".equals(method)) {
					try {
						changed(request, response);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
			
			private void changeInfo(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
				String account = request.getParameter("un");
				QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
				String sql = "select * from users where account = ?";
				List<Users> uList = qRunner.query(sql, new BeanListHandler<Users>(Users.class),account);
				request.setAttribute("currUser", uList);
				request.getRequestDispatcher("changeInfo.jsp").forward(request, response);
			}

			/**
			 * Login Request Logic
			 * @param request
			 * @param response
			 * @throws Exception
			 */
			public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
				//get the parameters from the login page
				String account = request.getParameter("account");
				String pwd = request.getParameter("pwd");

				//check if database has this account
				QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
				String sql = "select * from users where account = ? and pwd = ?";
				Users u = qRunner.query(sql, new BeanHandler<Users>(Users.class),account,pwd);
				//if user's account does not exists && account and password don't match
				if(null == u){
					request.setAttribute("message","Sorry! The account and password do not match! Or the account does not exist!");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}else {
					//put user into session pool
					HttpSession session = request.getSession();
					session.setAttribute(account, u);
					//if user's account exists && account and password matches
					session.setAttribute("loginResult", "success");
					session.setAttribute("un", account);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}	
			}
			
			/**
			 * Logout Request Logic
			 * @param request
			 * @param response
			 * @throws IOException 
			 * @throws ServletException 
			 */
			public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String account = request.getParameter("un");
				HttpSession session = request.getSession();
				session.removeAttribute(account);
				session.setAttribute("loginResult", "");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
			/**
			 * Register Request Logic
			 * @param request
			 * @param response
			 * @throws IOException
			 * @throws ServletException
			 */
			public void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
				//get the parameters from the register page
				String account = request.getParameter("account");
				String nickName = request.getParameter("nickName");
				String pwd = request.getParameter("pwd");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String portrait = request.getParameter("head");
				System.out.println(account+nickName+pwd+email+phone+portrait);
				
				//save the data into database
				QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
				String insertSql = "insert into users(account,nickName,pwd,email,phone,portrait) values(?,?,?,?,?,?)";
				try {
					//To see if registered successfully
					int result = qRunner.update(insertSql,account,nickName,pwd,email,phone,portrait);
					//if successful
					if(result == 1) {
						response.sendRedirect("index.jsp");
					}else {
						//if not sucessful
						String errorMsg = "Failed! Please Register Again! Thanks!";
						//put error massage into action scope
						request.setAttribute("errorMsg", errorMsg);
						request.getRequestDispatcher("register.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			/**
			 * to check if the account has already exists
			 * @param request
			 * @param response
			 * @throws SQLException 
			 * @throws IOException 
			 */
			public void checkAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
				String account = request.getParameter("account");
				QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
				String sql = "select * from users where account = ?";
				java.util.List<Users> uList = qRunner.query(sql, new BeanListHandler<Users>(Users.class),account);
				//check if the username has already existed in database
				PrintWriter out = response.getWriter();
				if(null!=uList && uList.size()>0) {
					out.append("false");
				}else {
					out.append("true");
				}
				out.flush();
				out.close();
			}
			
			public void myAccount(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
				String account = request.getParameter("un");
				QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
				String sql = "select * from users where account = ?";
				List<Users> uList = qRunner.query(sql, new BeanListHandler<Users>(Users.class),account);
				request.setAttribute("currUser", uList);
				request.getRequestDispatcher("myAccount.jsp").forward(request, response);
			}
			
			public void changed(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
				String account = request.getParameter("un");
				String nickName = request.getParameter("nickName");
				String pwd = request.getParameter("pwd");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String portrait = request.getParameter("head");
				System.out.println(account+nickName+pwd+email+phone+portrait);
				//save the data into database
				QueryRunner qRunner = new QueryRunner(C3p0Utils.getDataSource());
				String sql = "update users set nickname = ?, pwd = ?, email = ?, phone = ?, portrait = ? where account = ?";
				if(nickName!=null&&!"".equals(nickName)) {
					qRunner.update(sql,nickName,pwd,email,phone,portrait,account);
				}
				myAccount(request, response);

			}

}
