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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Signika&display=swap" rel="stylesheet">
    <title>Add Teacher</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            /* background-color: rgb(255, 255, 235); */
        }

        .h2 {
            width: 100vw;
            height: 100vh;
            background: linear-gradient(334deg, #6b97f7, #7525e2, #f7137e);
            background-size: 180% 180%;
            animation: gradient-animation 6s ease infinite;
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

        .main{
            background-color: white;
            width: 30%;
            height: 80%;
            display: block;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 20px;
            /* border: 1px red solid; */
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
        }
        h2{
            display: block;
            position: absolute;
            top: 6%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-family: 'Signika', sans-serif;
            font-size: 200%;
        }
        .h2{
            display: block;
            /* position: absolute;
            top: 4%;
            left: 50%;
            transform: translate(-50%, -50%); */
            border-radius: 20px 20px 0 0;
            background-color: #537FE7;
            height: 60px;
            width: 100%;
        }
        .inps{
            display: flex;
            flex-wrap: wrap;
            /* position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); */
            padding: 20px 0 0 20px;
        }
        label{
            font-family: 'Signika', sans-serif;
            margin-left: 50px;
            margin-bottom: 50px;
            font-size: larger;
        }

        input{
            height: 25px;
            width: 70%;
            padding: 4px 50px 4px 10px;
            border-radius: 8px;
            margin: 0 0 7px 0;
            color: #537FE7;
            border:0;
            box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            letter-spacing: 2px;
            background-color: #d9fffa;
        }
        
        #add {
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
            left:20%;
            top:87%;
        }

        #add:hover {
            box-shadow: rgba(44, 187, 173, 0.35) 0 -25px 18px -14px inset,rgba(44, 187, 187, 0.25) 0 1px 2px,rgba(44, 182, 187, 0.25) 0 2px 4px,rgba(44, 182, 187, 0.25) 0 4px 8px,rgba(44, 187, 180, 0.25) 0 8px 16px,rgba(44, 187, 187, 0.25) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
        }

        #cancel {
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
            left:48%;
            top:87%;
        }

        #cancel:hover {
            box-shadow: rgba(44, 187, 173, 0.35) 0 -25px 18px -14px inset,rgba(44, 187, 187, 0.25) 0 1px 2px,rgba(44, 182, 187, 0.25) 0 2px 4px,rgba(44, 182, 187, 0.25) 0 4px 8px,rgba(44, 187, 180, 0.25) 0 8px 16px,rgba(44, 187, 187, 0.25) 0 16px 32px;
            transform: scale(1.05) rotate(-1deg);
        }
        .popup {
            background-color: rgb(255, 255, 255);
            width: 450px;
            padding: 10px 40px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            border-radius: 8px;
            display: none;
            /* border: 4px lightgreen solid; */
            box-shadow: rgba(251, 255, 0, 0.217) 0px -23px 25px 0px inset, rgba(255, 225, 0, 0.15) 0px -36px 30px 0px inset, rgba(255, 208, 0, 0.1) 0px -79px 40px 0px inset, rgba(251, 255, 0, 0.06) 0px 2px 1px, rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px, rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
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
            font-family: 'Signika', sans-serif;
            font-size: 20px;
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
    <main class="main">
        <%if(msg!=null){%>
            <div class="popup">
              <button id="close">&times</button>
              <p><%=msg%></p>
            </div>
        <%}%>
        <form action="done_add_teacher" method="post">
            <div>
                <div class="h2">
                    <h2>Add Teacher</h2>
                </div>
                <div class="inps">
                    <span class="entry">
                        <label for="#">Username</label><br>
                        <input type="text" placeholder="Enter Userame" name="a" required style="margin-left: 50px;"/>
                    </span>
                    <span class="entry">
                        <label for="#">Teacher Name</label><br>
                        <input type="text" placeholder="Enter Teacher Name" name="b" required style="margin-left: 50px;"/>
                    </span>
                    <span class="entry">
                        <label for="#">Email</label><br>
                        <input type="email" placeholder="Enter Email" name="c" required style="margin-left: 50px;"/>
                    </span>
                    <span class="entry">
                        <label for="#">Password</label><br>
                        <input type="password" placeholder="Enter Password" name="d" required style="margin-left: 50px;"/>
                    </span>
                    <span class="entry">
                        <label for="#">Phone Number</label><br>
                        <input type="text" placeholder="Enter Phone Number" name="e" required style="margin-left: 50px;"/>
                    </span>
                    <span class="entry">
                        <label for="#">Course</label><br>
                        <input type="text" placeholder="Enter Course" name="f" required style="margin-left: 50px;"/>
                    </span>
                </div>
                <button class="button-33" id="add" role="button">Add</button>                
            </div>
        </form>
        <a href="goto_home_admin"> <button class="button-33" id="cancel" role="button">Cancel</button> </a>
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