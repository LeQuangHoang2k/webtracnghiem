<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <style type="text/css">
  	<%@ include file="main.css" %>
  	<%@ include file="WEB-INF/font-awesome/css/fontawesome.min.css" %>
  </style>
</head>

<body>
  <section>
    <div class="container">
      <div class="user signinBx">
        <div class="formBx" id="login">
          <form action="<%= request.getContextPath()%>/login" method="POST">
            <h2>Login</h2>
            <input type="text" name="username" placeholder="Username" />
            <input type="password" name="password" placeholder="Password" id="password" />
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Submit" />
            </div>
            <p class="signup">Don't have account ?<a onclick="toggleForm();">Register now</a></p>
            <p class="signup">Forget password ?<a onclick="Form()">Click here.</a>
            </p>
            <div class="text-area">
              <p class="or"><span class="or">Or Login </span></p>
              <a href=""><i class="fab fa-facebook" aria-hidden="true"></i></a>
              <a href=""><i class="fab fa-google" aria-hidden="true"></i></a>
            </div>
          </form>
        </div>
      </div>

      <div class="user signupBx">
        <div class="formBx">
          <form action="<%= request.getContextPath()%>/register" method="POST">
            <h2>Register</h2>
            <input type="text" name="name" placeholder="Name" />
            <input type="email" name="email" placeholder="Your Email" />
            <input type="tel" name="phone" placeholder="Your Phone" />
            <input type="text" name="username" placeholder="Username" />
            <input type="password" name="password" placeholder="New Password" />
            <!--<input type="password" placeholder="Confirm Password" />-->
            <div style="display: flex;justify-content: space-between;">
              <input type="button" value="<<" onclick="toggleForm()" />
              <input type="submit" value="Submit">
            </div>
            <!-- <p class="signup">
              Already have account ?<a href="#" onclick="toggleForm()">Login.</a>
            </p> -->
            <!-- <div class="text-area">
                <p class="or"><span class="or">Or Signup</span></p>
                <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href=""><i class="fa fa-google" aria-hidden="true"></i></a>
              </div> -->
          </form>
        </div>
      </div>

      <div class="user forgotBx">
        <div class="formBx">
          <form action="<%= request.getContextPath()%>/forgot" method="post">
            <h2>Reset Password</h2>
            <input type="email" name="email" placeholder="Your Email" />
            <input type="tel" name="phone " placeholder="Your Phone" />
            <input type="text" name="username" placeholder="Username" />
            <input type="password" name="password" placeholder="New Password" />
            <input type="password" placeholder="Confirm Password" />
            <div style="display:flex;justify-content: space-between;">
              <input type="button" value="<<" onclick="Form()" />
              <input type="submit" value="Submit">
            </div>
            <!-- <p class="signup">
                Already have account ?<a href="#" 
                  >LogIn.</a
                >
              </p>
              <div class="text-area">
                <p class="or"><span class="or">Or Signup</span></p>
                <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href=""><i class="fa fa-google" aria-hidden="true"></i></a>
              </div> -->
          </form>
        </div>
      </div>

    </div>

  </section>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <script>
    function toggleForm() {
      var container = document.querySelector(".container");
      container.classList.toggle("active");
    };

    function Form() {
      var container = document.querySelector(".container");
      container.classList.toggle("activate");
    };

  </script>

</body>

</html>