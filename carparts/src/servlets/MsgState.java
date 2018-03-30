package servlets;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import bean.Message;

public class MsgState extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
	
		int num=Message.getHaveRead1();
		 String s = Integer.toString(num);
		response.setContentType("text/html");
		response.setCharacterEncoding("GBK");
		response.getWriter().write(s); }
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	
}	