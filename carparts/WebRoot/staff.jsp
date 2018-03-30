<%@ page import="java.util.ArrayList" import="java.sql.*" import="bean.DBBean" pageEncoding="GBK"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>汽车零配件物资管理与信息推送系统</title>
     <link type="text/css" href="style.css" rel="stylesheet">
  </head>
  
  <body>
  <h1 style="margin-top:2em;margin-left:auto;margin-right:auto;width:6em">人员管理</h1><br>
 	<table style="margin-left:auto;margin-right:auto;width:100%">
 		<tr><th>序号</th><th>名称</th><th>性别</th><th>年龄</th><th>密码</th><th>权限</th><th>电话</th><th>管理</th></tr>
   		<jsp:useBean id="db" class="bean.DBBean" scope="page"/>
   		<%
   			String sql="select * from staffinfo";
   			ResultSet rs=db.executeQuery(sql);
   			int i=1;
   			while(rs.next())
   			{
   				int id=rs.getInt(1);
   				
   				out.println("<tr><td>"+i+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"
   				+rs.getInt(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getInt(6)+"</td><td>"+rs.getString(7)+"</td><td><a href='staffedit.jsp?id="+id+
   				"'>修改</a>");
   				i++;
   			}
   			rs.close();
   			db.close();
   		 %>
 	</table>
 	<br>
 	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="manager.html">返回主页面</a></p>
  </body>
</html>
