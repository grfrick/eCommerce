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

        <h3>Entrega</h3>

        <div class="form-group">
            <label for="shippingStreet">endereco</label>
            <form:input path="cart.customer.shippingAddress.streetName" id="shippingStreet" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingApartmentNumber">Numero</label>
            <form:input path="cart.customer.shippingAddress.apartmentNumber" id="shippingApartmentNumber" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingCity">Cidade</label>
            <form:input path="cart.customer.shippingAddress.city" id="shippingCity" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingState">Estado</label>
            <form:input path="cart.customer.shippingAddress.state" id="shippingState" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingCountry">Pais</label>
            <form:input path="cart.customer.shippingAddress.country" id="shippingCountry" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingZip">CEP</label>
            <form:input path="cart.customer.shippingAddress.zipCode" id="shippingZip" class="form-Control" />
        </div>

        <input type="hidden" name="_flowExecutionKey">

        <br><br>
        <button class="btn btn-default" name="_eventId_backToCollectCustomerInfo">Voltar</button>
        <input type="submit" value="proximo" class="btn btn-default" name="_eventId_shippingDetailCollected"/>
        <button class="btn btn-default" name="_eventId_cancel">Cancelar</button>
        </form:form>

        <%@include file="/WEB-INF/views/template/footer.jsp" %>

