<%@ page  import="java.util.ArrayList" import="bean.Message" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="content-type" content="text/html; charset=GBK">
	<title>仓库一消息中心</title>
 	<link type="text/css" href="style.css" rel="stylesheet">
	<script type="text/javascript" src="ajax-pushlet-client.js"></script>
	<script src="jquery-1.2.6.pack.js"></script>
	<script src="jquery.messager.js"></script>
</head>
<body>
	<script type="text/javascript">
		PL._init();
        PL.joinListen("/push2");//监听该主题的事件，如果发生该主题的事件，那么onData()方法会被调用
	
		function onData(event){
			$.messager.lays(300, 200);
			$.messager.show('<font color=red>新消息</font>', '<font color=green style="font-size:14px;font-weight:bold;">'+event.get("message")+'<br>点击<a href="house1msg.jsp">查看</a></font>',0);
		}	
		
	</script>
	 <h2  style="margin-top:2em;margin-left:auto;margin-right:auto;width:5em">未读消息</h2><br>
	 <table  style="margin-left:auto;margin-right:auto;width:100%" >
 		<tr><th>序号</th><th>消息主题</th><th>消息内容</th><th>消息日期</th><th>操作</th></tr>
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
 		 		<td><a href="markread.jsp?id=<%=id%>">标记为已读</a></td>
 		 	</tr>
 		 <%
 		 	i++;
 				}
 		 	}
 		  %>
 	</table><br>
	 <h2 style="margin-left:auto;margin-right:auto;width:5em">已读消息</h2><br>
 	<table   style="margin-left:auto;margin-right:auto;width:100%">
 		<tr><th>序号</th><th>消息主题</th><th>消息内容</th><th>消息日期</th></tr>
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
 	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="warehouse1.jsp">返回主页面</a></p>
</body>
</html>