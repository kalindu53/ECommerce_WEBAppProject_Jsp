<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Save Customer</title>

    <style>

        .container{
            background-color: #008997;
        }

    </style>


</head>
<body>

<h1>Save Customer</h1>

<%
    String massege = request.getParameter("massege");
    String error = request.getParameter("error");
%>

<%
    if (massege!=null){

%>
<div style="color: green">
    <%=massege%>
</div>
<%
    }
%>
<%
    if (error!=null){
%>
<div style="color: red">
    <%=error%>
</div>
<%
    }
%>


<form action="customer-save" method="post">

    <label>Name</label><br>
    <%--    <input type="text" id="name" name="customer_name"/> <br>--%>

    <label>Address</label><br>
    <%--    <input type="text" id="address" name="customer_address"/><br>--%>


    <label>E-Mail</label><br>
    <%--    <input type="text" id="mail" name="customer_email"/><br><br>--%>



    <button type="submit">Save Customer</button>

</form >



<form action="customer-save" method="post">
    <div class="container">
        <h1>REGISTER USER</h1>
        <div class="row">
            <div class="col">
                <label>Name</label><br>
                <input type="text" id="name" name="Uname" class="form-control" placeholder="name" aria-label="name">
            </div>
            <div class="col">
                <label>Address</label><br>
                <input type="text" id="address" name="Uaddress" class="form-control" placeholder="address" aria-label="address">
            </div>

        </div>
        <div class="row">
            <div class="col">
                <label>Email</label><br>
                <input type="text"  id="email" name="Uemail" class="form-control" placeholder="Email" aria-label="Email">
            </div>
            <div class="col">
                <label>password</label><br>
                <input type="text" id="password" name="Upassword" class="form-control" placeholder="password" aria-label="password"><br><br><br>
            </div>

            <button type="submit" class="btn btn-danger">Delete</button>

        </div>
    </div>

</form>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
