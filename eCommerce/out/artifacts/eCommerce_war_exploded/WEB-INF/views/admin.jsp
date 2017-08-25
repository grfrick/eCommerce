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
					<c:url value="/j_spring_security_logout" var="logoutUrl"/>
					<form action="${logoutUrl}" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						Bem-vindo: ${pageContext.request.userPrincipal.name} | <input type="submit" value="Sair" class="btn btn-link"/>
					</form>
				</h2>
			</c:if>

			<h3> 
				<a href="<c:url value="/admin/productInventory" />" >Inventario de Produtos</a>
			</h3>
			
			<p>Aqui voce pode ver, verificar e modificar o inventario dos produtos.</p>

            <br><br>

            <h3>
                <a href="<c:url value="/admin/customer" />" >Gestao de clientes</a>
            </h3>

            <p>Aqui voce pode ver as informacoes dos clientes.</p>

<%@include file="/WEB-INF/views/template/footer.jsp" %>
