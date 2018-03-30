package servlets;

import java.io.*;
import java.sql.Date;

import javax.servlet.*;
import javax.servlet.http.*;

import nl.justobjects.pushlet.core.Dispatcher;
import nl.justobjects.pushlet.core.Event;
import bean.DBBean;

public class PushletServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		
			Event event = Event.createDataEvent("/push3");  
			
			String msgsubject="管理员消息："+request.getParameter("msgsubject");
			String msgcont=request.getParameter("msgcont");
			java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
			Date msgdate=currentDate;
			int msgpushto=3;
			int msgstate=0;
			if(msgcont!=null&&msgsubject!=null){
				String sql="insert into message(MSGSUBJECT,MSGCONTENT,MSGPUSHTO,MSGSTATE,MSGDATE) values('"+msgsubject+"','"+msgcont+"','"+msgpushto+"','"+msgstate+"','"+msgdate+"')";
				DBBean jdbc=new DBBean();
	   			int rs=jdbc.executeUpdate(sql);
	   			if(rs==1){
		   				try {  
		   					msgcont=new String(msgcont.getBytes("UTF-8"),"ISO-8859-1");  
		   		        } catch (UnsupportedEncodingException e) {  
		   		            e.printStackTrace();  
		   		        }  
	   		        event.setField("message", msgcont);  
	   		        Dispatcher.getInstance().multicast(event);//消息的推送有单播，组播，广播三种方式，对应不同的api调用
	   		        response.sendRedirect("msglist.jsp");
	   				}
				jdbc.close();
			}	
		}
			
			}
