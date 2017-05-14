<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'insertdb.jsp' starting page</title>
    
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
        request.setCharacterEncoding("GBK");
		String eid = request.getParameter("eid");
		String ename = request.getParameter("ename");
		String esex = request.getParameter("esex");
		String idnum = request.getParameter("idnum");
		String card = request.getParameter("card");
		String addree = request.getParameter("addree");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	  	String connectDB="jdbc:sqlserver://localhost:1433;databaseName=SalarySystem";	  	
	  	try {
				Class.forName(JDriver);
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			}
	  		try{
	  			String user="sa";
	  			String password="910202";
	  			Connection con=DriverManager.getConnection(connectDB,user,password);
	  			 CallableStatement cstmt = con.prepareCall("{ call employinfo(?,?,?,?,?,?,?,?) }");
                 cstmt.setString(1,eid);
                 cstmt.setString(2,ename);
                 cstmt.setString(3,esex);
                 cstmt.setString(4,idnum);
                 cstmt.setString(5,card);
                 cstmt.setString(6,addree);
                 cstmt.setString(7,phone);
                 cstmt.setString(8,email);	
                 cstmt.executeUpdate();
	    		cstmt.close();
	  			con.close();
	  		}catch(SQLException e){
	  			e.printStackTrace();
	  			System.exit(0);
	  			}
     %>
     <a href="addemp.jsp" >¼ÌĞøÌí¼Ó</a>
  </body>
</html>
