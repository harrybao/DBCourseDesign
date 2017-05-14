package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class Login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Login() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws IOException{
			
		doPost(request,response);
			
		}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException{
			response.setContentType("text/html;charset=gbk");
			PrintWriter out = response.getWriter();
			String uid = request.getParameter("sid");
			String pwd = request.getParameter("con");
			HttpSession session = request.getSession();
			session.setAttribute("u", uid);
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
		  			 CallableStatement cstmt = con.prepareCall("{ call loginuser(?,?) }");
	                 cstmt.setString(1,uid);
	                 cstmt.setString(2,pwd);
	                 ResultSet rs=cstmt.executeQuery();
		    		if(rs.next()){			
		    			         out.println("登录成功！<hr>");
		    			         out.println("<a href='../ebody.html'><h1>点击继续</h1></a>");
		    					}else{
		    						out.println("您输入的账户或密码不正确！");
		    						}	
		    		rs.close();
		  			con.close();
		  		}catch(SQLException e){
		  			e.printStackTrace();
		  			System.exit(0);
		  			}
			out.flush();
			out.close();
			
		}
	public void init() throws ServletException {
		// Put your code here
	}

}
