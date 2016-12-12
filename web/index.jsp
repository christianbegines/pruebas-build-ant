<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  Connection con;
            String nombre;

            try {
                InitialContext initContext=new InitialContext();
                Context envCotx=(Context)initContext.lookup("java:comp/env");
                DataSource dataSource=(DataSource)envCotx.lookup("jdbc/despliegue");
                con=dataSource.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT nombre FROM usuarios");
                ResultSet res = ps.executeQuery();
                res.next();
                nombre = res.getString("Nombre");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        %>

        <h1><%=nombre%></h1>
    </body>
</html>
