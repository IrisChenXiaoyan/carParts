package servlets;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import bean.DBBean;

public class LoginController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("GBK");
		String name=request.getParameter("username");
		String pwd=request.getParameter("userpassword");
		if(name!=null&&pwd!=null){
			DBBean jdbc=new DBBean();
			String sql="select * from staffinfo where STAFFNAME='"+name+"'";
   			ResultSet rs=jdbc.executeQuery(sql);
   			HttpSession session = request.getSession(true);
   			try{
   			if(rs.next()){
				if(pwd.equals(rs.getString(5))&&(rs.getInt(6)==1))	{
					session.setAttribute("login", "CatMM");
					response.sendRedirect("manager.html");
					}
				else if(pwd.equals(rs.getString(5))&&(rs.getInt(6)==2)){
					session.setAttribute("login", "CatMM");
					response.sendRedirect("warehouse1.jsp");}
				else if(pwd.equals(rs.getString(5))&&(rs.getInt(6)==3)){
					session.setAttribute("login", "CatMM");
					response.sendRedirect("warehouse2.jsp");}
				else{
					String backNews="密码错误";
					loginFail(request,response,backNews);
				}
   			}else{
				String backNews="用户名不存在";
				loginFail(request,response,backNews);
			}
   				rs.close();}
   			catch(SQLException e){
   				e.printStackTrace();
   			}
			jdbc.close();}
		else{
			}
		}
	
		public void loginFail(HttpServletRequest request,HttpServletResponse response,String backNews){
			response.setContentType("text/html;charset=GBK");
			try{
				PrintWriter out=response.getWriter();
				out.println("<html><body>");
				out.println("<h2>"+backNews+"</h2>");
				out.println("返回");
				out.println("<a href='login.html'>登录页面<a/>");
				out.println("</body></html>");
				
			}catch(IOException exp){}
			
		}
	}
