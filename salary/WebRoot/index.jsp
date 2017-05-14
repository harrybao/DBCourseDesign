<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<hr>
  	<table align="center">
  	<tr>
  	<td><img src="image/7.jpg" width="400" height="100"></td>
  	</tr>
  	<tr>
  	<td><a href="login.html" ><img src="image/5.jpg" width="400" height="100"></a></td>
  	</tr>
  	<tr>
  	<td><a href="loginm.html" ><img src="image/6.jpg" width="400" height="100"></a></td>
  	</tr>
  	</table>
	
  </body>
</html>
