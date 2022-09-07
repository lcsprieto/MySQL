create database locadora CHARSET utf8mb4 collate utf8mb4_general_ci;
use locadora;
create table Filmes(
			id int UNSIGNED not null AUTO_INCREMENT,
            Nome varchar(40),
            PRIMARY KEY (id)
            );
select * from Filmes;
insert INTO Filmes (Nome) values ('A Hora do Pesadelo'),('Bem-Hur'),('Como Eu Era Antes de Você'),('Estrada Sem Lei'),('Forrest Gump - O Contador de História'),('Harry Potter e a Ordem da Fênix'),('Intocáveis'),('It - A Coisa'),('Minha Mãe É Uma Peça'),('O Iluminado'),('O Resgate do Soldado Ryan'),('Os Infiltrados'),('Vingadores'),('Pantera Negra'),('Para Todos os Garotos que Já Amei');
select * from Filmes;
alter table Filmes RENAME Acervo;
alter table Acervo change Nome Título VARCHAR(40);
select * from Acervo;
ALTER TABLE Acervo ADD COLUMN Gênero varchar(10);
ALTER TABLE Acervo ADD COLUMN Ano YEAR;
ALTER TABLE Acervo modify column Gênero enum('Ação', 'Aventura', 'Comédia', 'Drama', 'Policial', 'Romance', 'Terror');
Update Acervo set Gênero='Terror', Ano=1986 where id=1;
Update Acervo set Gênero='Aventura', Ano=1960 where id=2;
Update Acervo set Gênero='Romance', Ano=2016 where id=3;
Update Acervo set Gênero='Comédia', Ano=2014 where id=4;
Update Acervo set Gênero='Comédia', Ano=1994 where id=5;
Update Acervo set Gênero='Aventura', Ano=2007 where id=6;
Update Acervo set Gênero='Drama', Ano=2012 where id=7;
Update Acervo set Gênero='Terror', Ano=2017 where id=8;
Update Acervo set Gênero='Comédia', Ano=2013 where id=9;
Update Acervo set Gênero='Terror', Ano=1980 where id=10;
Update Acervo set Gênero='Drama', Ano=1998 where id=11;
Update Acervo set Gênero='Policial', Ano=2006 where id=12;
Update Acervo set Gênero='Ação', Ano=2012 where id=13;
Update Acervo set Gênero='Ação', Ano=2018 where id=14;
Update Acervo set Gênero='Romance', Ano=2018 where id=15;
select * from Acervo;
SET SQL_SAFE_UPDATES = 0;
UPDATE Acervo set Gênero='Policial' where título='Estrada sem lei';
UPDATE Acervo set Título='Os Vingadores - The Avengers' where título='Vingadores';
Insert into Acervo (título, gênero, ano) values ('O Caminho do Guerreiro', 'Ação', 2010);
DELETE from Acervo WHERE Título = 'Os Infiltrados';
select * from Acervo;
SET SQL_SAFE_UPDATES = 1;
TRUNCATE TABLE Acervo;
select * from Acervo;
DROP TABLE Acervo;
show tables;
DROP DATABASE locadora;
show DATABASES;
