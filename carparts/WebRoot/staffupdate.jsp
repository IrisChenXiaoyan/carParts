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
   		
    	String staffname=request.getParameter("staffname");
    	String staffsex=request.getParameter("staffsex");
    	String staffage=request.getParameter("staffage");
    	String staffpassport=request.getParameter("staffpassport");
    	String telnum=request.getParameter("telnum");
    	String id=request.getParameter("id");
    	String staffpower=request.getParameter("staffpower");
   		
   		String s="update staffinfo set STAFFNAME='"+staffname+"',STAFFSEX='"+staffsex+"',STAFFAGE='"+staffage+"',STAFFPASSPORT='"+staffpassport+"',STAFFPOWER='"+staffpower+"',TELNUM='"+telnum+"' where STAFFID=" +id;
   	 	int i=db.executeUpdate(s);
   	 	if(i==1){
   				out.println("<script language='javascript'> alert('修改成功，单击确定跳转到人员管理页面！')</script>");
   				response.setHeader("refresh","1;url=staff.jsp");
   			}
   		db.close();
   	 %>
  </body>
</html>
