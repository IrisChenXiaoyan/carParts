<%@ page  import="java.util.ArrayList" import="bean.Message" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="content-type" content="text/html; charset=GBK">
	<title>�ֿ�һ��Ϣ����</title>
 	<link type="text/css" href="style.css" rel="stylesheet">
	<script type="text/javascript" src="ajax-pushlet-client.js"></script>
	<script src="jquery-1.2.6.pack.js"></script>
	<script src="jquery.messager.js"></script>
</head>
<body>
	<script type="text/javascript">
		PL._init();
        PL.joinListen("/push2");//������������¼������������������¼�����ôonData()�����ᱻ����
	
		function onData(event){
			$.messager.lays(300, 200);
			$.messager.show('<font color=red>����Ϣ</font>', '<font color=green style="font-size:14px;font-weight:bold;">'+event.get("message")+'<br>���<a href="house1msg.jsp">�鿴</a></font>',0);
		}	
		
	</script>
	 <h2  style="margin-top:2em;margin-left:auto;margin-right:auto;width:5em">δ����Ϣ</h2><br>
	 <table  style="margin-left:auto;margin-right:auto;width:100%" >
 		<tr><th>���</th><th>��Ϣ����</th><th>��Ϣ����</th><th>��Ϣ����</th><th>����</th></tr>
 		<%
 			ArrayList<Message> list0=Message.getWarehouseMessageList(2);
 			int i=1;
 			for(Message fi:list0){
 				if(fi.getMsgstate().equals("0")){
 				String id =fi.getId();
 		 %>
 		 	<tr>
 		 		<td><%= i%></td>
 		 		<td><%= fi.getMsgsubject() %></td>
 		 		<td><%= fi.getMsgcont() %></td>
 		 		<td><%= fi.getMsgdate() %></td>
 		 		<td><a href="markread.jsp?id=<%=id%>">���Ϊ�Ѷ�</a></td>
 		 	</tr>
 		 <%
 		 	i++;
 				}
 		 	}
 		  %>
 	</table><br>
	 <h2 style="margin-left:auto;margin-right:auto;width:5em">�Ѷ���Ϣ</h2><br>
 	<table   style="margin-left:auto;margin-right:auto;width:100%">
 		<tr><th>���</th><th>��Ϣ����</th><th>��Ϣ����</th><th>��Ϣ����</th></tr>
 		<%
 			ArrayList<Message> list1=Message.getWarehouseMessageList(2);
 			int j=1;
 			for(Message fj:list1){
 				if(fj.getMsgstate().equals("1")){
 				String id =fj.getId();
 		 %>
 		 	<tr>
 		 		<td><%= j%></td>
 		 		<td><%= fj.getMsgsubject() %></td>
 		 		<td><%= fj.getMsgcont() %></td>
 		 		<td><%= fj.getMsgdate() %></td>
 		 	</tr>
 		 <%
 		 	j++;
 				}
 		 	}
 		  %>
 	</table>
 	<br>
 	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="warehouse1.jsp">������ҳ��</a></p>
</body>
</html>