Create database Imovel;
go
use Imovel;
go
-- criando tabelas
Create table Vendedor (
	cd_Vendedor int not null,
	nm_Vendedor varchar(40),
	ds_Endereco varchar(40),
	cd_CPF decimal(11),
	nm_Cidade varchar(20),
	nm_Bairro varchar(20),
	sg_Estado char(2),
	cd_Telefone varchar(20),
	ds_Email varchar(80)
);
go

Create table Imovel (
	cd_Imovel int not null,
	cd_Vendedor int,
	cd_Bairro int,
	cd_Cidade int,
	sg_Estado char(2),
	ds_endereco varchar(40),
	qt_AreaUtil decimal (10,2),
	qt_AreaTotal decimal (10,2),
	ds_Imovel varchar (300),
	vl_Imovel money,
	qt_Ofertas int,
	ic_Vendido char (1),
	dt_Lancto datetime,
	qt_ImovelIndicado int
);
go



create table Comprador (
	cd_Comprador int not null,
	nm_Comprador varchar (20),
	ds_Endereco varchar (20),
	cd_CPF int,
	nm_Cidade varchar (20),
	nm_Bairro varchar (20),
	sg_Estado char (2),
	cd_Tefelone varchar (20),
	ds_Email varchar (20)
);
go

Create table Oferta (
	cd_Comprador int not null,
	cd_Imovel int not null,
	vl_oferta money,
	dt_Oferta datetime
);
go

Create table Faixa_Imovel (
	cd_Faixa int not null,
	nm_Faixa varchar (30),
	vl_Maximo money,
	vl_Minimo money
);
go

Create table Estado (
	sg_Estado char(2) not null,
	nm_Estado varchar (20)
);
go

Create table Cidade (
	cd_Cidade int not null,
	sg_Estado char (2) not null,
	nm_Cidade varchar (20)
);
go

Create table Bairro (
	cd_Bairro int not null,
	cd_Cidade int not null,
	sg_Estado char (2) not null,
	nm_Bairro varchar (20)
);
go

--ÍNDICE 
create index NmVendedor on Vendedor (nm_Vendedor)
go
create index CdImovel on Oferta (cd_Imovel asc)
go
create index VlOferta on Oferta (vl_Oferta desc)
go
create index NmComprador on Comprador (nm_Comprador)
go