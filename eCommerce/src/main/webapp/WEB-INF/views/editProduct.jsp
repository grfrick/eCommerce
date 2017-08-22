<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>		

<!-- LEAD TO HEADER FILE template/header.jsp -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   <!-- import spring tag to use the header and footer we just created in "template" folder -->
<%@include file="/WEB-INF/views/template/header.jsp" %>


    <div class="container-wrapper">
    	<div class="container">
			<div class="page-header">
				<h1>Edit Product</h1>
				<p class="lead">Atualize as informacaes do produto aqui: </p>
			</div>
			
			<form:form action="${pageContext.request.contextPath }/admin/product/editProduct" method="post" commandName="product" enctype="multipart/form-data">
			<form:hidden path="productId" value="${product.productId}" />
				
				<div class="form-group">
					<label for="name">Nome</label>
					<form:input path="productName" id="name" class="form-Control" value="${product.productName} " />
				</div>
				
				<div class="form-group">
					<label for="category">Categoria</label>
					<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="smartphone" /> Smartphone</label>
					<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="notebook" /> Notebook</label>
					<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="tablet" /> Tablet</label>
				</div>
				
				<div class="form-group">
					<label for="description">Descricao</label>
					<form:textarea path="productDescription" id="description" class="form-Control" value="${product.productDescription}"/>
				</div>
				
				<div class="form-group">
					<label for="price">Preco</label>
					<form:input path="productPrice" id="price" class="form-Control" value="${product.productPrice}"/>
				</div>
				
				<div class="form-group">
					<label for="condition">Condicao</label>
					<label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition" value="novo" /> Novo</label>
					<label class="checkbox-inline"><form:radiobutton path="productCondition" id="condition" value="usado" /> Usado</label>
				</div>
				
				<div class="form-group">
					<label for="status">Situacao</label>
					<label class="checkbox-inline"><form:radiobutton path="productStatus" id="status" value="ativo" /> Ativo</label>
					<label class="checkbox-inline"><form:radiobutton path="productStatus" id="status" value="inativo" /> Inativo</label>
				</div>
				
				<div class="form-group">
					<label for="unitInStock"Estoque</label>
					<form:input path="unitInStock" id="unitInStock" class="form-Control" value="${product.unitInStock}"/>
				</div>
				
				<div class="form-group">
					<label for="manufacturer">Fabricante</label>
					<form:input path="productManufacturer" id="manufacturer" class="form-Control" value="${product.productManufacturer}"/>
				</div>
				
				<div class="form-group">
					<label class="control-label" for="productImage">Imagem</label>
					<form:input id="productImage" path="productImage" type="file" class="form:input-large" />
				</div>
				
				<br><br>
				<input type="submit" value="submit" class="btn btn-default">
				<a href="<c:url value="/admin/productInventory" />" class="btn btn-default">cancelar</a>
			</form:form>

      <!-- LEAD TO FOOTER FILE template/footer.jsp-->
<%@include file="/WEB-INF/views/template/footer.jsp" %>
