<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <style>
    body{
    background-image:url('b$w.jpg');
    background-size:cover;
 
   
    }
    
    
        h1{
            text-align: center;
            text-shadow: 2px 1px 2px black;
        }
        .errmsg{
            background: green;
            padding: 10px;
            width: 50%;
            color: white;
            font-weight: bold;
        }
    </style>
    <body>
  
        <%@include file="header.jsp"%>
    <center>
        <% if (request.getAttribute("status") != null) {%>
        <h1 class="errmsg"> <%= request.getAttribute("status")%></h1>
        <%}%>
        <br>
        <div>
            <h1>STUDENT MANAGEMENT SYSTEM </h1>
        </div>
        <% if (session.getAttribute("uname") != null) {%>
        <h1>Welcome <%= session.getAttribute("uname")%></h1>
      
        <%}%>
    </center>
    <%@include file="footer.jsp"%>
</body>
</html>
