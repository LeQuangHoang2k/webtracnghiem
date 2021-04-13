<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="google-signin-client_id" content="496509540327-sdht0p2mir6mjjshd0ih9ks54h2k9bq9.apps.googleusercontent.com">
  <title>Website kiểm tra trắc nghiệm nhanh</title>
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
    <center style="color:red">
        <% if (request.getAttribute("message") != null) {out.print(request.getAttribute("message")); } %>
    </center>
      <div class="user signinBx">
        <div class="formBx" id="login">
          <form action="<%= request.getContextPath()%>/login" method="POST">
            <h2>Login</h2>
            <input type="text" name="username" placeholder="Username" />
            <input type="password" name="password" placeholder="Password" id="password" />
            <div style="display:flex;justify-content: center;">
              <input type="submit" value="Submit" />
            </div>
<<<<<<< HEAD
            <p class="signup">Don't have account <a onclick="toggleForm();">Register now</a></p>
=======
            <p class="signup">Don't have account ?<a onclick="toggleForm();">Register now</a></p>
>>>>>>> 29d7a67bb96d660894f2820f8bd3c856f38cd4b1
            <p class="signup">Forget password ?<a onclick="Form()">Click here.</a>
            </p>
            <div class="text-area">
               <!-- <p class="or"><span class="or">Or Login </span></p>
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="google-signin-client_id"
      content="496509540327-sdht0p2mir6mjjshd0ih9ks54h2k9bq9.apps.googleusercontent.com">
    <title>Website kiểm tra trắc nghiệm nhanh</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
      <%@ include file="main.css"%><%@ include file="WEB-INF/font-awesome/css/fontawesome.min.css"%>
    </style>
  </head>

  <body>
    <section>
      <div class="container">
        <center id="serverResponse" style="color:red"></center>
        <div class="user signinBx">
          <div class="formBx" id="login">
            <form id="formLogin" method="post">
              <h2>Login</h2>
              <input type="text" name="username" id="usernameLogin" placeholder="Username" />
              <input type="password" name="password" id="passwordLogin" placeholder="Password" id="password" />
              <div style="display:flex;justify-content: center;">
                <input type="submit" value="Submit" />
              </div>
              <p class="signup">Don't have account ?<a onclick="toggleForm();">Register now</a></p>
              <p class="signup">Forget password ?<a onclick="Form()">Click here.</a>
              </p>
              <div class="text-area">
                <!-- <p class="or"><span class="or">Or Login </span></p>
>>>>>>> 73f7ef2403573632780afc400ffba728a81eb3e7
              
          		<a data-onsuccess="onSignIn"><i class="fab fa-facebook" aria-hidden="true"></i></a>
              	<a  class="g-signin2" data-onsuccess="onSignIn"><i class="fab fa-google" aria-hidden="true"></i></a>
              	<div class="g-signin2" style="background-color: red" data-onsuccess="onSignIn">1</div>
               -->
              </div>
            </form>
          </div>
        </div>

        <div class="user signupBx">
          <div class="formBx">
            <form id="formRegister" method="post">
              <h2>Register</h2>
              <input type="text" name="name" id="nameRegister" placeholder="Name" />
              <input type="email" name="email" id="emailRegister" placeholder="Your Email" />
              <input type="text" name="phone" id="phoneRegister" placeholder="Your Phone" />
              <input type="text" name="username" id="usernameRegister" placeholder="Username" />
              <input type="password" name="password" id="passwordRegister" placeholder="New Password" />
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
            <form id="formForgot" method="POST">
              <h2>Reset Password</h2>
              <input type="email" name="email" id="emailForgot" placeholder="Your Email" />
              <input type="text" name="phone" id="phoneForgot" placeholder="Your Phone" />
              <input type="text" name="username" id="usernameForgot" placeholder="Username" />
              <input type="password" name="password" id="passwordForgot" placeholder="New Password" />
              <input type="password" name="passwordConfirm" id="passwordConfirmForgot" placeholder="Confirm Password" />
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
      if (document.cookie.length > 0) window.location.href = "http://localhost:4000";
      console.log(document.cookie + " here");

      function toggleForm() {
        var container = document.querySelector(".container");
        container.classList.toggle("active");
      };

      function Form() {
        var container = document.querySelector(".container");
        container.classList.toggle("activate");
      };

      $(document).ready(() => {
        $('#formRegister').submit((event) => {
          event.preventDefault();

          $.post({
            url: 'register',
            dataType: 'json',
            data: $('#formRegister').serialize(),
            success: (res) => {
              //alert("Register :" + res.message);
              $("#serverResponse").text(res.message);
              if (res.message !== "success") return

              $("#nameRegister").val("");
              $("#emailRegister").val("");
              $("#phoneRegister").val("");
              $("#usernameRegister").val("");
              $("#passwordRegister").val("");
            }
          });
        });

        $('#formLogin').submit((event) => {
          event.preventDefault();

          alert("Waiting for login...")
          $.post({
            url: 'login',
            dataType: 'json',
            data: $('#formLogin').serialize(),
            success: (res) => {
              $("#serverResponse").text(res.message);
              if (res.message !== "success") return

              $("#usernameLogin").val("");
              $("#passwordLogin").val("");
              // localStorage.setItem("isLogin", true);

              //set cookie
              var d = new Date();
              d.setTime(d.getTime() + (30 * 24 * 60 * 60 * 1000));
              const id = "id=1;";
              const expires = "expires=" + d.toGMTString() + ";";
              const path = "path=/"
              document.cookie = id + expires + path;
              console.log(document.cookie);
              // window.location.href = res.redirect
            }
          });
        });

        $('#formForgot').submit(function (event) {
          event.preventDefault();

          const passwordForgot = $("#passwordForgot").val();
          const passwordConfirmForgot = $("#passwordConfirmForgot").val();
          if (passwordForgot !== passwordConfirmForgot) return $("#serverResponse").text("Error : Password is not confirmed!");

          $.post({
            url: 'forgot',
            dataType: 'json',
            data: $('#formForgot').serialize(),
            success: (res) => {
              $("#serverResponse").text(res.message);
              if (res.message !== "success") return

              $("#emailForgot").val("");
              $("#phoneForgot").val("");
              $("#usernameForgot").val("");
              $("#passwordForgot").val("");
              $("#passwordConfirmForgot").val("");
            }
          });
        });
      });
    </script>

  </body>

  </html>