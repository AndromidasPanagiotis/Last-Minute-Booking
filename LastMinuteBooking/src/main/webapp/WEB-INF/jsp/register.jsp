<%-- 
    Document   : register
    Created on : Jul 10, 2019, 6:45:01 PM
    Author     : Panos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="../resources/css/signin.css" rel="stylesheet">
        <title>User Registration</title>
    </head>
    <body class="text-center">
    <form:form class="form-signin" action = "${pageContext.request.contextPath}/user/register" method = "POST" modelAttribute = "user">
      <a href="${pageContext.request.contextPath}"><img class="mb-4" src="../resources/media/template.jpg" alt="" width="300" height="150"></a>
      <h1 class="h3 mb-3 font-weight-normal">Please register your personal information</h1>
      <form:label class="sr-only" path="name">Type your first name</form:label>
      <form:input class = "form-control" placeholder = "First name" required = "true" autofocus = "true" path = "name"/>
      <form:label class="sr-only" path = "surname">Type your last name</form:label>
      <form:input class = "form-control" placeholder = "Last name" required = "true" path = "surname"/>
      <form:label class="sr-only" path = "address">Type your home address</form:label>
      <form:input class = "form-control" placeholder = "Address" required = "true" path = "address"/>
      <form:label class="sr-only" path = "city">Type your city</form:label>
      <form:input class = "form-control" placeholder = "City" required = "true" path = "city"/>
      <form:label class="sr-only" path = "postcode">Type your postcode area</form:label>
      <form:input class = "form-control" placeholder = "Postcode" required = "true" path = "postcode"/>
      <form:label class="sr-only" path = "phone">Type your phone number</form:label>
      <form:input class = "form-control" placeholder = "Phone number" required = "true" path = "phone"/>
      <form:label class="sr-only" path = "email">Type your email address</form:label>
      <form:input class = "form-control" placeholder = "Email address" required = "true" path = "email"/>
      <form:label class="sr-only" path = "username">Type your username</form:label>
      <form:input class = "form-control" placeholder = "Username" required = "true" path = "username"/>
      <form:label class="sr-only" path = "password">Type your password</form:label>
      <form:input type = "password" class = "form-control" placeholder = "Password" required = "true" path = "password"/>
      <label class="sr-only">Retype your password</label>
      <input type = "password" class = "form-control" placeholder = "Confirm Password" required = "true" name = "pass"/>
      <label>If you are a hotel owner, check this: <input type = "checkbox" name = "roleCheck" value = "owner"></label>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
      <h3 class="h3 mb-3 font-weight-normal">${usernameExists}</h3>
      <h3 class="h3 mb-3 font-weight-normal">${passwordMismatch}</h3>
      <p class="mt-5 mb-3 text-muted">&copy; Bootcamp 7 Team Project</p>
    </form:form>
   
  </body>
</html>
