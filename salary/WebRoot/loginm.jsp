<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginm.jsp' starting page</title>
    
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
  <%
  		response.setContentType("text/html;charset=gbk");
		String uid = request.getParameter("side");
		String pwd = request.getParameter("cone");
		if(uid.equals("qiyegl0")&&pwd.equals("qiyegl0")||
		   uid.equals("qiyegl1")&&pwd.equals("qiyegl1")||
		   uid.equals("qiyegl2")&&pwd.equals("qiyegl2")){
			try {
				request.getRequestDispatcher("body.html").forward(request,response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			out.println("您输入的账户或密码不正确！");
		}
   %>
  </body>
</html>
