<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<html>
<head></head>
<body>
<table border="2">

  

<%

String url = "jdbc:mysql://" 
              + "mysql"
              + ":" 
              + "3306"
              + "/sampledb";
			  
String username = System.getenv().get("OPENSHIFT_MYSQL_DB_USERNAME");
String password =System.getenv().get("OPENSHIFT_MYSQL_DB__PASSWORD"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection(url,"admin","root"); 
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

