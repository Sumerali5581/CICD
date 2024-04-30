<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


  
<%
    String msg=null;
    
    try
    {
        msg=(String)  request.getAttribute("msg");
    }
    catch(Exception e)
    {
    }
    
%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Home Page</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&family=Kalam:wght@700&family=Kanit&display=swap" rel="stylesheet">
    

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <style>
        *{
            margin: 0;
            padding: 0;
            outline: none;
            border: none;
            text-decoration: none;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }
        /* .bodi
        {
            background:linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.5)), url(https://i0.wp.com/positivityblossoms.com/wp-content/uploads/2020/10/3.png?resize=1080%2C600&ssl=1);
            background-size: cover;
            width: 100vw;
            height: 100vh;
            position: relative;
            background-color: rgba(0, 0, 0, 0.3);
        } */
        nav
        {
            position: absolute;
            top:0;
            bottom: 0;
            height: 100%;
            left:0;
            background:rgb(255, 255, 255);
            border: 3px rgba(175, 232, 255, 0.4) solid;
            border-radius: 6px;
            width: 110px;
            height: 100vh;
            overflow: hidden;
            transition: width 0.2s linear;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.5);
        }
        .logo{
            text-align: center;
            display: flex;
            transition: all 0.5s ease;
            margin: 10px 0 0 5px; 
            width: 273px;
        }
        .logo img{
            width: 80px;
            border-radius: 10%;
        }
        .logo span{
            font-weight: bold;
            padding-left: 15px;
            font-size: 18px;
            text-transform: uppercase;
        }
        a{
            position: relative;
            color: #537FE7;
            font-size: 4px;
            display: table;
            width: 290px;
            padding: 10px;
        }
        .material-symbols-outlined{
            position: relative;
            width: 70px;
            height: 40px;
            top: 14px;
            font-size: 40px;
            text-align: center;
            color:#537FE7;
            padding-left: 15px;
        }
        .nav-item{
            font-size: 20px;
            position: relative; 
            top: 3px;
            margin-left: 28px;
            font-family: 'Kanit', sans-serif;
            /* vertical-align: middle; */
        }
        a:hover{
            background: #537fe73f;
            border: 2px rgba(0, 104, 141, 0.3) solid;
            border-radius: 5px;
            color: #537FE7;
            width: 295px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.197);
            margin-left: 5px;
            text-decoration: none;
            font-size: 18px;
        }
        nav:hover{
            width: 310px;
            transition: all 0.5s ease;
        }
        .welcome{
            width: 100%;
            height: 100%;
            font-size: 26px;
            color: white;
            display: flex;
            justify-content:center;
            flex-direction:column;
            align-items: center;
            background-color: rgba(0,0,0,0.3);
        }
        /*@import url('https://fonts.googleapis.com/css?family=Exo:400,700');*/

*{
    margin: 0px;
    padding: 0px;
}

body{
    font-family: 'Exo', sans-serif;
}


.context {
    width: 100%;
    position: absolute;
    top:50vh;
    
}

.context h1{
    text-align: center;
    color: #fff;
    font-size: 50px;
}


.area{
    background: #4e54c8;  
    background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);  
    width: 100%;
    height:100vh;
    
   
}

