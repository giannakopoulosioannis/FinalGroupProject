
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <security:authorize access="hasRole('ADMIN')">

            <a href="${pageContext.request.contextPath}/product/create">Create Product</a>
        </security:authorize>



                <table border="1" class="shadow">
                    <thead>
                        <tr>
                            <th>Product Id</th>
                            <th>Product Category</th>
                            <th>Subcategory</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Description</th>
                            <th>Gender</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Url</th>
                        </tr>
                    </thead>

                    <c:forEach items="${listOfProduct}" var="p">
                        <c:url var="deleteLink" value="/product/delete">
                            <c:param name="productId" value="${p.pcode}"/> 
                        </c:url>
                        <c:url var="updateLink" value="/product/update">
                            <c:param name="productId" value="${p.pcode}"/> 
                        </c:url>
                        
                        <tbody>
                            <tr>
                                <td>${p.pcode}</td>
                                <td>${p.pcategory}</td>
                                <td>${p.psubcat}</td>
                                <td>${p.pcolor}</td>
                                <td>${p.psize}</td>
                                <td>${p.pdescr}</td>
                                <td>${p.pgender}</td>
                                <td>${p.pquant}</td>
                                <td>${p.pprice}</td>
                                <td>
                                    <img src="${p.purl}" alt="shoe"/>
                                </td>
                                <security:authorize access="hasRole('ADMIN')">
                                    <td>
                                        <a href="${deleteLink}"
                                           onclick="if (!(confirm('Are you sure?')))
                                                       return false">Delete</a>

                                    </td>
                                    <td>
                                        <a href="${updateLink}">Update</a>
                                    </td>
                                </security:authorize>

                            </tr>
                        </tbody>
                    </c:forEach>

                </table>
                <a href="${pageContext.request.contextPath}/">Home Page</a>
                </body>
                </html>