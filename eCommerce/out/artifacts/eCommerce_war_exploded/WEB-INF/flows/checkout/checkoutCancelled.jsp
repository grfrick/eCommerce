<%--
  Created by IntelliJ IDEA.
  User: gianf
  Date: 22/08/2017
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Procedimento de compra cancelado.</h1>
                    <p>suas compras foram canceladas. Volte ao site para continuar comprando.</p>>
                </div>
            </div>
        </section>

        <section class="container" >

            <p>
                <a href="<spring:url value="/"/> " class="btn btn-default">OK</a>
            </p>

        </section>
    </div>
</div>

<%@include file="/WEB-INF/views/template/footer.jsp" %>