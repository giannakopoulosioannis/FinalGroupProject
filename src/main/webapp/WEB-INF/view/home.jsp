<%-- 
    Document   : home
    Created on : 24 Δεκ 2019, 11:26:49 πμ
    Author     : koui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>welcome</h1>
        <security:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Admin page</a> 
        </security:authorize>
        <br>
        <a href="${pageContext.request.contextPath}/product/list">Shoes</a>
        <br>
        <security:authorize access="hasRole('USER')"> 
            <a href="${pageContext.request.contextPath}/user">User page</a>  </security:authorize>
            <hr>
        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout">

        </form:form>
    </body>
</html>
