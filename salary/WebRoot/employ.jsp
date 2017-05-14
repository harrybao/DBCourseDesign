<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
     <hr>
  
    <%!
    	public static final  String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		public static final  String connectDB="jdbc:sqlserver://localhost:1433;databaseName=StudyJ2EE";
		public static final  String user="sa";
		public static final  String password="910202";
		public static final int Pagesize=14;
		int pageCount;
		int curPage=1;
     %>
          		 	<table border="1" align="center">
   			<tr>
   			<td align="center" width="100">商品编号</td>
 			<td align="center" width="100">商品名称</td>
 			<td align="center" width="100">商品价格</td>
 			<td align="center" width="100">库存</td>
   			</tr>
     <%
     
     	try{
     		Class.forName(JDriver);
     		Connection conn=DriverManager.getConnection(connectDB, user, password);
     		String sql="{ call empinfomion() }";
     		CallableStatement ps = conn.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
     		ResultSet rs=ps.executeQuery();
     		rs.last();
     		int size=rs.getRow();
     		pageCount=(size%Pagesize==0)?(size/Pagesize):(size/Pagesize+1);
     		String tmp=request.getParameter("curPage");
     		if(tmp==null){
     			tmp="1";
     			}
     			curPage=Integer.parseInt(tmp);
     			if(curPage>=pageCount) curPage=pageCount;
     			boolean flag=rs.absolute((curPage-1)*Pagesize+1);
     			int count=0;   			 
     				do{
     					if(count>=Pagesize)break;
     					String bm=rs.getString(1);
     					String en=rs.getString(2);
     					String ep=rs.getString(3);
     					String be=rs.getString(4);
     					count++;
     					System.out.println(bm);
     		 %>

      <tr>
      	<td width="100"><%=bm %></td>
      	<td width="100"><%=en %></td>
      	<td width="100"><%=ep %></td>
      	<td width="100"><%=be %></td>
      </tr>
      <% 
      	}while(rs.next());
      }catch(Exception e){
      	e.printStackTrace();
      	}
      %>
      <tr>
             <td colspan="6" align="center">
      <%
   		 	 if(curPage==1){
   		 	  %>
   		 	  共<%=pageCount %>页
   		 	  当前第<%=curPage %>页
   		 	 首页
   		 	 上一页
   		 	 <a href="manage.jsp?curPage=<%=curPage+1 %>">下一页</a>
   		 	 <a href="manage.jsp?curPage=<%=curPage+1 %>">尾页</a>
   		 	 <%
   		 	 	}else if(curPage==pageCount){
   		 	  %>
   		 	  共<%=pageCount %>页
   		 	  当前第<%=curPage %>页
   		 	 <a href="manage.jsp?curPage=1">首页</a>
   		 	 <a href="manage.jsp?curPage=<%=curPage-1 %>">上一页</a>
   		 	 下一页
   		 	 尾页
   		 	 <%
   		 	 	}else{
   		 	  %>
   		 	  共<%=pageCount %>页
   		 	  当前第<%=curPage %>页
   		 	 <a href="manage.jsp?curPage=1">首页</a>
   		 	  <a href="manage.jsp?curPage=<%=curPage-1 %>">上一页</a>
   		 	    <a href="manage.jsp?curPage=<%=curPage+1 %>">下一页</a>
   		 	      <a href="manage.jsp?curPage=<%=pageCount%>">尾页</a>
   		 	      <%
   		 	      }
   		 	       %>
      </td>
      </tr>
        <tr>
   		 	  <td  colspan="6" align="center">
   		 	  <form name="addgoods" action="addgoods.jsp" > 
					<input type="text" name="gid" /><input type="text" name="gna"><br>
					<input type="text" name="gpr" /><input type="text" name="gnu"><br>
					<input type="submit" value="添加商品"/>
   			  </form>
   		 	  </td>
   		 	  </tr>
   		 	  <tr>
   		 	  <td  colspan="6" align="center">    
	          <a href="lookuse.jsp">查看全部用户</a>
   		 	  </td>
   		 	  </tr>
      </table>

  </body>
</html>
