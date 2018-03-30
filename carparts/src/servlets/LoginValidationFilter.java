package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginValidationFilter implements Filter{
	protected FilterConfig filterConfig;
	
	public void destroy(){
		filterConfig=null;
	}
	
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain)throws IOException,ServletException{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=req.getSession(true);
		String reqURL=req.getServletPath();
		if(!(reqURL.equals("/LoginController")||reqURL.equals("/login.html")||reqURL.equals("/loginError.html"))){
			if(session.getAttribute("login")==null||!session.getAttribute("login").equals("CatMM")){
				resp.sendRedirect("/carparts/loginError.html");
				return;
			}
		}
		chain.doFilter(request, response);
	}
	public void init(FilterConfig filterConfig)throws ServletException{
		this.filterConfig=filterConfig;
	}
}