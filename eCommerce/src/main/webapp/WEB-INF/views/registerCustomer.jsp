<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Registrar Cliente</h1>
            <p class="lead">Preencha as informacaes abaixo para adicionar um cliente:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/register" method="post" commandName="customer" >

        <h3>Informacoes Basicas</h3>

        <div class="form-group">
            <label for="name">Nome</label><form:errors path="customerName" cssStyle="color: #ff0000" />
            <form:input path="customerName" id="name" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="email">E-Mail</label><span style="color: #ff0000">${emailMsg}</span><form:errors path="customerEmail" cssStyle="color: #ff0000" />
            <form:input path="customerEmail" id="email" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="name">Telefone</label>
            <form:input path="custumerPhone" id="phone" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="name">Usuario</label><span style="color: #ff0000">${usernameMsg}</span><form:errors path="username" cssStyle="color: #ff0000" />
            <form:input path="username" id="username" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="name">Senha</label><form:errors path="password" cssStyle="color: #ff0000" />
            <form:password path="password" id="password" class="form-Control" />
        </div>


        <h3>Endereco</h3>

        <div class="form-group">
            <label for="billingStreet">endereco</label>
            <form:input path="billingAddress.streetName" id="billingStreet" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingApartmentNumber">Numero</label>
            <form:input path="billingAddress.apartmentNumber" id="billingApartmentNumber" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingCity">Cidade</label>
            <form:input path="billingAddress.city" id="billingCity" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingState">Estado</label>
            <form:input path="billingAddress.state" id="billingState" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingCountry">Pais</label>
            <form:input path="billingAddress.country" id="billingCountry" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingZip">CEP</label>
            <form:input path="billingAddress.zipCode" id="billingZip" class="form-Control" />
        </div>


        <h3>Entrega</h3>

        <div class="form-group">
            <label for="shippingStreet">endereco</label>
            <form:input path="shippingAddress.streetName" id="shippingStreet" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingApartmentNumber">Numero</label>
            <form:input path="shippingAddress.apartmentNumber" id="shippingApartmentNumber" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingCity">Cidade</label>
            <form:input path="shippingAddress.city" id="shippingCity" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingState">Estado</label>
            <form:input path="shippingAddress.state" id="shippingState" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingCountry">Pais</label>
            <form:input path="shippingAddress.country" id="shippingCountry" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="shippingZip">CEP</label>
            <form:input path="shippingAddress.zipCode" id="shippingZip" class="form-Control" />
        </div>


        <br><br>
        <input type="submit" value="enviar" class="btn btn-default">
        <a href="<c:url value="/" />" class="btn btn-default">Cancelar</a>
        </form:form>

        <%@include file="/WEB-INF/views/template/footer.jsp" %>

