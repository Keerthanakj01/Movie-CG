<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Rating</title>
<style>
     body{
        background:url('https://png.pngtree.com/thumb_back/fh260/background/20210902/pngtree-movie-film-strip-gray-minimalist-background-image_784563.jpg');
        background-size:cover;
   }
   .col{
    font-weight: bold;
    text-align: center;
   }
</style>
</head>
<body>
<div align="center">
<br>
<br>
<h1>Rate the Movie</h1>
<br>
</div>
<form action="" method="post">
   <table class="col" align="center">
      <tr><td>Enter Movie Name: </td><td><input type="text" name="mvname"/></td></tr>

      <tr><td>Enter Rating(out of 10): </td><td><input type="number" name="mvrate"/></td></tr>

      <tr><td><input type="submit" value=Submit></td></tr>
   </table>
</form>
<%
String mvname = request.getParameter("mvname");
String mvrate = request.getParameter("mvrate");

if (mvname != null && mvrate != null) {
    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/movie";
        String dbUser = "root";
        String dbPassword = "Lohi@2001";

        // Establish database connection
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Insert data into the table
        String sql = "INSERT INTO INFO (mvname, rating) VALUES (?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, mvname);
        statement.setString(2, mvrate);

       // out.println("Executing SQL: " + sql); // Debug
       // out.println("mvname: " + mvname); // Debug
       // out.println("mvrate: " + mvrate); // Debug

        statement.executeUpdate();
        //connection.commit(); // Commit the transaction
        response.sendRedirect("dis.jsp");

        statement.close();
        connection.close();
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
        e.printStackTrace();
    }
}
%>
</body>
</html>