<%@ page import="java.util.ArrayList" import="bean.Message" pageEncoding="GBK"%>

<!DOCTYPE HTML>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>������������ʹ�������Ϣ����ϵͳ</title>
    <link type="text/css" href="style.css" rel="stylesheet">
  </head>
  
  <body>
  <h1 style="margin-top:2em;margin-left:auto;margin-right:auto;width:5em">��Ϣ�б�</h1><br>
  <p style="margin-left:auto;margin-right:auto;width:6em"><a href="pushlet.html">������Ϣ</a></p>
  <br>
 	<table  style="margin-left:auto;margin-right:auto;width:100%" >
 		<tr><th>���</th><th>��Ϣ����</th><th>��Ϣ����</th><th>��Ϣ����</th><th>���͸�</th><th>״̬</th><th>����</th></tr>
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
 		 		<td><a href="/carparts/msgdelete.jsp?id=<%=id%>">ɾ��</a></td>
 		 	</tr>
 		 <%
 		 	i++;
 		 	}
 		  %>
 	</table>
 	<br>
 	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="manager.html">������ҳ��</a></p>
  </body>
</html>
