<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,cloudsecurity.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%
 
	String fid =request.getQueryString();
	session.setAttribute("fid",fid);
	String name=(String)session.getAttribute("name");
	
	Connection con = null,con1 = null,con2 = null;
	PreparedStatement ps = null,ps1 = null,ps2 = null;
	try
	{
		 con=databasecon1.getconnection();

		ps = con.prepareStatement("update tpafile set status='verify' where fileid ='"+fid+"'");
		int count= ps.executeUpdate();
		 response.sendRedirect("user_home.jsp?msg=sent");
		
	}catch(Exception e){
		e.printStackTrace();
	}
		
%>