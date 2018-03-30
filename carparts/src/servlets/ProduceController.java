package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;


import bean.CarPartsInfo;
import bean.DBBean;


public class ProduceController extends HttpServlet {

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
		
		String actionUrl=request.getServletPath();
		if(actionUrl.equals("/list.do")){
			ArrayList<CarPartsInfo> list=CarPartsInfo.getCarPartsList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/list.jsp").forward(request, response);
		}else if(actionUrl.equals("/add.do")){
			String partsname=request.getParameter("partsname");
    		String  partsnum=request.getParameter("partsnum");
    		 int a = Integer.parseInt(partsnum);
    		String partsunit=request.getParameter("partsunit");
    		String putawaydate=request.getParameter("putawaydate");
    		String partsprice=request.getParameter("partsprice");
    		float weight=Float.parseFloat(partsprice);
    		String manufactuper=request.getParameter("manufactuper");
    		String productiondate=request.getParameter("productiondate");
    		String location=request.getParameter("location");
   			int r=CarPartsInfo.addPart(partsname,a,partsunit,putawaydate,weight,manufactuper,productiondate,location);

   			if(r==1){
   				if(location.equals("仓库一")){  
   					
   					String msgsubject="系统消息：新零配件入库";
   					String msgcont=partsname;
   					  
   					java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
   					Date msgdate=currentDate;
   					int msgpushto=2;
   					int msgstate=0;
   					if(msgcont!=null&&msgsubject!=null){
   						String sql="insert into message(MSGSUBJECT,MSGCONTENT,MSGPUSHTO,MSGSTATE,MSGDATE) values('"+msgsubject+"','"+msgcont+"','"+msgpushto+"','"+msgstate+"','"+msgdate+"')";
   						DBBean jdbc=new DBBean();
   			   			jdbc.executeUpdate(sql);
   						jdbc.close();
   					}	
   		   			}else if(location.equals("仓库二")){ 
   		 			
   		 			String msgsubject="系统消息：新零配件入库";
   		 			String msgcont=partsname;
   		 			  
   		 			java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
   		 			Date msgdate=currentDate;
   		 			int msgpushto=3;
   		 			int msgstate=0;
   		 			if(msgcont!=null&&msgsubject!=null){
   		 				String sql="insert into message(MSGSUBJECT,MSGCONTENT,MSGPUSHTO,MSGSTATE,MSGDATE) values('"+msgsubject+"','"+msgcont+"','"+msgpushto+"','"+msgstate+"','"+msgdate+"')";
   		 				DBBean jdbc=new DBBean();
   		 	   			jdbc.executeUpdate(sql);
   		 	   			
   		 				jdbc.close();
   		 			}	
   		   			}
   				request.getRequestDispatcher("/success.html").forward(request, response);}
   			else
   				request.getRequestDispatcher("/failure.html").forward(request, response);
   			
   			
		}else if(actionUrl.equals("/edit.do")){
			String id=request.getParameter("id");
			CarPartsInfo fi=CarPartsInfo.getPartById(id);
			request.setAttribute("fi", fi);
			request.getRequestDispatcher("/edit.jsp").forward(request, response);
		}else if(actionUrl.equals("/update.do")){
			String id=request.getParameter("id");
			String partsname=request.getParameter("partsname");
			String  partsnum=request.getParameter("partsnum");
   		 	int a = Integer.parseInt(partsnum);
   		 	String partsprice=request.getParameter("partsprice");
   		 	float weight=Float.parseFloat(partsprice);
   		 	String location=request.getParameter("location");
   			int r=CarPartsInfo.updatePart(id,partsname,a,weight,location);
   			if(r==1){
                   if(location.equals("仓库一")){  
                  
   					String msgsubject="系统消息：零配件变动";
   					String msgcont=partsname;
   					  
   					java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
   					Date msgdate=currentDate;
   					int msgpushto=2;
   					int msgstate=0;
   					if(msgcont!=null&&msgsubject!=null){
   						String sql="insert into message(MSGSUBJECT,MSGCONTENT,MSGPUSHTO,MSGSTATE,MSGDATE) values('"+msgsubject+"','"+msgcont+"','"+msgpushto+"','"+msgstate+"','"+msgdate+"')";
   						DBBean jdbc=new DBBean();
   						jdbc.executeUpdate(sql);
   						jdbc.close();
   					}	
   		   			}else if(location.equals("仓库二")){ 
   		 			
   		 			String msgsubject="系统消息：零配件变动";
   		 			String msgcont=partsname;
   		 			  
   		 			java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
   		 			Date msgdate=currentDate;
   		 			int msgpushto=3;
   		 			int msgstate=0;
   		 			if(msgcont!=null&&msgsubject!=null){
   		 				String sql="insert into message(MSGSUBJECT,MSGCONTENT,MSGPUSHTO,MSGSTATE,MSGDATE) values('"+msgsubject+"','"+msgcont+"','"+msgpushto+"','"+msgstate+"','"+msgdate+"')";
   		 				DBBean jdbc=new DBBean();
   		 	   			jdbc.executeUpdate(sql);
   		 	   			
   		 				jdbc.close();
   		 			}	}
   				request.getRequestDispatcher("/success.html").forward(request, response);}
   			else
   				request.getRequestDispatcher("/failure.html").forward(request, response);
		}else if(actionUrl.equals("/delete.do")){
			String id=request.getParameter("id");
			int r=CarPartsInfo.deletePart(id);
			if(r==1)
   				request.getRequestDispatcher("/success.html").forward(request, response);
   			else
   				request.getRequestDispatcher("/failure.html").forward(request, response);
		}
	}

	
}
