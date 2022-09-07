-- Criando Banco de Dados
create database bella DEFAULT CHARSET = utf8mb4;
-- Selecionando o BD
use bella;
-- criando primeira tabela, "pacientes"
create table pacientes(
			CPF varchar(14) not null,
            Nome varchar(30) not null,
            Telefone varchar(14),
            Email varchar(30),
            Endereço varchar(30),
			Bairro varchar(20),
            Cidade varchar (20) default 'Curitiba',
            UF char (2) DEFAULT 'PR'
           );
start transaction; -- opcional, para desabilitar autocommit e evitar atomicidade das alterações
insert into pacientes (CPF, Nome, Telefone, Email, Endereço, Bairro, Cidade, UF) values ('345.567.890-00', 'Maria da Silva', '41 98765 8456', 'msilva@gmail.com', 'Rua das Margaridas, 33', 'Pilarzinho', 'Curitiba', 'PR'), ('123.654.987-11', 'Ana do Santos', '41 98990 1234', 'anasantos@gmail.com', 'Rua Alegria, 234', 'Santo Inácio', 'Curitiba', 'PR'), ('321.543.654-22', 'Ana dos Santos', '41 98423 5456', 'ana_dos_santos@hotmail.com', 'Rua 21 de Abril, 1430', 'Alto da XV', 'Curitiba', 'PR');
select * from pacientes; -- para verificar/conferir a criação da tabela e inserção de dados
commit; -- quando verificado que os dados estão corretos, torna as alterações permanentes
create table procedimentos(
			CodProcedimento smallint NOT NULL AUTO_INCREMENT, 
            Procedimento varchar(50),
            Preço decimal(6,2),
            primary key (CodProcedimento)
            );
start transaction; -- novamente opcional, para redução de riscos
-- inserindo dados
insert into procedimentos (Procedimento, Preço) values ('Laser facial', 3500), ('Laser mãos', 2500), ('Peeling químico face', 1200), ('Peeling químico mãos', 800);
select * from procedimentos; -- demonstrando criação e inserção de dados na tabela procedimentos
commit; -- tudo ok, enviando alterações
-- alterando a estrutura da tabela para adicionar nova coluna de código de pacientes e chave primária
alter table pacientes add column CodPaciente smallint NOT NULL auto_increment first, add primary key (CodPaciente);
start transaction; -- opcional, para redução de riscos
-- iniciando correção dos dados solicitadas pelo usuário
update pacientes set Telefone='41 98765 8455' where CodPaciente=1;
update pacientes set Endereço='Rua 21 de Abril, 4130' where CodPaciente=3;
update pacientes set Nome='Ana Maria Barbosa dos Santos' where CodPaciente=2;
update procedimentos set Preço = 900 where CodProcedimento=4;
select * from pacientes; -- verificação
select * from procedimentos; -- verificação
commit; -- inserção definitiva das alterações acima