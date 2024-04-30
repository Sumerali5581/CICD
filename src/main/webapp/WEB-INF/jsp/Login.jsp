<!DOCTYPE html>
<html lang="en">


<%
    String msg=null;
    try
    {
        msg=(String)  request.getAttribute("msg");
    }
    catch(Exception e)
    {
        msg=null;
    }
%>



    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&family=Rubik:wght@700&family=Signika&display=swap"
        rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        svg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            display: block;
            background-color: #0e4166;
            background-image: linear-gradient(to bottom, rgba(14, 65, 102, 0.86), #0e4166);
        }

        h2{
            display: block;
            position: absolute;
            top: 11%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-family: 'Signika', sans-serif;
            font-size: 150%;
        }
        .h2 {
            display: block;
            width: 100%;
            height: 40px;
            background: linear-gradient(334deg, #6b97f7, #7525e2, #f7137e);
            background-size: 180% 180%;
            animation: gradient-animation 6s ease infinite;
            border-radius: 10px;
        }

        @keyframes h2-animation {
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

        .container {
            width: 20%;
            height: 300px;
            border: 2px;
            border-color: black;
            border-radius: 10px;
            padding: 20px 20px 30px 20px;
            background-color: rgb(255, 255, 255);
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
        }

        
        .con{
            padding-left: 10px;
            padding-top: 20px;
        }




        .container input {
            width: 70%;
            height: 30px;
            /* margin-bottom: 20px;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 0px 30px;
            letter-spacing: 2px;
            color: rgba(240, 248, 255,0.5);
            border: 1px rgb(156, 152, 152) solid; */

            /* width: 180px;
            height: 30px; */
            margin-bottom: 30px;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 0px 30px;
            letter-spacing: 2px;
            color: #537FE7;
            border:0;
            box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            letter-spacing: 2px;
            background-color: #d9fffa;
        }

        label {
            font-family: 'Signika', sans-serif;
            margin-left: 70px;
            margin-bottom: 50px;     
            font-size: large;
        }

        button {
            /* border: 1px snow solid;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            color:rgb(43, 43, 43);
            font-weight: 900;
            padding: 10px 20px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            letter-spacing: 1px;
            margin-top: 30px;
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
            left:34%;
            top:75%;
        }

        button:hover {
            box-shadow: rgba(44, 187, 173, 0.35) 0 -25px 18px -14px inset,rgba(44, 187, 187, 0.25) 0 1px 2px,rgba(44, 182, 187, 0.25) 0 2px 4px,rgba(44, 182, 187, 0.25) 0 4px 8px,rgba(44, 187, 180, 0.25) 0 8px 16px,rgba(44, 187, 187, 0.25) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
        }

        input:hover {
            box-shadow: rgba(44, 187, 173, 0.35) 0 -25px 18px -14px inset,rgba(44, 187, 187, 0.25) 0 1px 2px,rgba(44, 182, 187, 0.25) 0 2px 4px,rgba(44, 182, 187, 0.25) 0 4px 8px,rgba(44, 187, 180, 0.25) 0 8px 16px,rgba(44, 187, 187, 0.25) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
        }

        .login{
            display: block;
            position: absolute;
            top: 89%;
            left: 39%;
        }

        a{
            text-decoration: none;
            color: black;   
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
    
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="100%" height="100%" viewBox="0 0 1600 900" preserveAspectRatio="xMidYMax slice">
		<defs>
			<linearGradient id="bg">
				<stop offset="0%" style="stop-color:rgba(130, 158, 249, 0.06)"></stop>
				<stop offset="50%" style="stop-color:rgba(76, 190, 255, 0.6)"></stop>
				<stop offset="100%" style="stop-color:rgba(115, 209, 72, 0.2)"></stop>
			</linearGradient>
			<path id="wave" fill="url(#bg)" d="M-363.852,502.589c0,0,236.988-41.997,505.475,0
	s371.981,38.998,575.971,0s293.985-39.278,505.474,5.859s493.475,48.368,716.963-4.995v560.106H-363.852V502.589z" />
		</defs>
		<g>
			<use xlink:href='#wave' opacity=".3">
				<animateTransform
          attributeName="transform"
          attributeType="XML"
          type="translate"
          dur="10s"
          calcMode="spline"
          values="270 230; -334 180; 270 230"
          keyTimes="0; .5; 1"
          keySplines="0.42, 0, 0.58, 1.0;0.42, 0, 0.58, 1.0"
          repeatCount="indefinite" />
			</use>
			<use xlink:href='#wave' opacity=".6">
				<animateTransform
          attributeName="transform"
          attributeType="XML"
          type="translate"
          dur="8s"
          calcMode="spline"
          values="-270 230;243 220;-270 230"
          keyTimes="0; .6; 1"
          keySplines="0.42, 0, 0.58, 1.0;0.42, 0, 0.58, 1.0"
          repeatCount="indefinite" />
			</use>
			<use xlink:href='#wave' opacty=".9">
				<animateTransform
          attributeName="transform"
          attributeType="XML"
          type="translate"
          dur="6s"
          calcMode="spline"
          values="0 230;-140 200;0 230"
          keyTimes="0; .4; 1"
          keySplines="0.42, 0, 0.58, 1.0;0.42, 0, 0.58, 1.0"
          repeatCount="indefinite" />
			</use>
		</g>
	</svg>
    <div class="container">
        
        <%if(msg!=null){%>
          <div class="popup">
            <button id="close">&times</button>
            <p><%=msg%></p>
          </div>
        <%}%>
        
        
        <form action="loginform" method="post">
            <div class="h2">
                <h2>Login Form</h2>
            </div>
            <div class="con">
                <label for="username" style="margin-left: 10px;">Username</label>
                <input type="text" placeholder="Enter Username" name="a" required style="margin-left: 13px;"/>
                
                <label for="psw"style="margin-left: 10px;">Password</label>
                <input type="password" placeholder="Enter Password" name="b" required style="margin-left: 17px;"/>

                <br><button class="button-33" id="add" role="button">Login</button>
                
            </div>
        </form>
        <div class="login">
            <a href="register">Register?</a>
        </div>
    </div>
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