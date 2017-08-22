<%--
  Created by IntelliJ IDEA.
  User: gianf
  Date: 22/08/2017
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Cliente</h1>
            <p class="lead">Detalhe do Cliente:</p>
        </div>

        <form:form commandName="order" class="form-horizontal">

        <h3>Informacoes Basicas</h3>

        <div class="form-group">
            <label for="name">Nome</label>
            <form:input path="cart.customer.customerName" id="name" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="email">E-Mail</label>
            <form:input path="cart.customer.customerEmail" id="email" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="name">Telefone</label>
            <form:input path="cart.customer.custumerPhone" id="phone" class="form-Control" />
        </div>


        <h3>Endereco</h3>

        <div class="form-group">
            <label for="billingStreet">endereco</label>
            <form:input path="cart.customer.billingAddress.streetName" id="billingStreet" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingApartmentNumber">Numero</label>
            <form:input path="cart.customer.billingAddress.apartmentNumber" id="billingApartmentNumber" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingCity">Cidade</label>
            <form:input path="cart.customer.billingAddress.city" id="billingCity" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingState">Estado</label>
            <form:input path="cart.customer.billingAddress.state" id="billingState" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingCountry">Pais</label>
            <form:input path="cart.customer.billingAddress.country" id="billingCountry" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingZip">CEP</label>
            <form:input path="cart.customer.billingAddress.zipCode" id="billingZip" class="form-Control" />
        </div>

        <input type="hidden" name="_flowExecutionKey">

        <br><br>
        <input type="submit" value="proximo" class="btn btn-default" name="_eventId_customerInfoCollected"/>
        <button class="btn btn-default" name="_eventId_cancel">Cancelar</button>
        </form:form>

        <%@include file="/WEB-INF/views/template/footer.jsp" %>

