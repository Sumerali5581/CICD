<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>All Students</title>
  <style>
      *{
        margin: 0;
        padding: 0;

        font-family: sans-serif;
      }

      body{
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: url(https://wallpaperaccess.com/full/378757.png) center / cover;
      }

      table, th, td{
        padding: 1rem 5rem ;
        text-align: left;
      }

      .table{
        width: 82vw;
        height: 90vh;
        background-color: #fff5;
        backdrop-filter: blur(7px);
        box-shadow: 0 .4rem .8rem #0005;
        border-radius: .8rem;

        overflow: hidden;
      }

      .table_header{
        width: 100%;
        height: 10%;
        background-color: #fff4;
        padding: 0.8rem 1rem;
      }

      .table_body{
        width: 98%;
        max-height:calc(75% - 1.6rem);
        background-color: #fffb;

        margin: .8rem auto;
        border-radius: .6rem;
        overflow: auto;
      }

      .table_body::-webkit-scrollbar{
        width: 0.5rem;
        height: 0.5rem;
      }

      .table_body::-webkit-scrollbar-thumb{
        border-radius: 0.5rem;
        background-color: #0004;
        visibility: hidden;
      }

      .table_body:hover::-webkit-scrollbar-thumb{
        
        visibility: visible;
      }

      table{
        width: 100%;
      }

      table, th, td{
        border-collapse: collapse;
        padding: 1rem;
      }

      thead th{
        position: sticky;
        top: 0;
        left: 0;
        background-color:rgb(215, 255, 95);
      }

      tbody tr:nth-child(even){
        background-color: #0000000b;
      }

      tbody tr:hover{
        background-color: #fff6;
      }

      @media (max-width: 1000px) {
        td:not(:first-of-type) {
          min-width: 12.1rem;
        }
      }

      button{
        text-align: center; 
        width: 20%; 
        height: 35px; 
        margin: 10px 40%;
        cursor: pointer;
        border-radius: 8px;
        background-color: rgba(215, 255, 95,0.8);
        font-size: 15px;
      }
      button:hover{
        background-color: rgb(215, 255, 95);
        font-size: 16px;
      }
    </style>
</head>
<body>
    <main class="table">
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con123=DriverManager.getConnection("jdbc:mysql://database-1.cbk04ukggkcd.ap-south-1.rds.amazonaws.com:3306/student_manage", "root", "root1234");

    String s="select * from students";
    PreparedStatement stmt=con123.prepareStatement(s);
    ResultSet rs=stmt.executeQuery();
%>
      <section class="table_header">
        <h1>Students</h1>
      </section>
      <section class="table_body">
        <table>
          <thead>
            <tr>
              <th>Username</th>
              <th>Email</th>
              <th>Year</th>
              <th>PRN No.</th>
              <th>City</th>
              <th>Division</th>
              <th>Name</th>
              <th>Date of Birth</th>
              <th>Phone Number</th>
            </tr>
          </thead>
          <tbody>
              <%while(rs.next()) {%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>   
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(8)%> <%=rs.getString(9)%></td>
                    <td><%=rs.getString(10)%></td>
                    <td><%=rs.getString(11)%></td>
                </tr>
            <% } %>
          </tbody>
        </table>
      </section>
      <a
        href="goto_home_admin">
        <button type="button">Back</button> 
      </a>
    </main>
</body>
</html>
<%
        //closing connection
    try { rs.close(); } catch (Exception e) { /* Ignored */ }
    try { stmt.close(); } catch (Exception e) { /* Ignored */ }
    try { con123.close(); } catch (Exception e) { /* Ignored */ }
%>