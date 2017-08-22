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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Pedido</h1>

            <p class="lead">Detalhe do Pedido:</p>
        </div>

        <div class="container">
            <div class="row">
                <div commandName="order" class="form-horizontal">
                    <form:form commandName="order" class="form-horizontal">
                        <div class="cell col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

                            <div class="text-center">
                                <h1>Recibo</h1>
                            </div>
                            <div class="row">
                                <div>
                                    <address>
                                        <strong>Endereco Entrega</strong>
                                        ${order.cart.customer.shippingAddress.streetName}
                                        <br>
                                            ${order.cart.customer.shippingAddress.apartmentNumber}
                                        <br>
                                            ${order.cart.customer.shippingAddress.city} - ${order.cart.customer.shippingAddress.state}
                                        <br>
                                            ${order.cart.customer.shippingAddress.country} - ${order.cart.customer.shippingAddress.zipCode}
                                        <br>
                                    </address>
                                </div>
                                <div>
                                    <p>Dia da Entrega: <fmt:formatDate type="date" value="${now}"></p>
                                </div>
                            </div>

                            <div class="row">
                                <div>
                                    <address>
                                        <strong>Endereco Compra</strong>
                                            ${order.cart.customer.billingAddress.streetName}
                                        <br>
                                            ${order.cart.customer.billingAddress.apartmentNumber}
                                        <br>
                                            ${order.cart.customer.billingAddress.city} - ${order.cart.customer.billingAddress.state}
                                        <br>
                                            ${order.cart.customer.billingAddress.country} - ${order.cart.customer.billingAddress.zipCode}
                                        <br>
                                    </address>
                                </div>
                            </div>

                            <div class="row">
                                <div>
                                    <table>
                                        <thead>
                                            <th>Produto</th>
                                            <th>#</th>
                                            <th>Preco</th>
                                            <th>Total</th>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="cartItem" items="${order.cart.cartItems}">
                                                <tr>
                                                    <td>${cartItem.product.productName}</td>
                                                    <td>${cartItem.quantity}</td>
                                                    <td>${cartItem.product.productPrice}</td>
                                                    <td>${cartItem.totalPrice}</td>
                                                <tr>
                                            </c:forEach>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td><strong>Total</strong></td>
                                                <td>${order.cart.grandTotal}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <input type="hidden" name="_flowExecutionKey">

                            <br><br>
                            <button class="btn btn-default" name="_eventId_backToCollectShippingDetail">Voltar</button>
                            <input type="submit" value="Enviar Pedido" class="btn btn-default" name="_eventId_orderConfirmed"/>
                            <button class="btn btn-default" name="_eventId_cancel">Cancelar</button>
                        </div>
                </form:form>

            </div>
        </div>

        <%@include file="/WEB-INF/views/template/footer.jsp" %>

