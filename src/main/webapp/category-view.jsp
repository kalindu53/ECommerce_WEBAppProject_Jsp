<%--<%@ page import="org.example.aad_assignment.DTO.CategoryDTO" %>--%>
<%@ page import="java.util.List" %>
<%@ page import="org.example.customertest.CategoryDTO" %><%--
  Created by IntelliJ IDEA.
  Date: 1/21/2025
  Time: 3:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Category</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .error {
            color: red;
            font-weight: bold;
        }
        img {
            max-width: 50px;
            max-height: 50px;
            object-fit: contain;
        }
    </style>
</head>
<body>
<h1>View Categories</h1>

<%
    String errorMessage = (String) request.getAttribute("error");
    if (errorMessage != null) {
%>
<div class="error">
    <%= errorMessage %>
</div>
<%
    }
%>

<%
    List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categories");
    if (dataList != null && !dataList.isEmpty()) {
%>
<table>
    <thead>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Qty</th>
        <th>Image</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (CategoryDTO category : dataList) {
    %>
    <tr>
        <td><%= category.getCode() %></td>
        <td><%= category.getName() %></td>
        <td><%= category.getQty() %></td>
        <td>
            <%
                String imagePath = category.getImagePath();
                if (imagePath != null && !imagePath.isEmpty()) {
            %>
            <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="Category Image">
            <%
            } else {
            %>
            <p>No image available</p>
            <%
                }
            %>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
} else {
%>
<p>No categories found.</p>
<%
    }
%>
</body>
</html>
