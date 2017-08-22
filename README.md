# poc-ecommerce
Repository to POC

* http://www.h2database.com/html/main.html
* https://tomcat.apache.org/download-80.cgi
* http://getbootstrap.com/docs/3.3/getting-started/#download
* http://getbootstrap.com/docs/3.3/examples/carousel/	
* https://docs.spring.io/spring-security/site/docs/3.0.x/reference/appendix-schema.html

--> 2 scripts:

  create table users(
      username varchar_ignorecase(50) not null primary key,
      password varchar_ignorecase(50) not null,
      enabled boolean not null);

  create table authorities (
      username varchar_ignorecase(50) not null,
      authority varchar_ignorecase(50) not null,
      constraint fk_authorities_users foreign key(username) references users(username));
      create unique index ix_auth_username on authorities (username,authority);

- Usado por enquanto      
. Intellij 
. Java8
. TomCat 8.5
. Spring MVC
. Spring Security 
. Spring REST
. Spring WebFlow
. Hibernate
. H2 database 
. JSP
. Bootstrap
. Angular JS
. Junit

- Opções por essas tecnologias, maior facilidade de desenvolvimento, acesso a documentação rica, tecnologias atuais. Banco de dados em memoria para facilitar (configuração e os testes) e para ser mais leve para trabalhar junto com o tomcat.


# Revisar:
- Esta com erro de acesso:

.1- logout 
 --> rever back-end
 
.2- adicionar ao carrinho de compras 
.. -> rever back-end

.3- fluxo de fechamento de pedido 
.. não foi testado -> ajustar #2 primeiro

.3- testes unitários
