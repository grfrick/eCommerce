<%@include file="/WEB-INF/views/template/header.jsp" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container-wrapper">
	<div class="container">
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Carrinho de compras</h1>
					<p>Todos os produtos selecionados em seu carrinho de compras.</p>
				</div>
			</div>
		</section>
		
		<section class="container" data-ng-app="cartApp">
			<div data-ng-controller = "cartCtrl" data-ng-init="initCartId('${cartID}')">
			<div>
				<a class="btn btn-danger pull-left" data-ng-click="clearCart()">
				<span class="glyphicon glyphicon-remove-sign"></span> Limpar carrinho</a>
				<a href="<spring:url value="/customer/order/${cartId}"/>" class="btn btn-default">
					<span class="glyphicon-shopping-cart glyphicon">Realizar Compra</span>
				</a>
			</div>
			<table class="table table-hover">
				<tr>
					<th>Produto</th>
					<th>Preco Unitario</th>
					<th>Quantidade</th>
					<th>Preco</th>
					<th>Acao</th>
				</tr>
				<tr data-ng-repeat = "item in cart.cartItems">
					<td>{{item.product.productName}}</td>
					<td>{{item.product.productPrice}}</td>
					<td>{{item.quantity}}</td>
					<td>{{item.totalPrice}}</td>
					<td><a href="#" class="label label-danger" data-ng-click="removeFromCart(item.product.productId)">
					<span class="glyphicon glyphicon-remove"></span>Remover</a></td>
				</tr>
				<tr>
					<th></th>
					<th></th>
					<th>Total geral</th>
					<th>{{calgrandTotal()}}</th>
					<th></th>
				</tr>
			</table>
			<a href="<spring:url value="/productList"/> " class="btn btn-default">Continue comprando</a>
			</div>
		</section>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js" /> "></script>
<%@include file="/WEB-INF/views/template/footer.jsp" %>