<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'eselect.jsp' starting page</title>
    
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
	  			 CallableStatement cstmt = con.prepareCall("{ call empinfomion() }");
                 ResultSet rs=cstmt.executeQuery();
                 %>
                  <table border="1" align="center">
   <tr bgcolor="#dddddd">
   	<th align="center">员工编号</th>
    <th align="center">员工姓名</th>
    <th align="center">员工性别</th>
    <th align="center">身份证号</th>
    <th align="center">银行卡号</th>
    <th align="center">居住地址</th>
    <th align="center">电话号码</th>
    <th align="center">邮箱号码</th>
   	</tr>
   	<%
                 while(rs.next()){
                 	out.println("<tr>");
 					out.println("<td>"+rs.getString(1)+"</td>");
 					out.println("<td>"+rs.getString(2)+"</td>");
 					out.println("<td>"+rs.getString(3)+"</td>");
 					out.println("<td>"+rs.getString(4)+"</td>");
 					out.println("<td>"+rs.getString(5)+"</td>");
 					out.println("<td>"+rs.getString(6)+"</td>");
 					out.println("<td>"+rs.getString(7)+"</td>");
 					out.println("<td>"+rs.getString(8)+"</td>");	
 					out.println("</tr>");		
 		}
	    		cstmt.close();
	  			con.close();
	  		}catch(SQLException e){
	  			e.printStackTrace();
	  			System.exit(0);
	  			}
                 %>     
    </table>  
  </body>
</html>
