<%@ page import="bean.CarPartsInfo" pageEncoding="GBK"%>

<html>
  <head>
    <title>修改零配件信息</title>
  </head>
  
  <body>
    <%
    CarPartsInfo fi=(CarPartsInfo)request.getAttribute("fi");
    	//out.println(fi.getProducename());
     %>
     <form action="update.do" method="post">
    	<table>
    		<caption>修改零配件信息</caption>
    		<tr>
    			<th>名称：</th>
    			<td><input name="partsname" type="text" value="<%=fi.getPartsname()%>"></td>
    		</tr>
    		<tr>
    			<th>数量：</th>
    			<td><input name="partsnum" type="text" value="<%=fi.getPartsnum()%>"></td>
    		</tr>
    		<tr>
    			<th>价格：</th>
    			<td><input name="partsprice" type="text" value="<%=fi.getPartsprice()%>"></td>
    		</tr>
    		<tr>
    			<th>位置：</th>
    			<td><input name="location" type="text" value="<%=fi.getLocation()%>"></td>
    		</tr>
    		<tr>
    			<th colspan="2" style="text-align:center">
    			<input type="hidden" name="id" value="<%=fi.getId() %>">
    			<input type="submit" name="submit" value="修改">
    			<input type="reset"  value="重置">
    			</th>
    		</tr>
    	</table>
    </form>
  </body>
</html>