.circles{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.circles li{
    position: absolute;
    display: block;
    list-style: none;
    width: 20px;
    height: 20px;
    background: rgba(255, 255, 255, 0.2);
    animation: animate 25s linear infinite;
    bottom: -150px;
    
}

.circles li:nth-child(1){
    left: 25%;
    width: 80px;
    height: 80px;
    animation-delay: 0s;
}


.circles li:nth-child(2){
    left: 10%;
    width: 20px;
    height: 20px;
    animation-delay: 2s;
    animation-duration: 12s;
}

.circles li:nth-child(3){
    left: 70%;
    width: 20px;
    height: 20px;
    animation-delay: 4s;
}

.circles li:nth-child(4){
    left: 40%;
    width: 60px;
    height: 60px;
    animation-delay: 0s;
    animation-duration: 18s;
}

.circles li:nth-child(5){
    left: 65%;
    width: 20px;
    height: 20px;
    animation-delay: 0s;
}

.circles li:nth-child(6){
    left: 75%;
    width: 110px;
    height: 110px;
    animation-delay: 3s;
}

.circles li:nth-child(7){
    left: 35%;
    width: 150px;
    height: 150px;
    animation-delay: 7s;
}

.circles li:nth-child(8){
    left: 50%;
    width: 25px;
    height: 25px;
    animation-delay: 15s;
    animation-duration: 45s;
}

.circles li:nth-child(9){
    left: 20%;
    width: 15px;
    height: 15px;
    animation-delay: 2s;
    animation-duration: 35s;
}

.circles li:nth-child(10){
    left: 85%;
    width: 150px;
    height: 150px;
    animation-delay: 0s;
    animation-duration: 11s;
}



        .popup {
            background-color: #ffffff;
            ;
            width: 450px;
            padding: 10px 40px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            border-radius: 8px;
            display: none;

            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            z-index: 1;
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

        .popup p {
            display: flex;
            margin-bottom: 40px;
            justify-content: center;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: 30px;
        }

        #close {
            font-size: 35px;
            color: red;
            margin-left: 350px;

            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        #close:hover {
            font-size: 37px;
            background-color: antiquewhite;
        }
@keyframes animate {

    0%{
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }

    100%{
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
        border-radius: 50%;
    }

}


.msg {
        position: absolute;
        top: 30px;
        left: 900px;
      }

.message {
        width: 250px;
        height: 40px;
        border-radius: 30px 0 0 30px;
        padding: 10px;
      }

      .msg1 {
        position: absolute;
        top: 30px;
        left: 1152px;
      }

      .message1 {
        width: 80px;
        height: 40px;
        border-radius: 0 30px 30px 0;
        padding: 5px;
        font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        font-size: 20px;
        color: #4e54c8;
      }
    </style>
</head>
<body>
    <div class="area">
        
         <%if(msg!="" && msg!=null){%>
        <div class="popup">
          <button id="close">&times</button>
          <p><%=msg%></p>
        </div>
      <%}%>
        
        <ul class="circles">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
        
        
        
        <nav>
            <ul>
                <li>
                    <a href="#" class="logo">
                        <img src="img/logo1.png" alt="logo" width="600px">
                        <span style="font-family: 'Kalam', cursive;">Education Made Smart</span>
                    </a>
                </li>
                <li>
                    <a href="profileTeach">
                        <span class="material-symbols-outlined">
                            person
                        </span>
                        <span class="nav-item">Profile</span>
                    </a>
                </li>
                <li>
                    <a href="view_stud_byTeacher">
                        <span class="material-symbols-outlined">
                            groups
                        </span>
                        <span class="nav-item">All Students</span>
                    </a>
                </li>
                <li>
                    <a href="view_your_students">
                        <span class="material-symbols-outlined">
                            diversity_3
                        </span>
                        <span class="nav-item">Your Students</span>
                    </a>
                </li>
                <li>
                    <a href="add_new_student_byTeach">
                        <span class="material-symbols-outlined">
                            group_add
                        </span>
                        <span class="nav-item">Add Student</span>
                    </a>
                </li>
                <li>
                    <a href="removeByTeacher">
                        <span class="material-symbols-outlined">
                            group_remove
                        </span>
                        <span class="nav-item">Remove Student</span>
                    </a></li>
                <li>
                    <a href="#">
                        <span class="material-symbols-outlined">
                            settings
                        </span>
                        <span class="nav-item">Settings</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="material-symbols-outlined">
                            help
                        </span>
                        <span class="nav-item">Help</span>
                    </a>
                </li>
                <li>
                    <a href="register">
                        <span class="material-symbols-outlined">
                            logout
                        </span>
                        <span class="nav-item">Logout</span>
                    </a>
                </li>
            </ul>
        </nav>
         
        
        
        
        
<!--        <form action="send_msg" method="post">
        <div class="msg">
          <input
            type="text"
             placeholder="Send Message to All Students"
             name="msg"
            class="message"
            required
           />
          
        </div>-->
            
<!--        <div class="msg1">
          <button class="message1" id="clearButton" onclick="clearTextarea()">
            Send
          </button>
        </div>
      </form>-->
        
        
        
        
        
        <div class="welcome">
            <p style="font-family: 'Ubuntu', sans-serif; font-size: 70px; color: rgba(218, 248, 224, 0.7); text-shadow: 2px 7px 5px rgba(0,0,0,0.3), 
            0px -4px 10px rgba(255,255,255,0.3);">Welcome</p>
        </div>
    </div>  
    
    
    
    
    
     <script>
      function clearTextarea() {
        document.getElementById("myTextarea").value = "";
      }
      
      
        
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
</body>


</html>