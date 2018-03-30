<%@ page import="java.util.ArrayList" import="bean.CarPartsInfo" pageEncoding="GBK"%>
<!DOCTYPE HTML>
<html>
   <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>按条件查询</title>
    <link type="text/css" href="style.css" rel="stylesheet">
  </head>
  <body>
  <h1 style="margin-top:2em;margin-left:auto;margin-right:auto;width:8em">汽车零配件管理</h1><br>
     	<table style="margin-top:2em;margin-left:auto;margin-right:auto;width:100%">
 		
 		 <tr><th>序号</th><th>名称</th><th>入库日期</th><th>数量</th><th>位置</th><th>单位</th><th>价格</th><th>生产商</th><th>生产日期</th><th>管理</th></tr>
 		<%
 		    request.setCharacterEncoding("gb2312");
 		    String select=request.getParameter("select");
 			ArrayList<CarPartsInfo> list=CarPartsInfo.getWarehousePartsList(select);
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
 		 		<td><a href="/carparts/edit.do?id=<%=id%>">修改</a>
 		 		<a href="/carparts/delete.do?id=<%=id%>">删除</a></td>
 		 	</tr>
 		 <%
 		 	i++;
 		 	}
 		  %>
 	</table>
 	<br>
	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="list.jsp">返回上一级</a></p>
  </body>
</html>
