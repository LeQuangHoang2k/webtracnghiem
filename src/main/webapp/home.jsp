<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            width: 100%;
            height: 100vh;
            background-color: lightgray;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .formAccess {
            width: 300px;
            height: 300px;
            margin: auto;
            border-radius: 5px;
            box-shadow: 0 0 10px blue;
        }

        .formAccess__input {
            display: block;
            margin: auto;
        }

        .formAccess__button {
            width: 50px;
            height: 30px;
            background-color: white;
            border: none;

            margin: 10px;
        }

        .formAccess__group {
            display: flex;
            justify-content: center;
        }
    </style>
</head>

<body>
    <form class="formAccess" action="<%= request.getContextPath() %>/register" method="POST">
    	<input class="formAccess__input" type="text" name="name" placeholder="name" />
    	<input class="formAccess__input" type="email" name="email" placeholder="email" />
        <input class="formAccess__input" type="tel" name="phone" placeholder="phone" />
        <input class="formAccess__input" type="text" name="username" placeholder="email" />
        <input class="formAccess__input" type="password" name="password" placeholder="password" />
        <div class="formAccess__group">
            <button class="formAccess__button" type="submit">Register</button>
            <button class="formAccess__button" type="button" formaction="" formmethod="">goggle</button>
            <button class="formAccess__button" type="button" formaction="" formmethod="">fb</button>
        </div>
    </form>
</body>

</html>