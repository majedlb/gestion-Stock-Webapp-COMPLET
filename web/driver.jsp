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
        <title>Driver Page</title>
    </head>
    <body>
        <h1>Driver List</h1>
         <% try {

                Connection c = connect();
                Statement stmt = c.createStatement();
                ResultSet rs = stmt.executeQuery("Select * from driver");

        %>

        <table border =1>
            <tr><td>Driver id</td><td>driver Name </td><td>driver Phone</td><td>driver License</td></tr>
            
            
            
            
            
        <% while (rs.next()) {%>
        



            <tr>
                <td><%out.println(rs.getString(1));%></td> 
                <td><%out.println(rs.getString(2));%></td> 
                <td><%out.println(rs.getString(3));%></td> 
                <td><%out.println(rs.getString(4));%></td> 
                     </tr>


        
        <%  }%></table> <%

                c.close();
            } catch (Exception e) {

            }
        %>
        
        <h1>Adding a new Driver</h1>    
        <form name="name1" action="#" method="POST">
            <table border="1">


                <tr>
                    <td>Driver Name :</td>
                    <td><input type="text" name="dname" value="" size="50" autocomplete="off"/></td>
                </tr>

                <tr>
                    <td>Driver Phone :</td>
                    <td><input type="text" name="dphone" value="" size="50" autocomplete="off"/></td>
                </tr>

                <tr>
                    <td>License Number :</td>
                    <td><input type="text" name="lnumber" value="" size="50" autocomplete="off"/></td>
                </tr>

                
                <tr>
                    <td><input type="submit" value="Add" name="btnadd"/></td>
                    <td><input type="reset" value="Reset" name="btnreset" /></td>
                </tr>

            </table>
        </form>

        <% if (request.getMethod().equals("POST")) {
                String dname, dphone,lnumber;
                dname = request.getParameter("dname");
                dphone = request.getParameter("dphone");
                lnumber = request.getParameter("lnumber");
               
                try {
                    Connection c = connect();

                    String sql = "insert into stocdatabase.driver(drivername,driverphone,driverlecense)  values ('" + dname + "','" + dphone + "','" + lnumber + "')";

                    Statement stmt1 = c.createStatement();
                    stmt1.executeUpdate(sql);

                    c.close();

                } catch (Exception e) {
                    out.print(e.getMessage());
        }
    }%>

        
    </body>
</html>
