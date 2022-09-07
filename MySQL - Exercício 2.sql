create database locadora CHARSET utf8mb4 collate utf8mb4_general_ci; -- criando o banco de dados com nome locadora, charset para definir o conjunto de caracteres e collate (regra de agrupamento para fazer comparações individuais entre caracteres)
use locadora; -- selecionando o banco de dados locadora para ser utilizado
/* Criando tabela Filmes apenas com a coluna nome, ID com unsigned (para trabalhar apenas com números positivos), not null (para não permitir campos nulos) e autoincrement (para aumentar o id automaticamente a cada nova linha),
assim possibiltando a listagem das linhas da tabela, utilizando por fim a primary key vinculada ao ID, para permitir a identificação das inserções da tabela*/ 
create table Filmes(
		id int UNSIGNED not null AUTO_INCREMENT,
		Nome varchar(40),
		PRIMARY KEY (id)
		);
DESCRIBE Filmes; -- uso do describe para exibir a estrutura da tabela Filmes
/*Inserido os nomes dos filmes na tabela Filmes */
insert INTO Filmes (Nome) values ('A Hora do Pesadelo'),('Bem-Hur'),('Como Eu Era Antes de Você'),('Estrada Sem Lei'),('Forrest Gump - O Contador de História'),('Harry Potter e a Ordem da Fênix'),('Intocáveis'),('It - A Coisa'),('Minha Mãe É Uma Peça'),('O Iluminado'),('O Resgate do Soldado Ryan'),('Os Infiltrados'),('Vingadores'),('Pantera Negra'),('Para Todos os Garotos que Já Amei');
select * from Filmes; -- Select utilizado com * para exibir todo o conteúdo da tabela filme.
alter table Filmes RENAME Acervo; -- comando alter table para renomear o nome da tabela Filmes para Acervo
alter table Acervo change Nome Título VARCHAR(40); -- alterando dentro da tabela Acervo a coluna "Nome" que passa a ser "Título"
select * from Acervo; -- novamente utilizando com * para exibir no result grid todo o conteúdo da tabela que agora se chama "Acervo".
ALTER TABLE Acervo ADD COLUMN Gênero varchar(10); -- Adicionando à tabela "Acervo" a coluna "Gênero" e tipo varchar limitado à 10 caracteres. 
ALTER TABLE Acervo ADD COLUMN Ano YEAR; -- Adicionando à tabela "Acervo" a coluna "Ano" e função year. 
ALTER TABLE Acervo modify column Gênero enum('Ação', 'Aventura', 'Comédia', 'Drama', 'Policial', 'Romance', 'Terror'); -- Modificando a coluna "Gênero" para tipo enum, restringindo as escolhas do usuário para os tipos pré-listados.
/*Atualizando a tabela com update, para inserir as informações nas novas colunas, tendo que realizar individualmente para cada linha, atribuindo a modificação ao ID. */
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
select ID, Gênero, Ano from Acervo; -- Select utilizado com agora exibir apenas o conteúdo das colunas modificadas, caso quisesse também a tabela integralmente usando -> select * from Acervo;
SET SQL_SAFE_UPDATES = 0; -- Foi requerido uma alteração de uma informação na tabela sem menção ao ID, por isso se faz necessário a desabilitar o SAFE UPDATES que impede a atualização da tabela se não for utilizado a Primary Key
UPDATE Acervo set Gênero='Policial' where título='Estrada sem lei'; -- atualizando informação da tabela, buscando onde o campo da coluna título for igual a "Estrada sem lei" será alterado o gênero para Policial
UPDATE Acervo set Título='Os Vingadores - The Avengers' where título='Vingadores'; -- atualizando informação da tabela, buscando onde o campo da coluna título for igual a "Vingadores" para alterar para o título "Os Vingadores - The Avengers"
Insert into Acervo (título, gênero, ano) values ('O Caminho do Guerreiro', 'Ação', 2010); -- inserindo na tabela mais uma linha, preenchendo as colunas título, gênero e ano
DELETE from Acervo WHERE Título = 'Os Infiltrados'; -- excluindo por solicitação a linha onde houver o título "Os Infiltrados"
select * from Acervo; -- exibindo novamente no result grid toda a tabela
SET SQL_SAFE_UPDATES = 1; -- religando o safe updates
TRUNCATE TABLE Acervo; -- solicitado pelo usuário a exclusão do conteúdo de toda a tabela Acervo.
select * from Acervo; -- mostrando que todo o conteúdo da tabela foi excluído.
DROP TABLE Acervo; -- excluindo agora a estrutura da tabela
show tables; -- demonstrando que não há mais tabela "Acervo"
DROP DATABASE locadora; -- excluindo o próprio banco de dados "locadora"
show DATABASES; -- demonstrando que o banco de dados foi corretamente excluído
