<%@page import="org.solutionblog.model.MyLib" import="java.sql.*"%> 
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
                    if(usertype==null || usertype.equalsIgnoreCase("student")==false)
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
    <%
    MyLib obj=new MyLib();
    Class.forName(obj.getDriver());
    Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());
    String sql="SELECT DISTINCT QSUB FROM QBANK";
    PreparedStatement p1=cn.prepareStatement(sql);

    ResultSet r1=p1.executeQuery();
    while(r1.next())
    {
        String sub=r1.getString("qsub");
        %>
        <p>
        <a href="Solution2.jsp?subject=<%= sub %>"><%=sub%></a>
        </p>
        <%
    }
    %>
    </body>
</html>
