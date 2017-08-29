	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	
	<!-- LEAD TO HEADER FILE template/header.jsp -->
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   <!-- import spring tag to use the header and footer we just created in "template" folder -->
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

    <script>
        $(document).ready(function() {
            $('#w-input-search').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getProducts',
                paramName: "productName",
                delimiter: ",",
                transformResult: function(response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function(item) {
                            return { value: item.productName, data: item.productId };
                        })
                    };
                }
            });
        });
    </script>

    <div class="container-wrapper">
    	<div class="container">
			<div class="page-header">
				<h1>Todos produtos</h1>
				<p class="lead">Confira todos os incriveis produtos disponiveis agora!</p>
			</div>

            <form:form action="${pageContext.request.contextPath}/product/searchProduct" method="post" commandName="productSearch" cssClass="form-inline">
                <div class="mb-2 mr-sm-2 mb-sm-0">
                    <label for="w-input-search">Produto</label>
                    <form:input path="productName" id="w-input-search" class="form-Control mb-2 mr-sm-2 mb-sm-0" />
                    <input type="submit" value="buscar" class="btn btn-primary">
                </div>
            </form:form>

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
				<tbody>
					<c:forEach items="${products}" var="product">
					<tr>
						<td>
							<img src="<c:url value="/resources/images/${product.productId}.png" />" alt="imagem" style="width:100%"/>
						</td>
						<td>${product.productName}</td>
						<td>${product.productCategory}</td>
						<td>${product.productCondition}</td>
						<td>${product.productPrice}</td>
						<td>
							<a href="<spring:url value="/product/viewProduct/${product.productId}" />">
								<span class="glyphicon glyphicon-info-sign"></span>
							</a>
						</td>
					</tr>
				    </c:forEach>
                </tbody>
			</table>

<%@include file="/WEB-INF/views/template/footer.jsp" %>
