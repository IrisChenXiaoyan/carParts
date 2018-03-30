<%@ page import="java.util.ArrayList" import="bean.Message" pageEncoding="GBK"%>

<!DOCTYPE HTML>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>汽车零配件物资管理与信息推送系统</title>
    <link type="text/css" href="style.css" rel="stylesheet">
  </head>
  
  <body>
  <h1 style="margin-top:2em;margin-left:auto;margin-right:auto;width:5em">消息列表</h1><br>
  <p style="margin-left:auto;margin-right:auto;width:6em"><a href="pushlet.html">发送消息</a></p>
  <br>
 	<table  style="margin-left:auto;margin-right:auto;width:100%" >
 		<tr><th>序号</th><th>消息主题</th><th>消息内容</th><th>消息日期</th><th>发送给</th><th>状态</th><th>管理</th></tr>
 		<%
 			ArrayList<Message> list=Message.getMessageList();
 			int i=1;
 			for(Message fi:list){
 				String id =fi.getId();
 		 %>
 		 	<tr>
 		 		<td><%= i%></td>
 		 		<td><%= fi.getMsgsubject() %></td>
 		 		<td><%= fi.getMsgcont() %></td>
 		 		<td><%= fi.getMsgdate() %></td>
 		 		<td><%= fi.getMsgpushto() %></td>
 		 		<td><%= fi.getMsgstate() %></td>
 		 		<td><a href="/carparts/msgdelete.jsp?id=<%=id%>">删除</a></td>
 		 	</tr>
 		 <%
 		 	i++;
 		 	}
 		  %>
 	</table>
 	<br>
 	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="manager.html">返回主页面</a></p>
  </body>
</html>
