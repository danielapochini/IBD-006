create database Biblioteca

go

use Biblioteca

go

/*  
1. Criar as tabelas relacionadas anteriormente, utilizando uma instrução SQL sem especificar as (chaves) restrições de integridade.
 
 
*/ 

create table Assunto(
	sg_Assunto char(1) not null,
	ds_Assunto varchar(30)
)
go

create table Editora(
	cd_Editora int not null,
	nm_Editora varchar(30)
)
go

create table Autor(
	cd_Autor int not null,
	nm_Autor varchar(40),
	ds_EnderecoAutor varchar(60),
	dt_Nascimento date
)
go

create table Livro(
	cd_Livro int not null, 
	nm_Titulo varchar(30),
	vl_Livro money,
	dt_Lancamento date,
	cd_Editora int not null,
	sg_Assunto char(1) 
)
go

create table Autor_Livro(
	cd_Livro int not null,
	cd_Autor int not null
)
go