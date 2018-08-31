package cn.chenxi.bbs.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.chenxi.bbs.beans.Users;
/**
 * Servlet Filter implementation class SessionFilter
 */
public class SessionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public SessionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//filter the user that has not login, and re-direct to index page
				HttpServletRequest req = (HttpServletRequest) request; 
				HttpSession session = req.getSession();
				String user = req.getParameter("un");
				Users u = (Users) session.getAttribute(user);
				if(null!=u) {
					chain.doFilter(request, response);
				}else {
					req.setAttribute("postRefuse","Sorry! You need to log in!");
					req.getRequestDispatcher("login.jsp").forward(request, response);
				}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
