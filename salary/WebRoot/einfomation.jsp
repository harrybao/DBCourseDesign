<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'einfomation.jsp' starting page</title>
    
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
		String uid = (String)session.getAttribute("u");
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
	  			 CallableStatement cstmt = con.prepareCall("{ call employeeinfomion(?) }");
                 cstmt.setString(1,uid);
                 ResultSet rs=cstmt.executeQuery();
                 %>       
      <table border="1" width="600" align="center">
 	<tr bgcolor="#dddddd">
 	<td align="center" width="100">内容</td><td align="center" width="100">信息详情</td>
 	</tr>
 	          <%
               while(rs.next()){
 					out.println("<tr><td align='center' width='100'>员工编号</td><td>"+rs.getString(1)+"</td></tr>");
 					out.println("<tr><td align='center' width='100'>姓名</td><td>"+rs.getString(2)+"</td></tr>");
 					out.println("<tr><td align='center' width='100'>性别</td><td>"+rs.getString(3)+"</td></tr>");
 					out.println("<tr><td align='center' width='100'>身份证号</td><td>"+rs.getString(4)+"</td></tr>");
 					out.println("<tr><td align='center' width='100'>银行卡号</td><td>"+rs.getString(5)+"</td></tr>");
 					out.println("<tr><td align='center' width='100'>住址</td><td>"+rs.getString(6)+"</td></tr>");
 					out.println("<tr><td align='center' width='100'>电话</td><td>"+rs.getString(7)+"</td></tr>");
 					out.println("<tr><td align='center' width='100'>邮箱号</td><td>"+rs.getString(8)+"</td></tr>");			
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
