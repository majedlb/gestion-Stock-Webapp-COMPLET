<%@page  import ="java.sql.*"%>
<%!
    public static Connection connect() {

        try {

            Class.forName("com.mysql.jdbc.Driver").newInstance();

            return DriverManager.getConnection("jdbc:mysql://localhost/stocdatabase", "root", "root");
        } catch (Exception e) {
            return null;
        }

    }

    public static boolean close(Connection c) {
        try {
            c.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }


%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock Information</title>
    </head>
    <body>
             <h1>STOCK INFORMATION</h1>
        <% try {

                Connection c = connect();
                Statement stmt = c.createStatement();

                ResultSet rs = stmt.executeQuery("select s.stockid,s.Stockname,p.idproduct,p.productname,p.productQuantity,p.productmodel from stocdatabase.stock s,stocdatabase.stocpro sp,stocdatabase.product p where s.Stockid=sp.stocid and p.idproduct=sp.prodid1");

        %>


            
        <table border =1><tr><td>Stock id</td><td>Stock name</td><td>Product ID</td><td>Product Name</td><td>Product Quantity</td><td>Product Model</td></tr>

        <% while (rs.next()) {%> 


       
           
                <tr>
                    <td><%out.println(rs.getString(1));%></td> 
                    <td><%out.println(rs.getString(2));%></td> 
                    <td><%out.println(rs.getString(3));%></td> 
                    <td><%out.println(rs.getString(4));%></td> 
                    <td><%out.println(rs.getString(5));%></td>
                    <td><%out.println(rs.getString(6));%></td> 
                </tr>

           
      
        <%  }%></table> <%

                c.close();
            } catch (Exception e) {

            }
        %>
    </body>
</html>
