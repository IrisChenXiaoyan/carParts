<%@ page import="bean.CarPartsInfo" pageEncoding="GBK"%>

<html>
  <head>
    <title>�޸��������Ϣ</title>
  </head>
  
  <body>
    <%
    CarPartsInfo fi=(CarPartsInfo)request.getAttribute("fi");
    	//out.println(fi.getProducename());
     %>
     <form action="update.do" method="post">
    	<table>
    		<caption>�޸��������Ϣ</caption>
    		<tr>
    			<th>���ƣ�</th>
    			<td><input name="partsname" type="text" value="<%=fi.getPartsname()%>"></td>
    		</tr>
    		<tr>
    			<th>������</th>
    			<td><input name="partsnum" type="text" value="<%=fi.getPartsnum()%>"></td>
    		</tr>
    		<tr>
    			<th>�۸�</th>
    			<td><input name="partsprice" type="text" value="<%=fi.getPartsprice()%>"></td>
    		</tr>
    		<tr>
    			<th>λ�ã�</th>
    			<td><input name="location" type="text" value="<%=fi.getLocation()%>"></td>
    		</tr>
    		<tr>
    			<th colspan="2" style="text-align:center">
    			<input type="hidden" name="id" value="<%=fi.getId() %>">
    			<input type="submit" name="submit" value="�޸�">
    			<input type="reset"  value="����">
    			</th>
    		</tr>
    	</table>
    </form>
  </body>
</html>
