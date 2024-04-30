<!DOCTYPE html>
<html lang="en">

<%
    int n;
    String m=null;
    try
    {
        m=(String)  request.getAttribute("s");
        n=1;
    }
    catch(Exception e)
    {
        n=0;
        m=e.getMessage();
    }
%>

<%if(m!=null){%>
<h2><%=m%></h2>
    <%}%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>

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
            top: 8%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-family: 'Signika', sans-serif;
            font-size: 200%;
        }
        .h2 {
            display: block;
            width: 100%;
            height: 60px;
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
            width: 56%;
            height: 560px;
            border: 2px;
            border-color: black;
            border-radius: 10px;
            padding:20px 20px 30px 20px;
            background-color: rgb(255, 255, 255);
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            position: relative;
            left: 20%;
            top: 30px;
            justify-items: center;
        }

        .con
        {
            padding-left: 20px;
            padding-top: 20px;
        }


        .container input {
            width: 170px;
            height: 30px;
            margin-top: 30px;
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
            margin-left: 50px;
            margin-bottom: 50px;
            font-size: large;
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
            left:40%;
            top:85%;
        }

        button:hover {
            box-shadow: rgba(44, 187, 173, 0.35) 0 -25px 18px -14px inset,rgba(44, 187, 187, 0.25) 0 1px 2px,rgba(44, 182, 187, 0.25) 0 2px 4px,rgba(44, 182, 187, 0.25) 0 4px 8px,rgba(44, 187, 180, 0.25) 0 8px 16px,rgba(44, 187, 187, 0.25) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
        }

        input:hover {
            box-shadow: rgba(44, 187, 173, 0.35) 0 -25px 18px -14px inset,rgba(44, 187, 187, 0.25) 0 1px 2px,rgba(44, 182, 187, 0.25) 0 2px 4px,rgba(44, 182, 187, 0.25) 0 4px 8px,rgba(44, 187, 180, 0.25) 0 8px 16px,rgba(44, 187, 187, 0.25) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
        }

        select:hover {
            box-shadow: rgba(44, 187, 173, 0.35) 0 -25px 18px -14px inset,rgba(44, 187, 187, 0.25) 0 1px 2px,rgba(44, 182, 187, 0.25) 0 2px 4px,rgba(44, 182, 187, 0.25) 0 4px 8px,rgba(44, 187, 180, 0.25) 0 8px 16px,rgba(44, 187, 187, 0.25) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
        }

        select {
            width: 150px;
            background-color: rgb(220, 225, 233);
            border-radius: 4px;
            padding: 8px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            color: #537FE7;
            border:0;
            box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            letter-spacing: 2px;
            background-color: #d9fffa;
        }

        .login{
            display: block;
            position: absolute;
            top: 92%;
            left: 45%;
        }

        a{
            text-decoration: none;
            color: black;
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
        
<%if(m!=null){%>
<h2><%=m%></h2>
    <%}%>
        <form action="registerform" method="post">
            <div class="h2">
                <h2>Registration Form</h2>
            </div>
            <div class="con">
                <label for="username" style="margin-left: 10px;">Username</label>
                <input type="text" placeholder="Enter Username" name="a" required style="margin-left: 13px;"/>
                
                <label for="email" style="margin-left: 30px;">Email Address</label>
                <input type="text" placeholder="abcd@xyz.com" name="c" required />

                <label for="f_nm"style="margin-left: 10px;">First Name</label>
                <input type="text" placeholder="Enter name" name="h" required style="margin-left: 10px;"/>

                <label for="l_nm" style="margin-left: 30px;">Last Name</label>
                <input type="text" placeholder="Enter surname" name="i" required style="margin-left: 23px;" />

                <label for="psw"style="margin-left: 10px;">Password</label>
                <input type="password" placeholder="Enter Password" name="b" required style="margin-left: 17px;"/>

                <label for="psw-repeat"style="margin-left: 5px;">Confirm Password</label>
                <input type="password" placeholder="Password" required />

                <label for="prn" style="margin-left: 10px;">PRN number</label>
                <input type="text" placeholder="Enter PRN" name="e" required />

                <label for="div" style="margin-left: 35px;">Division</label>
                <input type="text" placeholder="A/B/C/D/..." name="g" required style="margin-left: 38px;"/>

                <label for="birthday" style="margin-left: 10px;">Birth Date</label>
                <input type="date" id="birthday" name="j" required style="margin-left: 15px;"/>

                <label for="phno" style="margin-left: 30px;">Phone number</label>
                <input type="text" placeholder="Enter mobile" name="k" required />

                <label for="city" style="margin-left: 10px;">City/Town</label>
                <input type="text" placeholder="Enter your city/town" name="f" required style="margin-left: 13px;"/>

                <label for="year" style="margin-left: 32px;">Select your year</label>
                    <select name="d" id="year">
                        <option value="First Year">First Year</option>
                        <option value="Second Year">Second Year</option>
                        <option value="Third Year">Third Year</option>
                        <option value="Final Year">Final Year</option>
                    </select>

                <br><button class="button-33" id="add" role="button">Register</button>
                
            </div>
        </form>
        <div class="login">
            <a href="Login.html">Login?</a>
        </div>
    </div>
</body>

</html>