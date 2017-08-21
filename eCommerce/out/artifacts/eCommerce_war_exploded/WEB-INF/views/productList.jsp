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
				<h1>Todos produtos</h1>
				<p class="lead">Confira todos os incriveis produtos disponiveis agora!</p>
			</div>

			<table class="table table-striped table-hover">
				<thead>
					<tr class="bg-success">
						<th>Foto</th>
						<th>Nome produto</th>
						<th>Categoria</th>
						<th>Condicao</th>
						<th>Preco</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${products}" var="product">
					<tr>
						<td>
							<img src="<c:url value="/resources/images/${product.productID}.png" />" alt="imagem" style="width:100%"/>
						</td>
						<td>${product.productName}</td>
						<td>${product.productCategory}</td>
						<td>${product.productCondition}</td>
						<td>${product.productPrice}</td>
						<td>
							<a href="<spring:url value="/productList/viewProduct/${product.productID}" />">
								<span class="glyphicon glyphicon-info-sign"></span>
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>

      <!-- LEAD TO FOOTER FILE template/footer.jsp-->
<%@include file="/WEB-INF/views/template/footer.jsp" %>
