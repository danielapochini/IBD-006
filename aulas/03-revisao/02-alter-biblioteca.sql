use Biblioteca

go

/*  
Altere as tabelas de forma a incluir as restrições de integridade
*/  


alter table Assunto
	add primary key (sg_Assunto)


alter table Editora
	add primary key (cd_Editora)
go

alter table Autor
	add primary key (cd_Autor)
go

alter table Livro
	add primary key (cd_Livro)
go

alter table Livro
	add foreign key (cd_Editora)
	references Editora
go

alter table Livro 
	add foreign key (sg_Assunto)
	references Assunto
go