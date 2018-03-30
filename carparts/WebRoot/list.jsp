<%@ page import="java.util.ArrayList" import="bean.CarPartsInfo" pageEncoding="GBK"%>

<!DOCTYPE HTML>
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>物资管理</title>
    <link type="text/css" href="style.css" rel="stylesheet">
  </head>
  
  <body>
  <h1 style="margin-top:2em;margin-left:auto;margin-right:auto;width:8em">汽车零配件管理</h1><br>
  <p style="margin-left:auto;margin-right:auto;width:7em"><a href="/carparts/add.html">添加零配件</a></p><br>
  <form style="margin-left:auto;margin-right:auto;width:16em" method="post" action="select.jsp">
   		按所在仓库查询：
   		<select name="select"><option value="仓库一">仓库一</option><option value="仓库二">仓库二</option></select>&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="查询">
  </form>
   	<br/>
 	<table style="margin-left:auto;margin-right:auto;width:100%">
 		<tr><th>序号</th><th>名称</th><th>入库日期</th><th>数量</th><th>位置</th><th>单位</th><th>价格</th><th>生产商</th><th>生产日期</th><th>管理</th></tr>
 		<%
 			ArrayList<CarPartsInfo> list=CarPartsInfo.getCarPartsList();
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
	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="manager.html">返回主页面</a></p>
</html>
