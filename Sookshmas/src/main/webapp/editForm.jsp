<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Student"%>
<%@page import="model.Registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
    </head>
    <style>
        td input{
            display:block;
        }
        .jumbotron{
            background-color: white;
        }
    </style>
    <body>
        <%@include file="header.jsp"%>
    <center>
        <% if (session.getAttribute("uname") != null) {
                Registration reg = new Registration(session);
                Student s = reg.getInfo();%>
        <font color="blue" size="5"><br>
        <h2> Edit Profile</h2>
        </font>
        <form action='register' method='POST'>
            <div class="container ">
                <div class="jumbotron">
                    <div class="form-group col-md-4">
                        <label >Name</label>
                        <input type="text" class="form-control"  name="name" value="<%=s.getName()%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label >Phone Number</label>
                        <input type="number" class="form-control"  name="pno" value="<%=s.getPhone()%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label >Email</label>
                        <input type="email" class="form-control"  name="email" value="<%=s.getEmail()%>">
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit">Update</button>
                </div>
            </div>
        </form>
        <%}%> 
    </center>
    <%@include file="footer.jsp"%>
</body>
</html>
