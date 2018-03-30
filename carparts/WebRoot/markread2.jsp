<%@ page  import="java.sql.*" pageEncoding="gb2312" errorPage="error.jsp"%>


<!DOCTYPE HTML>
<html>
  <head>
    <title>修改完成</title>
  </head>
  
  <body>
  <jsp:useBean id="db" class="bean.DBBean" scope="page"/>
   	<%
   		request.setCharacterEncoding("gb2312");
   	String id=request.getParameter("id");
   		String s="update message set MSGSTATE='1' where MSGID=" +id;
   	 	int i=db.executeUpdate(s);
   	 	if(i==1){
   				out.println("<script language='javascript'> alert('已标记为已读，单击确定跳转到消息中心！')</script>");
   				response.setHeader("refresh","1;url=house2msg.jsp");
   			}
   		db.close();
   	 %>
  </body>
</html>
