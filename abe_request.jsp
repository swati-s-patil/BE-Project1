<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,cloudsecurity.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,cloudsecurity.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%
String fid=request.getQueryString();
String user=session.getAttribute("sname").toString();
	java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
	
Blob file1= null;
	String data1=null,fs=null,fn=null,uid=null,name=null;
	Connection con = null,con1=null;
	PreparedStatement ps = null,ps1=null;
	ResultSet rs = null;
	String sql=null,sql1=null;
String mb="File block1";
String mby="cloud server1";
String sta="new";
try
	{
		con=databasecon1.getconnection();
		System.out.println("select uid,name,fileid,fname,fsize,AES_DECRYPT(b1,'key') bl,date,status,fkey from tpafile where fileid ='"+fid+"'");
		ps = con.prepareStatement("select uid,name,fileid,fname,fsize,AES_DECRYPT(b1,'key') bl,date,status,fkey from tpafile where fileid ='"+fid+"'");
		
		rs = ps.executeQuery();
		while(rs.next())
		{      
		        uid=rs.getString(1);
				name=rs.getString(2);
				
				fn=rs.getString(4);
				fs=rs.getString(5);
				file1 = rs.getBlob("bl");
				mby=rs.getString("fkey");
		}
		System.out.println("file1=="+file1);
		byte[] bdata = file1.getBytes(1, (int)file1.length());
        data1 = new String(bdata);
       }
	   catch(Exception e1)
	   {
	  e1.printStackTrace();
	   }
	   
	        try
            	{
		       con1=databasecon.getconnection();
		       Statement st = con1.createStatement();
			   String query="insert into request_details(fileid,uid,name,fname,fsize,fkey,date,status,toval) values ('"+fid+"','"+uid+"','"+name+"','"+fn+"','"+fs+"','"+mby+"','"+strDateNew1+"','request','"+user+"')";
               /*ps1.setString(1,fid);
			   ps1.setString(2,uid);
			   ps1.setString(3,name);
			   ps1.setString(4,fn);
			   ps1.setString(5,fs);
			  // ps1.setBlob(6,file1);
			   ps1.setString(6,mby);
			   ps1.setString(7,strDateNew1);
			   ps1.setString(8,"request");
			   ps1.setString(9,user);*/
			   out.println(query);
			   
        		int count=st.executeUpdate(query);
				out.println(count);
				 response.sendRedirect("abe_all_files.jsp");
		     }
               catch(Exception e2)
	            {
	            e2.printStackTrace();
	             }
		   
	   
	   
	%>   