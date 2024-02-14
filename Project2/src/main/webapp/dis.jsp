<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ratings</title>
<style>
h1{
  background:url('https://cdn2.vectorstock.com/i/1000x1000/92/96/movie-background-film-frames-tape-reels-camera-vector-28149296.jpg');
  background-size:cover;
  height: 50px;
  text-content: center;
  text-align:center;
  color:#ffffff;
}
body{
 background-color:#FFFFE0;
}
</style>
</head>
<body>
<h1 align="center">Ratings Updates</h1>
<div>
<br><br>
<table border="1" align="center">
<tr><th>Movie Name</th><th>Rating</th></tr>
<% try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	String jdbcUrl="jdbc:mysql://localhost:3306/movie";
	String user="root";
	String password="Lohi@2001";
	
	java.sql.Connection con=java.sql.DriverManager.getConnection(jdbcUrl,user,password);
	
	java.sql.Statement stmt=con.createStatement();
	
	String sqlQuery="select * from info";
	java.sql.ResultSet rs=stmt.executeQuery(sqlQuery);
	
	while(rs.next()){
		String mvname=rs.getString("mvname");
		int rating=rs.getInt("rating");
	%>
	<tr>
	<td><%= mvname %></td>
	<td><%= rating %></td>
</tr>
<% }
rs.close();
con.close();
stmt.close();
}catch(Exception e){
	out.println("Error occured: "+e.getMessage());
}
%>

</table>
</div>
</body>
</html>