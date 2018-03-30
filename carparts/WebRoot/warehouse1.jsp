<%@ page import="java.util.ArrayList" import="bean.CarPartsInfo" pageEncoding="GBK"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>仓库一保管员</title>
    <meta name="content-type" content="text/html; charset=GBK">
    <link type="text/css" href="style.css" rel="stylesheet">
    <script src="jquery-1.2.6.pack.js"></script>
	<script src="jquery.messager.js"></script>
  </head>
  
  <body>
    <h1 style="margin-top:2em;margin-left:auto;margin-right:auto;width:14em">仓库一保管员，欢迎登陆！<a href="exit.jsp" style="font-size:16px;float:right;padding-top:15px;margin-right:-50px;">退出</a></h1>
	<br>
  <a style="display:block;margin-left:auto;margin-right:auto;width:5em" href="house1msg.jsp">消息中心</a><br>
 	<table  style="margin-left:auto;margin-right:auto;width:100%">
 		<tr><th>序号</th><th>名称</th><th>入库日期</th><th>数量</th><th>位置</th><th>单位</th><th>价格</th><th>生产商</th><th>生产日期</th></tr>
 		<%
 		 	ArrayList<CarPartsInfo> list=CarPartsInfo.getWarehousePartsList("仓库一");
 			int i=1;
 			for(CarPartsInfo fi:list){
 				int id =fi.getId();
 		 %>
 		 	<tr>
 		 		<td><%= i%></td>
 		 		<td><%= fi.getPartsname() %></td>
 		 		<td><%= fi.getPutawaydate() %></td>
 		 		<td><%= fi.getPartsnum() %></td>
 		 		<td><%= fi.getLocation() %></td>
 		 		<td><%= fi.getPartsunit() %></td>
 		 		<td><%= fi.getPartsprice() %></td>
 		 		<td><%= fi.getManufactuper() %></td>
 		 		<td><%= fi.getProductiondate() %></td>
 		 	</tr>
 		 <%
 		 	i++;
 		 	}
 		  %>
 	</table>
 	<script>
		var num=0;
		var xmlHttp=new XMLHttpRequest();
	    var url="MsgState";
	    xmlHttp.onreadystatechange=handleStateChange;  
	    xmlHttp.open("GET",url,true);  
	    xmlHttp.send(null);  
	    function handleStateChange()  
	    {  
	     if(xmlHttp.readyState===4)  
	     {  
	      if(xmlHttp.status===200)  
	      {  
	       parseResults();  
	      }  
	     }  
	    }  
		function parseResults(){
				num=xmlHttp.responseText;
				if(num>0){
					$.messager.lays(300, 200);
					$.messager.show('<font color=red>消息通知</font>', '<font color=green style="font-size:14px;font-weight:bold;">您有'+num+'条未读消息。点击进入<a href="house1msg.jsp">消息中心</a></font>',0);
					
				}
			}
	</script>
  </body>
</html>
