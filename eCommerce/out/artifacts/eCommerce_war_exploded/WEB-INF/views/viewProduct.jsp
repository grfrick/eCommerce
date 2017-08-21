<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	
<!-- LEAD TO HEADER FILE template/header.jsp -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

    <div class="container-wrapper">
    	<div class="container">
			<div class="page-header">
				<h1>Detalhes do produto</h1>
				<p class="lead">Aqui estao as informacaes detalhadas do produto!</p>
			</div>

			<div class="container" data-ng-app="cartApp">
				<div class="row">
					<div class="col-md-5">
						<img src="<c:url value="/resources/images/${product.productID}.png" /> " alt="image" style="width:100%"/>
					</div>
					
					<div class="col-md-5">
						<h3>${product.productName }</h3>
						<p>
							<strong>Descricao</strong> :
							${product.productDescription}</p>
						<p> 
							<strong>Fabricante</strong> :
							${product.productManufacturer}</p>
						<p> 
							<strong>Categoria</strong> :
							${product.productCategory}</p>
						<p> 
							<strong>Condicao</strong> :
							${product.productCondition}</p>
						
						<h4>${product.productPrice} R$</h4>
						
						<br>
						
						<c:set var="role" scope="page" value="${param.role}" />
						<c:set var="url" scope="page" value="/productList" />
						<c:if test="${role=='admin'}">
							<c:set var="url" scope="page" value="/admin/productInventory" />
						</c:if>
						
						<p data-ng-controller="cartCtrl">
							<a href="<c:url value="${url}" />" class="btn btn-default">Back</a>
							<a href="#" class="btn btn-warning btn-large" data-ng-click="addToCart('${product.productID}')">
							<span class="glyphicon glyphicon-shopping-cart"></span> Peca agora</a>
							<a href="<spring:url value="/cart" />" class="btn btn-default">
							<span class="glyphicon glyphicon-hand-right"></span> Ver carrinho</a>
						</p>
					</div>
				</div>
			</div>
			
			<!-- include javascript file written -->
			<script src="<c:url value="/resources/js/controller.js" /> "></script>

<!-- LEAD TO FOOTER FILE template/footer.jsp-->
<%@include file="/WEB-INF/views/template/footer.jsp" %>
