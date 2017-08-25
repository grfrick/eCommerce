<%--
  Created by IntelliJ IDEA.
  User: gianf
  Date: 25/08/2017
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<!-- LEAD TO HEADER FILE template/header.jsp -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   <!-- import spring tag to use the header and footer we just created in "template" folder -->
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Pagina da Gestao de Clientes</h1>
            <p class="lead">Pagina de administracao de clientes!</p>
        </div>

        <table class="table table-striped table-hover">
            <thead>
            <tr class="bg-success">
                <th>Nome</th>
                <th>E-mail</th>
                <th>Telefone</th>
                <th>Usuario</th>
                <th>Ativo</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customerList}" var="customer">
                <tr>
                    <td>${customer.customerName}</td>
                    <td>${customer.customerEmail}</td>
                    <td>${customer.custumerPhone}</td>
                    <td>${customer.username}</td>
                    <td>${customer.enabled}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- LEAD TO FOOTER FILE template/footer.jsp-->
        <%@include file="/WEB-INF/views/template/footer.jsp" %>
