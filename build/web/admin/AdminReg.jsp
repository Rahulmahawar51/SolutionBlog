<%@page import="java.sql.*"%>
<%@page import="org.solutionblog.model.MyLib"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            session=request.getSession(false);
            String usertype="",e1="";
            if(session==null)
            {
                response.sendRedirect("../AuthError.jsp");

            }
            else
            {
                try
                {
                    usertype=session.getAttribute("usertype").toString();
                    e1=session.getAttribute("email").toString();
                    if(usertype==null || usertype.equalsIgnoreCase("admin")==false)
                    {
                        response.sendRedirect("../AuthError.jsp");
                    }
                }
                catch(NullPointerException e)
                {
                    response.sendRedirect("../AuthError.jsp");
                }
            }
        %>
    </head>
    <body>
        <h1>Admin Registration</h1>
        <form id="form1" name="form1" method="post" action="AdminReg1.jsp">
          <p>Name 
            <input type="text" name="T1" id="T1" />
          </p>
          <p>Address
            <input type="text" name="T2" id="T2" />
          </p>
          <p>City
            <input type="text" name="T3" id="T3" />
          </p>
          <p>Contact
            <input type="text" name="T4" id="T4" />
          </p>
          <p>Email
            <input type="text" name="T5" id="T5" />
          </p>
          <p>Password
            <input type="password" name="T6" id="T6" />
          </p>
          <p>Confirm password
            <input type="password" name="T7" id="T7" />
          </p>
          <p>
            <input type="submit" name="B1" id="B1" value="Submit" />
          </p>
        </form>
        <p>&nbsp;</p>
    </body>
</html>
