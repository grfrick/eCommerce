# poc-dimed
Repository to Dimed POC

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
