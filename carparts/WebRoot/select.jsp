<%@ page import="java.util.ArrayList" import="bean.CarPartsInfo" pageEncoding="GBK"%>
<!DOCTYPE HTML>
<html>
   <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>��������ѯ</title>
    <link type="text/css" href="style.css" rel="stylesheet">
  </head>
  <body>
  <h1 style="margin-top:2em;margin-left:auto;margin-right:auto;width:8em">�������������</h1><br>
     	<table style="margin-top:2em;margin-left:auto;margin-right:auto;width:100%">
 		
 		 <tr><th>���</th><th>����</th><th>�������</th><th>����</th><th>λ��</th><th>��λ</th><th>�۸�</th><th>������</th><th>��������</th><th>����</th></tr>
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
 		 		<td><a href="/carparts/edit.do?id=<%=id%>">�޸�</a>
 		 		<a href="/carparts/delete.do?id=<%=id%>">ɾ��</a></td>
 		 	</tr>
 		 <%
 		 	i++;
 		 	}
 		  %>
 	</table>
 	<br>
	<p style="margin-left:auto;margin-right:auto;width:7em"><a href="list.jsp">������һ��</a></p>
  </body>
</html>
