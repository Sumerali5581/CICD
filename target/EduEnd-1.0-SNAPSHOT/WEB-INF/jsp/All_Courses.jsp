<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Courses</title>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"> -->
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
        background: url(https://i0.wp.com/positivityblossoms.com/wp-content/uploads/2020/10/3.png?resize=1080%2C600&ssl=1) center / cover;
      }

      table, th, td{
        padding: 1rem 5rem ;
        text-align: left;
      }

      .table{
        width: 82vw;
        height: 90vh;
        background-color: rgba(0, 255, 187, 0);
        backdrop-filter: blur(7px);
        box-shadow: 0 .4rem .8rem #0005;
        border-radius: .8rem;

        overflow: hidden;
      }

      .table_header{
        width: 100%;
        height: 10%;
        background-color: rgba(255, 255, 255, 0);
        padding: 0.8rem 1rem;
        color: #ffffff;
        font-size: 30px;
        top: 10px;
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
        background-color:#537FE7;
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
        background-color: #537FE7;
        font-size: 15px;
      }
      button:hover{
        background-color: #537FE7;
        font-size: 16px;
      }

      body {
          background: -moz-linear-gradient(45deg, #02e1ba 0%, #26c9f2 29%, #d911f2 66%, #ffa079 100%);
          background: -webkit-linear-gradient(45deg, #02e1ba 0%,#26c9f2 29%,#d911f2 66%,#ffa079 100%);
          background: linear-gradient(45deg, #02e1ba 0%,#26c9f2 29%,#d911f2 66%,#ffa079 100%);
          background-size: 400% 400%;
          -webkit-animation: Gradient 15s ease infinite;
        -moz-animation: Gradient 15s ease infinite;
        animation: Gradient 15s ease infinite;
        min-height: calc(100vh - 2rem);
        display: flex;
        flex-direction: column;
        align-items: stretch;
        justify-content:space-between;
        overflow: hidden;
        position: relative; 
        top: 45px;
        left: 130px;
      }

      body::before, 
      body::after {
        content: "";
        width: 70vmax;
        height: 70vmax;
        position: absolute;
        background: rgba(255, 255, 255, 0.07);
        left: -20vmin;
        top: -20vmin;
        animation: morph 15s linear infinite alternate, spin 20s linear infinite;
        z-index: 1;
        will-change: border-radius, transform;
        transform-origin: 55% 55%;
        pointer-events: none; 
      }
        
      body::after {
          width: 70vmin;
          height: 70vmin;
          left: auto;
          right: -10vmin;
          top: auto;
          bottom: 0;
          animation: morph 10s linear infinite alternate, spin 26s linear infinite reverse;
          transform-origin: 20% 20%; 
      }

      @-webkit-keyframes Gradient {
        0% {
          background-position: 0 50%
        }
        50% {
          background-position: 100% 50%
        }
        100% {
          background-position: 0 50%
        }
      }

      @-moz-keyframes Gradient {
        0% {
          background-position: 0 50%
        }
        50% {
          background-position: 100% 50%
        }
        100% {
          background-position: 0 50%
        }
      }

      @keyframes Gradient {
        0% {
          background-position: 0 50%
        }
        50% {
          background-position: 100% 50%
        }
        100% {
          background-position: 0 50%
        }
      }

      @keyframes morph {
        0% {
          border-radius: 40% 60% 60% 40% / 70% 30% 70% 30%; }
        100% {
          border-radius: 40% 60%; } 
      }

      @keyframes spin {
        to {
          transform: rotate(1turn); 
        } 
      }
        .st0{display:none;}
        .st1{display:inline;}
        .st2{opacity:0.29;}
        .st3{fill:#FFFFFF;}
        .st4{clip-path:url(#SVGID_2_);fill:#FFFFFF;}
        .st5{clip-path:url(#SVGID_4_);}
        .st6{clip-path:url(#SVGID_6_);}
        .st7{clip-path:url(#SVGID_8_);}
        .st8{clip-path:url(#SVGID_10_);}
        .st9{fill:none;}
        .st10{clip-path:url(#SVGID_12_);}
        .st11{opacity:0.7;}
        .st12{clip-path:url(#SVGID_14_);}
        .st13{opacity:0.2;}
        .st14{clip-path:url(#SVGID_16_);}
        .st15{opacity:0.3;fill:#FFFFFF;enable-background:new    ;
      }

      button {
            /* border: 1px snow solid;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            color:rgb(43, 43, 43);
            font-weight: 900;
            padding: 15px 60px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            letter-spacing: 1px;
            margin-left: 50px;
            margin-top: 30px;
            margin-bottom: 30px ;
            cursor: pointer; */

            background-color: #c2f4fb;
            border-radius: 100px;
            box-shadow: rgba(44, 165, 187, 0.2) 0 -25px 18px -14px inset,rgba(44, 187, 173, 0.15) 0 1px 2px,rgba(44, 187, 182, 0.15) 0 2px 4px,rgba(44, 187, 182, 0.15) 0 4px 8px,rgba(44, 180, 187, 0.15) 0 8px 16px,rgba(44, 187, 187, 0.15) 0 16px 32px;
            color: #537FE7;
            cursor: pointer;
            display: inline-block;
            font-family: sans-serif;
            font-weight: 700;
            padding: 8px 30px;
            text-align: center;
            text-decoration: none;
            transition: all 250ms;
            border: 0;
            font-size: 18px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            display: block;
            position: absolute;
            left:1%;
            top:88%;
        }

        button:hover {
            box-shadow: rgba(44, 187, 173, 0.35) 0 -25px 18px -14px inset,rgba(44, 187, 187, 0.25) 0 1px 2px,rgba(44, 182, 187, 0.25) 0 2px 4px,rgba(44, 182, 187, 0.25) 0 4px 8px,rgba(44, 187, 180, 0.25) 0 8px 16px,rgba(44, 187, 187, 0.25) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
            color: #FFFFFF;
        }
    </style>
</head>
<body>
    <main class="table">

        <%    
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con11=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_manage", "root", "root");

            String s="select * from all_courses";
            PreparedStatement stmt=con11.prepareStatement(s);
            ResultSet rs=stmt.executeQuery();
        %>

      <section class="table_header">
        <h1 align="center">Courses</h1>
      </section>
      <section class="table_body">
        <table>
          <thead>
            <tr>
              <th>Courses</th>
              <th>Faculty</th>
            </tr>
          </thead>
          <tbody>
            <%while(rs.next()) {%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                </tr>
            <% } %>
          </tbody>
        </table>
      </section>
      <a
        href="goto_home_student">
        <button class="button-33" id="add" role="button">Back</button> 
      </a>
    </main>
</body>
</html>
<%
        //closing connection
    try { rs.close(); } catch (Exception e) { /* Ignored */ }
    try { stmt.close(); } catch (Exception e) { /* Ignored */ }
    try { con11.close(); } catch (Exception e) { /* Ignored */ }

%>