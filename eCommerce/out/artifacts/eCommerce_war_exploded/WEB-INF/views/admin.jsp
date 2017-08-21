<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>

<%@include file="/WEB-INF/views/template/header.jsp" %>

    <div class="container-wrapper">
    	<div class="container">
			<div class="page-header">
				<h1>Pagina do Administrador</h1>
				<p class="lead">Esta e a pagina do administrador</p>
			</div>

			<c:if test="${pageContext.request.userPrincipal.name != null }">
				<h2>
					Bem-vindo: ${pageContext.request.userPrincipal.name} | <a href="<c:url value="/j_spring_security_logout" /> "> Sair</a>
				</h2>
			</c:if>
			
			<h3> 
				<a href="<c:url value="/admin/productInventory" />" >Inventario de Produto</a>
			</h3>
			
			<p>Aqui você pode ver, verificar e modificar o inventario do produto.</p>
			

<%@include file="/WEB-INF/views/template/footer.jsp" %>
