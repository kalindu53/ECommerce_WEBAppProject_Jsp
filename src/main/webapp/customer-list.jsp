<%@ page import="java.util.List" %>
<%@ page import="org.example.customertest.CustomerDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<h1>ALL USERS</h1>

<%
    List<CustomerDTO> dataList = (List<CustomerDTO>) request.getAttribute("customers");
    if (dataList != null && !dataList.isEmpty()) {
%>
<table border="1"   class="table table-success table-striped">
    <thead>
    <tr>
        <td>ID</td>
        <td>NAME</td>
        <td>Address</td>
        <td>Email</td>
        <td>PASSWORD</td>
    </tr>
    </thead>
    <tbody>
    <%
        for (CustomerDTO customerDTO : dataList) {
    %>
    <tr>
        <td><%= customerDTO.getId() %></td>
        <td><%= customerDTO.getName() %></td>
        <td><%= customerDTO.getAddress() %></td>
        <td><%= customerDTO.getMail() %></td>
        <td><%= customerDTO.getPassword() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
} else {
%>
<p>No customers found.</p>
<%
    }
%>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</body>
</html>