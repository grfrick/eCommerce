<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	
	<!-- LEAD TO HEADER FILE template/header.jsp -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


    <div class="container-wrapper">
    	<div class="container">
			<div class="page-header">
				<h1>Pagina de inventario de produtos</h1>
				<p class="lead">Esta e a pagina de inventario do produto.</p>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr class="bg-success">
						<th>Foto</th>
						<th>Nome do Produto</th>
						<th>Categoria</th>
						<th>Condicao</th>
						<th>Preco</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${products}" var="product">
				<tr>
					<td><img src="<c:url value="/resources/images/${product.productId}.png" /> " alt="image" style="width:100%"/></td>
					<td>${product.productName}</td>
					<td>${product.productCategory}</td>
					<td>${product.productCondition}</td>
					<td>${product.productPrice}</td>
					<td><a href="<spring:url value="/product/viewProduct/${product.productId}" />" >
					<span class="glyphicon glyphicon-info-sign"></span> </a>
					<a href="<spring:url value="/admin/product/deleteProduct/${product.productId}" />" >
					<span class="glyphicon glyphicon-remove"></span> </a>
					<a href="<spring:url value="/admin/product/editProduct/${product.productId}" />" >
					<span class="glyphicon glyphicon-pencil"></span> </a>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<a href="<spring:url value="/admin/product/addProduct" />" class="btn btn-primary">Adicionar Produto</a>

      <!-- LEAD TO FOOTER FILE template/footer.jsp-->
<%@include file="/WEB-INF/views/template/footer.jsp" %>
