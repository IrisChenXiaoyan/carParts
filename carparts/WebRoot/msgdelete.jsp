<%@ page contentType="text/html; charset = gb2312" language="java" import="java.sql.*" pageEncoding="gb2312" errorPage="error.jsp"%>


<!DOCTYPE HTML>
<html>
  <head>
    <title>ɾ����Ϣ</title>
  </head>
  
  <body>
  <jsp:useBean id="db" class="bean.DBBean" scope="page"/>
   	<%
   		request.setCharacterEncoding("gb2312");
 
   		String id=request.getParameter("id");
   		
   	 	int i=db.executeUpdate("delete from message where MSGID="+id);
   	 	if(i==1){
   				out.println("<script language='javascript'> alert('ɾ���ɹ�������ȷ�����أ�')</script>");
   				response.setHeader("refresh","1;url=msglist.jsp");
   			}
   			else{
   				out.println("<script language='javascript'> alert('ɾ��ʧ�ܣ�����ȷ�����أ�')</script>");
   				response.setHeader("refresh","1;url=msglist.jsp");
   			}
   		db.close();
   		
   	 %>
  </body>
</html>
