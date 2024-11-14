<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Student"%>
<%@page import="model.Registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <title>TODO supply a title</title>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   </head>
   <style>
       .errmsg{
           background: green;
           padding: 6px;
           width: 50%;
           color: white;
           font-weight: bold;
       }
       .jumbotron{
           background-color: white;
       }
       #search
       {
           width: 50%; 
       }
       
   </style>
   <body>
       <%@include file="header.jsp"%>
   <center>
       <br>
       <font color="blue" size="4">
       <h2>View Student Details </h2>
       </font>
       <% if (request.getAttribute("status") != null) {%>
       <h1 class="errmsg"> <%= request.getAttribute("status")%></h1>
       <%}%>

                       <% if (session.getAttribute("id") != null 
                               && session.getAttribute("id").equals("1")) {
                               Registration reg = new Registration(session);
                               ArrayList<Student> mydata = (ArrayList<Student>)reg.getUserDetails();
                               
                               Iterator<Student> itr = mydata.iterator();
                               if(itr.hasNext())
                               {%>
                                     
               <table class="table">
                   <thead>
                       <tr style="background-color: lightblue;">
                   <br>
                           <th>Slno</th>
                           <th>Student Name</th>
                           <th>Student Email</th>
                           <th>Student Phone</th>
                           <th>Date of Joining</th>
                           <th>Delete Student</th>
                           
                       </tr>
                   </thead>
                   <tbody id="table">
                               <%
                               while (itr.hasNext()) {
                                   Student s = itr.next();
                       %>
                       <tr>
                           <td><%=s.getId()%></td>
                           <td><%=s.getName()%></td>
                           <td><%=s.getEmail()%></td>
                           <td><%=s.getPhone()%></td>
                           <td><%=s.getDate()%></td>
                           <td>
                               <form action="delete" method="POST">
                                   <input type="hidden" name="userid" value="<%=s.getId()%>"/>
                                   <input type="submit" class="btn btn-danger" value="Delete" />
                               </form>
                           </td>
                       </tr> 

                       <%}%>
                   </tbody>
               </table>
           </div>
       </div>
                      <%}else{%>
                    	  <h1 class="errmsg"> No Records Found</h1>
                      <%}
                       }%> 

   </center>
                   
                   <script>
$(document).ready(function(){
 $("#search").on("keyup", function() {
   var value = $(this).val().toLowerCase();
   //alert(value);
   $("#table tr").filter(function() {
     $(this).toggle($(this).text().toLowerCase().indexOf(value) > 0)
     //alert(this);
   });
 });
});
</script>
   <%@include file="footer.jsp"%>
</body>
</html>
