<%@include file="/WEB-INF/views/template/header.jsp" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Obrigado por comprar com a gente.</h1>
                    <p>Seu pedido chegara em brave!</p>
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