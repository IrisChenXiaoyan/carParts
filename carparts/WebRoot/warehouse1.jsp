<%@ page import="java.util.ArrayList" import="bean.CarPartsInfo" pageEncoding="GBK"%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>�ֿ�һ����Ա</title>
    <meta name="content-type" content="text/html; charset=GBK">
    <link type="text/css" href="style.css" rel="stylesheet">
    <script src="jquery-1.2.6.pack.js"></script>
	<script src="jquery.messager.js"></script>
  </head>
  
  <body>
    <h1 style="margin-top:2em;margin-left:auto;margin-right:auto;width:14em">�ֿ�һ����Ա����ӭ��½��<a href="exit.jsp" style="font-size:16px;float:right;padding-top:15px;margin-right:-50px;">�˳�</a></h1>
	<br>
  <a style="display:block;margin-left:auto;margin-right:auto;width:5em" href="house1msg.jsp">��Ϣ����</a><br>
 	<table  style="margin-left:auto;margin-right:auto;width:100%">
 		<tr><th>���</th><th>����</th><th>�������</th><th>����</th><th>λ��</th><th>��λ</th><th>�۸�</th><th>������</th><th>��������</th></tr>
 		<%
 		 	ArrayList<CarPartsInfo> list=CarPartsInfo.getWarehousePartsList("�ֿ�һ");
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
					$.messager.show('<font color=red>��Ϣ֪ͨ</font>', '<font color=green style="font-size:14px;font-weight:bold;">����'+num+'��δ����Ϣ���������<a href="house1msg.jsp">��Ϣ����</a></font>',0);
					
				}
			}
	</script>
  </body>
</html>
