<%@ page import="java.sql.*" pageEncoding="gb2312" errorPage="error.jsp"%>


<!DOCTYPE HTML>
<html>
  <head>
	<title>修改人员信息</title>
  </head>
  
  <body>
  <jsp:useBean id="db" class="bean.DBBean" scope="page"/>
    <%
    	request.setCharacterEncoding("gb2312");
    	
   		
   		String id=request.getParameter("id");
   		
   		ResultSet rs=db.executeQuery("select * from staffinfo where STAFFID="+id);
   		rs.next();
     %>
     <form action="staffupdate.jsp" method="post">
    	<table>
    		<caption>修改人员信息</caption>
    		<tr>
    			<th>名称：</th>
    			<td><input name="staffname" type="text" value="<%= rs.getString(2)%>"></td>
    		</tr>
    		<tr>
    			<th>性别：</th>
    			<td><input name="staffsex" type="text" value="<%= rs.getString(3)%>"></td>
    		</tr>
    		<tr>
    			<th>年龄：</th>
    			<td><input name="staffage" type="text" value="<%= rs.getInt(4)%>"></td>
    		</tr>
    		<tr>
    			<th>密码：</th>
    			<td><input name="staffpassport" type="text" value="<%= rs.getString(5)%>"></td>
    		</tr>
    		<tr>
    			<th>电话：</th>
    			<td><input name="telnum" type="text" value="<%= rs.getString(7)%>"></td>
    		</tr>
    		<tr>
    			<th colspan="2" style="text-align:center">
    			<input type="hidden" name="id" value="<%= id %>">
    			<input type="hidden" name="staffpower" value="<%= rs.getString(6)%>">
    			<input type="submit" name="submit" value="修改">
    			<input type="reset"  value="重置">
    			</th>
    		</tr>
    	</table>
    </form>
    <%
    	rs.close();
   		db.close();
     %>
  </body>
</html>
