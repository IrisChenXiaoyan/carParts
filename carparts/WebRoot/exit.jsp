<%@ page pageEncoding="GBK"%>
<html>
  <head>
    <title>ÍË³ö</title>
  </head>
  
  <body>
  	<% session.invalidate(); %> 
	<%  
		response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
  		String newLocn = "login.html";
  		response.setHeader("Location",newLocn);
  	%>
 

  </body>
  </html>