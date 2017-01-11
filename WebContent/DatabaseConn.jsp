<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<html>
<head></head>
<body>
<table border="2">

  

<%
String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
String username = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
String password = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
String url = "jdbc:mysql://" 
              + host
              + ":" 
              + port
              + "/sampledb";

out.println(url + username + password);


Class.forName("com.mysql.jdbc.Driver"); 
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

