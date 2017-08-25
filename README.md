# poc-ecommerce  
- **Algumar referências usadas**:  
.  http://www.h2database.com/html/main.html  
.  https://tomcat.apache.org/download-80.cgi  
.  http://getbootstrap.com/docs/3.3/getting-started/#download  
.  http://getbootstrap.com/docs/3.3/examples/carousel/  
.  https://docs.spring.io/spring-security/site/docs/3.0.x/reference/appendix-schema.html  

- > Para rodar com o H2 (na primeira versão), rodar os scripts abaixo:  

  create table users(  
      username varchar_ignorecase(50) not null primary key,  
      password varchar_ignorecase(50) not null,  
      enabled boolean not null);  

  create table authorities (  
      username varchar_ignorecase(50) not null,  
      authority varchar_ignorecase(50) not null,  
      constraint fk_authorities_users foreign key(username) references users(username));  
      create unique index ix_auth_username on authorities (username,authority);  
      
 - > Para rodar com o H2, **nas versões seguintes**: olhar as imagens anexas na raíz.

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

- > Opções por essas tecnologias, maior facilidade de desenvolvimento, acesso a documentação rica,  
tecnologias atuais. Banco de dados em memoria para facilitar (configuração e os testes) e para ser  
mais leve para trabalhar junto com o tomcat.  


# Revisar:  
> **Alert - 25/08: criado brach (bugsCorrigidos) para ir ajustando os debitos**  

- Features erro (ainda):  
.1- logout  
.2- adicionar ao carrinho de compras  
.3- fluxo de fechamento de pedido  
.. não foi testado -> ajustar #2 primeiro para validar esse  
.3- testes unitários  
.. está somente com as "cascas" (implementar as lógicas para acertividade)  
