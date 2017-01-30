Use Almoxarifado
Go

Alter Table Fornecedor
	Add Primary Key(cd_Fornecedor)
Go

Alter Table Pecas
	Add Primary Key(cd_Peca)
Go

Alter Table OrdemCompra
	Add Primary Key(cd_OC),
	Foreign Key(cd_Fornecedor) References Fornecedor
Go

Alter Table Itens_OrdemCompra
	Add Primary Key(cd_OC, cd_Peca),
		Foreign Key(cd_OC) References OrdemCompra,
		Foreign Key(cd_Peca) References Pecas
Go

Alter Table Entrega
	Add Primary Key(cd_Entrega),
		Foreign Key(cd_OC) References OrdemCompra
Go

Alter Table Itens_Entrega
	Add Primary Key(cd_Entrega, cd_Peca),
		Foreign Key(cd_Entrega) References Entrega,
		Foreign Key(cd_Peca) References Pecas
Go

Alter Table Receptaculo
	Add Primary Key(cd_Receptaculo),
		Foreign Key(cd_Peca) References Pecas
Go

Alter Table Cliente
	Add Primary Key(cd_Cliente)
Go

Alter Table Pedido
	Add Primary Key(cd_Pedido),
		Foreign Key(cd_Cliente)	References Cliente
Go

Alter Table Itens_Pedido
	Add Primary Key(cd_Pedido, cd_Peca),
		Foreign Key(cd_Pedido) References Pedido,
		Foreign Key(cd_Peca) References Pecas
Go

Alter Table Pedidos_Finalizados
	Add Primary Key(cd_Pedido),
		Foreign Key(cd_Cliente)	References Cliente
Go

Alter Table Pedidos_Pecas_Finalizados
	Add Primary Key(cd_Pedido, cd_Peca),
		Foreign Key(cd_Pedido) References Pedidos_Finalizados,
		Foreign Key(cd_Peca) References Pecas
Go

Alter Table Pecas_Requisicao
	Add Primary Key(cd_Peca),
		Foreign Key(cd_Peca) References Pecas
Go

Alter Table Historico_Pecas_Excluidas
	Add Primary Key(cd_Peca)
Go

Alter Table TentativasLog
	Add Primary Key(cd_Log)
Go

Alter Table Historico_Precos
	Add Primary Key(cd_Preco),
		Foreign Key(cd_Peca) References Pecas
Go

Alter Table Pecas
	Add Constraint ck_qtd_estoque Check (qt_Estoque >= 0),
		Constraint ck_qtd_min Check (qt_Minima >= 10)
Go

Alter Table Itens_OrdemCompra
	Add Constraint ck_oc_qtd_pedida Check (qt_Pedida >= 0),
		Constraint ck_oc_qtd_entregue Check (qt_Entregue >= 0)
Go

Alter Table Itens_Entrega
	Add Constraint ck_qtd_entregue Check (qt_Peca >= 0)
Go

Alter Table Itens_Pedido
	Add Constraint ck_qtd_pedida Check (qt_Peca >= 0)
Go