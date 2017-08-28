<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ page language="java" contentType="text/html; charset=iso-8859-1" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="_csrf_token" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <link rel="icon" href="../../favicon.ico">

    <title>E-Commerce</title>

	<!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"> </script>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    
    <!-- Carousel CSS -->
	<link href="<c:url value="/resources/css/carousel.css" />" rel="stylesheet">
    
    <!-- main.css -->
	<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">eCommerce</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="<c:url value="/"/>" >Inicio</a></li>
                <li><a href="<c:url value="/product/productList"/>" >Produtos</a></li>
                <li><a href="#contact">Contato</a></li>
              </ul>
              <ul class="nav navbar-nav pull-right">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                  <li><a>Bem-vindo: ${pageContext.request.userPrincipal.name}</a></li>

                  <c:if test="${pageContext.request.userPrincipal.name.trim().toLowerCase() != 'admin'}">
                    <li><a href="<c:url value="/customer/cart" />">Carrinho</a></li>
                  </c:if>

                  <c:if test="${pageContext.request.userPrincipal.name.trim().toLowerCase() == 'admin'}">
                    <li><a href="<c:url value="/admin" />">Administrador</a></li>
                  </c:if>

                  <li style="text-align: center">
                    <c:url value="/j_spring_security_logout" var="logoutUrl"/>
                    <form action="${logoutUrl}" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="submit" value="Sair" class="btn btn-link btn-xs"/>
                    </form>
                  </li>
                </c:if>

                <c:if test="${pageContext.request.userPrincipal.name == null}">
              	  <li><a href="<c:url value="/login" />">Entrar</a></li>
                  <li><a href="<c:url value="/register" />">Registrar</a></li>
                </c:if>
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>

</body>
