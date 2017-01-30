use Imovel
go

-- criando chaves primarias
alter table Vendedor
	add primary key (cd_Vendedor)
go

alter table Comprador
	add primary key (cd_Comprador)
go

alter table Imovel 
	add primary key (cd_Imovel)
go

alter table Estado
	add primary key (sg_Estado)
go

alter table Faixa_Imovel
	add primary key (cd_Faixa)
go

alter table Cidade 
	add primary key (cd_Cidade, sg_Estado)
go

alter table Bairro 
	add primary key (cd_Bairro, cd_Cidade, sg_Estado)
go

alter table Oferta
	add primary key (cd_Comprador, cd_Imovel)
go

--criando chaves estrangeiras
alter table Oferta
	add foreign key (cd_Comprador)
	references Comprador
go

alter table Oferta
	add foreign key (cd_Imovel)
	references Imovel
go

alter table Cidade
	add foreign key (sg_Estado)
	references Estado
go

alter table Bairro
	add foreign key (cd_Cidade, sg_Estado)
	references Cidade
go

alter table Imovel
	add foreign key (cd_Vendedor)
	references Vendedor
go


alter table Imovel
	add foreign key (cd_Bairro, cd_Cidade, sg_Estado)
	references Bairro
go