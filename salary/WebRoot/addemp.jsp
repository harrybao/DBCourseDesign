<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addemp.jsp' starting page</title>
    
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
    
    <form name="addemp" action="insertdb.jsp">
  <table align="center">
  <tr>
  <td>员工编号：</td><td> <input type="text" name="eid" /></td>
  </tr>
    <tr>
  <td>姓名：</td><td><input type="text" name="ename" /></td>
  </tr>
    <tr>
  <td>性别：</td><td><input type="text" name="esex" /></td>
  </tr>
    <tr>
  <td>身份证号：</td><td><input type="text" name="idnum" /></td>
  </tr>
    <tr>
  <td>银行卡号：</td><td><input type="text" name="card" /></td>
  </tr>
    <tr>
  <td>住址：</td><td><input type="text" name="addree" /></td>
  </tr>
    <tr>
  <td>电话：</td><td><input type="text" name="phone" /></td>
  </tr>
    <tr>
  <td> 邮箱：</td><td><input type="text" name="email" /></td>
  </tr>
   <tr>
   <td><input type="reset" value="重置"></td><td><input type="submit" value="确定"></td>
   </tr>
      
  </table>
 	</form>
  </body>
</html>
