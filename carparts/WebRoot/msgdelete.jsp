<%@ page contentType="text/html; charset = gb2312" language="java" import="java.sql.*" pageEncoding="gb2312" errorPage="error.jsp"%>


<!DOCTYPE HTML>
<html>
  <head>
    <title>删除消息</title>
  </head>
  
  <body>
  <jsp:useBean id="db" class="bean.DBBean" scope="page"/>
   	<%
   		request.setCharacterEncoding("gb2312");
 
   		String id=request.getParameter("id");
   		
   	 	int i=db.executeUpdate("delete from message where MSGID="+id);
   	 	if(i==1){
   				out.println("<script language='javascript'> alert('删除成功，单击确定返回！')</script>");
   				response.setHeader("refresh","1;url=msglist.jsp");
   			}
   			else{
   				out.println("<script language='javascript'> alert('删除失败，单击确定返回！')</script>");
   				response.setHeader("refresh","1;url=msglist.jsp");
   			}
   		db.close();
   		
   	 %>
  </body>
</html>
