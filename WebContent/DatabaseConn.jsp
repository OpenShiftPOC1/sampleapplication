<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<html>
<head></head>
<body>
<table border="2">

  

<%
Class.forName("com.mysql.jdbc.Driver"); 
String url = "jdbc:mysql://" 
              + System.getenv().get("OPENSHIFT_MYSQL_DB_HOST") 
              + ":" 
              + System.getenv().get("OPENSHIFT_MYSQL_DB_PORT") 
              + "/sampledb";
			  
String username = System.getenv().get("OPENSHIFT_MYSQL_DB_USERNAME");
String password =System.getenv().get("OPENSHIFT_MYSQL_DB__PASSWORD"); 
 
 out.print(username);
 <%= url%>
java.sql.Connection con = DriverManager.getConnection(url,username,password); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from users"); 
while(rs.next())
{
	System.out.println(rs.getString("id"));
	System.out.println(rs.getString("name"));

	%>
	
	<tr><td><%= rs.getString("id") %></td>
    <td><%= rs.getString("name") %></td></tr>
	
	
	<%

}

%>
</table>

</body>
</html>
<%
rs.close();
st.close();
con.close();


%>

