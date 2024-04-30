<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String m=(String)  request.getAttribute("user");
%>
<%String s="";%>
  
<%
    int n;
    String msg="";
    
    try
    {
        msg=(String)  request.getAttribute("msg");
        n=1;
    }
    catch(Exception e)
    {
        n=0;
    }
    
%>



<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Signika&display=swap" rel="stylesheet">

    <title>Admin Home Page</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }
        main{
            background-color: #3c4043;
        }
        body{
            background-color: rgb(163, 163, 163);
        }
        .button-17 {
        align-items: center;
        appearance: none;
        background-color: #fff;
        border-radius: 24px;
        border-style: none;
        box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
        box-sizing: border-box;
        color: #3c4043;
        cursor: pointer;
        display:inline;
        fill: currentcolor;
        font-family: "Google Sans",Roboto,Arial,sans-serif;
        font-size: 30px;
        font-weight: 500;
        height: 100px;
        justify-content: center;
        letter-spacing: .25px;
        line-height: normal;
        max-width: 100%;
        overflow: visible;
        padding: 10px 50px;
        position: relative;
        text-align: center;
        text-transform: none;
        transition: box-shadow 280ms cubic-bezier(.4, 0, .2, 1),opacity 15ms linear 30ms,transform 270ms cubic-bezier(0, 0, .2, 1) 0ms;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
        width: auto;
        will-change: transform,opacity;
        /* z-index: 0; */
        margin-top: 50px;
        }

        .button-17:hover {
        background: #F6F9FE;
        color: #174ea6;
        }

        .button-17:active {
        box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
        outline: none;
        }

        .button-17:focus {
        outline: none;
        border: 2px solid #4285f4;
        }

        .button-17:not(:disabled) {
        box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
        }

        .button-17:not(:disabled):hover {
        box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
        }

        .button-17:not(:disabled):focus {
        box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
        }

        .button-17:not(:disabled):active {
        box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
        }

        .button-17:disabled {
        box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
        }

        h2{
            font-family: 'Signika', sans-serif;
            font-size: 60px;
            display: block;
            color: #ffffff;
        }
        
        .btns{
            /* background-color: #174ea6; */
            display: block;
            position: absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width:80%;
        }
        .btn{
            display: block;
            position: absolute;
            top:90%;
            left: 85%;
            transform: translate(-50%, -50%);
            width:80%;
        }

        .button-33 {
        background-color: #c2fbd7;
        border-radius: 100px;
        box-shadow: rgba(44, 142, 187, 0.2) 0 -25px 18px -14px inset,rgba(44, 146, 187, 0.15) 0 1px 2px,rgba(44, 142, 187, 0.15) 0 2px 4px,rgba(44, 158, 187, 0.15) 0 4px 8px,rgba(44, 137, 187, 0.15) 0 8px 16px,rgba(44, 139, 187, 0.15) 0 16px 32px;
        color: rgb(0, 79, 128);
        cursor: pointer;
        display: inline-block;
        font-family: CerebriSans-Regular,-apple-system,system-ui,Roboto,sans-serif;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        transition: all 250ms;
        border: 0;
        font-size: 20px;
        font-weight: 1700px;
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
        }

        .button-33:hover {
        box-shadow: rgba(44, 139, 187, 0.35) 0 -25px 18px -14px inset,rgba(44, 120, 187, 0.25) 0 1px 2px,rgba(44, 142, 187, 0.25) 0 2px 4px,rgba(44, 146, 187, 0.25) 0 4px 8px,rgba(44, 139, 187, 0.25) 0 8px 16px,rgba(44, 132, 187, 0.25) 0 16px 32px;
        transform: scale(1.05) rotate(-1deg);
        }
        a{
            text-decoration: none;
        }

/* ============= Animation background ========= */
.background {
  background: linear-gradient(132deg, #FC415A, #591BC5, #212335);
  background-size: 400% 400%;
  animation: Gradient 15s ease infinite;
  position: relative;
  height: 100vh;
  width: 100%;
  overflow: hidden;
  padding:0;
  margin:0px;
}
.cube {
  position: absolute;
  top: 80vh;
  left: 45vw;
  width: 10px;
  height: 10px;
  border: solid 1px #D7D4E4;
  transform-origin: top left;
  transform: scale(0) rotate(0deg) translate(-50%, -50%);
  animation: cube 12s ease-in forwards infinite;
}
.cube:nth-child(2n) {
  border-color: #FFF ;
}
.cube:nth-child(2) {
  animation-delay: 2s;
  left: 25vw;
  top: 40vh;
}
.cube:nth-child(3) {
  animation-delay: 4s;
  left: 75vw;
  top: 50vh;
}
.cube:nth-child(4) {
  animation-delay: 6s;
  left: 90vw;
  top: 10vh;
}
.cube:nth-child(5) {
  animation-delay: 8s;
  left: 10vw;
  top: 85vh;
}
.cube:nth-child(6) {
  animation-delay: 10s;
  left: 50vw;
  top: 10vh;
}

/* Animate Background*/
@keyframes Gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
@keyframes cube {
  from {
    transform: scale(0) rotate(0deg) translate(-50%, -50%);
    opacity: 1;
  }
  to {
    transform: scale(20) rotate(960deg) translate(-50%, -50%);
    opacity: 0;
  }
}

    .popup {
        background-color: #ffffff;;
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
        margin-left: 350px;
        
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
     <%if(msg!=null && msg!=""){%>
          <div class="popup">
            <button id="close">&times</button>
            <p><%=msg%></p>
          </div>
        <%}%>
    <main class="background">
        <div class="cube"></div>
        <div class="cube"></div>
        <div class="cube"></div>
        <div class="cube"></div>
        <div class="cube"></div>
        <h2 align="center">Welcome, Admin</h2>
        <div class="btns">

            <span>
                <a href="afs_admin">
                    <button class="button-17" role="button" style="margin-left: 200px;">Courses and Teachers</button>
                </a>
            </span>
            <span>
                <a href="show_students">
                    <button class="button-17" role="button" style="margin-left: 100px;">Students</button>
                </a>
            </span>
            <span>
                <a href="#">
                    <button class="button-17" role="button" style="margin-left: 200px;">Remove Course</button>
                </a>
            </span>
            <span>
                <a href="remove_student">
                    <button class="button-17" role="button" style="margin-left: 90px;">Remove Student</button>
                </a>
            </span>
            <span>
                <a href="#">
                    <button class="button-17" role="button" style="margin-left: 200px;">Add New Student</button>
                </a>
            </span>
            <span>
                <a href="add_new_teacher">
                    <button class="button-17" role="button" style="margin-left: 60px;">Add New Teacher</button>
                </a>
            </span>        
        </div>
        <div class="btn">
            <!-- <span> -->
                <a href="register">
                    <button class="button-33" role="button">Logout</button>
                </a>
            <!-- </span> -->
        </div>
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
        );
      });
  
    document.querySelector(" #close").addEventListener("click",
      function () {
        document.querySelector(".popup").style.display = "none";
      });
  </script>

</html>