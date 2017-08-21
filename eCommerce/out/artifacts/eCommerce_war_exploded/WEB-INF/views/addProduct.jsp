<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>	
	
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

    <div class="container-wrapper">
    	<div class="container">
			<div class="page-header">
				<h1>Adicionar produto</h1>
				<p class="lead">Preencha as informacaes abaixo para adicionar um produto:</p>
			</div>
			
			<form:form action="${pageContext.request.contextPath}/admin/productInventory/addProduct" method="post" commandName="product" enctype="multipart/form-data">
				<div class="form-group">
					<label for="name">Nome</label>
					<form:errors path="productName" cssStyle="color: #ff0000" />
					<form:input path="productName" id="name" class="form-Control" />
				</div>
				
				<div class="form-group">
					<label for="category">Category</label>
					<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="smartphone" /> Smartphone</label>
					<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="notebook" /> Notebook</label>
					<label class="checkbox-inline"><form:radiobutton path="productCategory" id="category" value="tablet" /> Tablet</label>
				</div>
				
				<div class="form-group">
					<label for="description">Descricao</label>
					<form:textarea path="productDescription" id="description" class="form-Control" />
				</div>
				
				<div class="form-group">
					<label for="price">Preco</label>
					<form:errors path="productPrice" cssStyle="color: #ff0000" />
					<form:input path="productPrice" id="price" class="form-Control" />
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
					<label for="unitInStock">Estoque</label>
					<form:errors path="unitInStock" cssStyle="color: #ff0000" />
					<form:input path="unitInStock" id="unitInStock" class="form-Control" />
				</div>
				
				<div class="form-group">
					<label for="manufacturer">Fabricante</label>
					<form:input path="productManufacturer" id="manufacturer" class="form-Control" /> <!-- when adding product, it will be binded to the productName -->
				</div>
				
				<div class="form-group">
					<label class="control-label" for="productImage">Adicionar Imagem</label>
					<form:input id="productImage" path="productImage" type="file" class="form:input-large" />
				</div>
				
				<br><br>
				<input type="submit" value="submit" class="btn btn-default">
				<a href="<c:url value="/admin/productInventory" />" class="btn btn-default">Cancelar</a>
			</form:form>

<%@include file="/WEB-INF/views/template/footer.jsp" %>

