<!-- <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %> -->
<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Signika&display=swap" rel="stylesheet">
  <title>Student Courses</title>
  <style>
    * {
      margin: 0;
      padding: 0;

      font-family: sans-serif;
    }

    body {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background: url(https://wallpaperaccess.com/full/378757.png) center / cover;
    }

    table,
    th,
    td {
      padding: 1rem 5rem;
      text-align: left;
      font-family: 'Signika',sans-serif;
      font-size: 20px;
    }
    
    td{
      padding-left: 20px;
    }
    .table {
      width: 82vw;
      height: 90vh;
      background-color: #fff5;
      backdrop-filter: blur(7px);
      box-shadow: 0 .4rem .8rem #0005;
      border-radius: .8rem;

      overflow: hidden;
    }

    .table_header {
      width: 100%;
      height: 10%;
      background-color: #fff4;
      padding: 0.8rem 1rem;
    }

    .table_body {
      width: 98%;
      max-height: calc(75% - 1.6rem);
      background-color: #fffb;

      margin: .8rem auto;
      border-radius: .6rem;
      overflow: auto;
    }

    .table_body::-webkit-scrollbar {
      width: 0.5rem;
      height: 0.5rem;
    }

    .table_body::-webkit-scrollbar-thumb {
      border-radius: 0.5rem;
      background-color: #0004;
      visibility: hidden;
    }

    .table_body:hover::-webkit-scrollbar-thumb {

      visibility: visible;
    }

    table {
      width: 100%;
    }

    table,
    th,
    td {
      border-collapse: collapse;
      padding: 1rem;
    }

    thead th {
      position: sticky;
      top: 0;
      left: 0;
      background-color: rgb(215, 255, 95);
    }

    tbody tr:nth-child(even) {
      background-color: #0000000b;
    }

    tbody tr:hover {
      background-color: #fff6;
    }

    @media (max-width: 1000px) {
      td:not(:first-of-type) {
        min-width: 12.1rem;
      }
    }

    button {
      text-align: center;
      width: 100px;
      height: 35px;
      margin: 10px 40%;
      cursor: pointer;
      border-radius: 8px;
      background-color: rgba(215, 255, 95, 0.8);
      font-size: 15px;
      font-family: 'Signika', sans-serif;
      border: 1px rgb(101, 101, 101) solid;
    }

    button:hover {
      background-color: rgb(215, 255, 95);
      font-size: 16px;
    }

    .popup button {
      display: block;
      margin: 0px 0px 10px auto;
      background-color: transparent;
      border: none;
      font-size: large;
      cursor: pointer;
      outline: none;
    }
    .popup p{
      display: flex;
      margin-bottom: 40px;
      justify-content: center;
      font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
      font-size: 30px;
    }
    #close{
      font-size: 35px;
      color: red;
      margin-left: 420px;
      
      width: 50px;
      height: 50px;
      border-radius: 50%;
    }
    #close:hover{
      font-size: 37px;
      background-color: antiquewhite;
    }
  </style>
</head>

<body>
  <%
    String[] s= new String[15];
    int i=0;
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con11=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_manage", "root", "root");

    String s11="select * from all_courses";

    PreparedStatement stmt=con11.prepareStatement(s11);
    ResultSet rs11=stmt.executeQuery();
%> 


  <main class="table">
    
    <section class="table_header">
      <h1 align="center">All Courses</h1>
    </section>
    <section class="table_body">
      <table>
        <thead>
          <tr>
            <th style="padding-left: 110px;">Courses</th>
            <th style="padding-left: 110px;">Faculty</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <%while(rs11.next()) {s[i]=rs11.getString(1);%>
          <tr>
            <td style="padding-left: 100px;"><%=rs11.getString(1)%></td>
            <td style="padding-left: 100px;"><%=rs11.getString(2)%></td>
            <td><form method="post" action="done_enroll"><input type="hidden" name="crs" value="<%=s[i]%>"> <button type="submit" onclick="return confirm('Are you sure you want to Enroll from this course?')">Enroll</button> </form>  </td>
          </tr>
           <% i++;} %>
        </tbody>
      </table>
    </section>
    <a href="goto_home_student">
      <button type="button">Back</button>
    </a>
  </main>
</body>
<script>
  window.addEventListener("load",
    function () {
      setTimeout(
        function open(event) {
          document.querySelector(".popup").style.display = "block";
        },
        900
      )
    })

  document.querySelector(" #close").addEventListener("click",
    function () {
      document.querySelector(".popup").style.display = "none";
    });
</script>

</html>

<!-- <%
        //closing connection
    try { rs11.close(); } catch (Exception e) { /* Ignored */ }
    try { stmt.close(); } catch (Exception e) { /* Ignored */ }
    try { con11.close(); } catch (Exception e) { /* Ignored */ }

%> -->