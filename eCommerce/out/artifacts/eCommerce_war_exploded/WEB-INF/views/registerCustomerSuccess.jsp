<%@include file="/WEB-INF/views/template/header.jsp" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Registro do cliente Efetuado com sucesso.</h1>
                </div>
            </div>
        </section>

        <section class="container" >

            <p>
                <a href="<spring:url value="/product/productList"/> " class="btn btn-default">Continue comprando</a>
            </p>

        </section>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js" /> "></script>
<%@include file="/WEB-INF/views/template/footer.jsp" %>