<%--
  Created by IntelliJ IDEA.
  User: bootcamp12
  Date: 01/09/23
  Time: 22.02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="./css/loginStyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="container">
    <h4 class="text-center"> FORM LOGIN</h4>
    <hr>
    <form action="LoginService" method="post">
        <table class="login">
            <tr id="tr1">
                <td>User Id</td>
                <td> :</td>
                <td><input type="text" name="userid" id="username"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td> :</td>
                <td><input type="password" name="password" id="password"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <button value="Login">Submit</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="successMessage" style="color: green;"></div>
<script>
    $(document).ready(function() {
        $("form").submit(function(e) {
            $.ajax({
                type: "POST",
                url: "LoginService",
                data: $("form").serialize(),
                success: function(data) {
                    if (data === "success") {
                        $("#successMessage").text("Login berhasil!");
                        setTimeout(function() {
                            window.location.href = "http://localhost:8080/app/dashboard.jsp";
                        }, 100);
                    } else {

                        $("#errorMessage").text("Wrong Password");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    $("#errorMessage").text("Error: " + textStatus + " - " + errorThrown);
                }
            });
            e.preventDefault();
        });
    });
</script>

</body>
</html>
