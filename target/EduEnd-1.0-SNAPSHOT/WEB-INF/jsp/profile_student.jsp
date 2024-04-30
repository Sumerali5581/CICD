<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user=(String)  request.getAttribute("user");
    String email=(String)  request.getAttribute("email");
    String year=(String)  request.getAttribute("year");
    String prn=(String)  request.getAttribute("prn");
    String city=(String)  request.getAttribute("city");
    String div=(String)  request.getAttribute("div");
    
    String f_nm=(String)  request.getAttribute("f_nm");
    String l_nm=(String)  request.getAttribute("l_nm");
    String dob=(String)  request.getAttribute("dob");
    String phno=(String)  request.getAttribute("phno");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Signika&display=swap" rel="stylesheet">
    
    
    <title>Profile Page</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
/*        body{
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url(https://miro.medium.com/max/1400/0*hDAyhnOx767w5qma.jpg);
        }*/
        body{
            /*background:linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)), url(https://wallpaperaccess.com/full/378757.png);*/
            /*background-size: cover;*/
            /*width: 100vw;*/
            display: flex;
            max-height: 600px;
            justify-content: center;
            align-items: center;
            background-color: #537FE7;     
            /*position: relative;*/
/*            background-color: rgba(0, 0, 0, 0.3);*/
        }

        .main{
            margin-top: 30px;
        width: 82vw;
        height: 90vh;
        background-color: rgba(0, 0, 0, 0.494);
        backdrop-filter: blur(7px);
        box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;
        border-radius: 100px;
        display: block;
        }
        .pImage{
            margin-top: 2%;
            display: block;
        }
        .pImage img{
            border: 4px rgb(255, 255, 255) solid;
            border-radius: 50%;
            width: 150px;
            height: 150px;        
            position: absolute;
            top: 15%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: block;   
        }
        #uname{
            color: rgb(255, 255, 255);
            font-size: larger;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            position: absolute;
            top: 35%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: block;
        }
        .info{
            display: block;
            background-color: rgba(255, 255, 255, 0.816);
            position: absolute;
            top: 67%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 90%;
            border-radius: 10px;
            height: 50%;
            box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px 0px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px 0px inset;
        }
        .info1{
            float: left;
            display: grid;
            margin-left: 8%;
        }
        .info2{
            float: left ;
            display: grid;
            margin-left: 35%;
        }
        .data{
            /* background-color: #a5a5a5; */
            padding: 25px;
            font-family: 'Signika', sans-serif;
            color: rgb(26, 45, 46);
        }
      button
      {
      text-align: center;
      width: 100px;
      height: 35px;
      margin: 47% 45%;
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
    </style>
</head>
<body>
    <main class="main">
        <span class="pImage">
            <img src="https://cdn1.iconfinder.com/data/icons/technology-devices-2/100/Profile-512.png" alt="pImage">
            <div id="uname"><%=user%></div>
        </span>
        <div class="info">            
            <div class="info1">
                <span class="data">Name : <%=f_nm%> <%=l_nm%></span>
                <span class="data">Email : <%=email%></span>
                <span class="data">PRN : <%=prn%></span>
                <span class="data">Year : <%=year%></span>
            </div>
            <div class="info2">
                <span class="data">Division : <%=div%></span>
                <span class="data">City : <%=city%></span>
                <span class="data">Date of Birth : <%=dob%></span>
                <span class="data">Phone number : <%=phno%></span>
            </div>
        </div>
            <a href="goto_home_student"><button  type="button">Back</button></a>
    </main>
</body>
</html>