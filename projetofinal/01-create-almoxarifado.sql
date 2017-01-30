Create Database Almoxarifado
Go

Use Almoxarifado
Go

/* Em uma das extremidades do almoxarifado encontra-se o setor de recepção de peças. Lá
chegam as peças entregues pelos fornecedores. Quando ocorre a chegada de peças, a primeira
atividade é registrar na ordem de compra a chegada das peças. Uma cópia de toda ordem de
compra é sempre enviada ao setor de recepção. Assim, neste setor sempre sabe-se quais as
peças que estão por ser entregues. As ordens de compra são geradas no setor de compras e
apenas repassadas ao almoxarifado */

Create Table Fornecedor(
	cd_Fornecedor Int Not Null,
	cd_CNPJ Varchar(20) Not Null,
	nm_Fornecedor Varchar(60),
	ds_Endereco Varchar(80),
	cd_Telefone Int
)
Go

Create Table Pecas(
	cd_Peca Int Not Null,
	cd_UPC Varchar(20) Not Null,
	ds_Peca Varchar(100),
	qt_Estoque Int Not Null,
	qt_Minima Int Not Null,
	qt_MaxReceptaculo Int Not Null,
	vl_Peca Money
)
Go

Create Table OrdemCompra(
	cd_OC Int Not Null,
	cd_Fornecedor Int Not Null,
	vl_OC Money,
	dt_OC Datetime
)
Go

Create Table Itens_OrdemCompra(
	cd_OC Int Not Null,
	cd_Peca Int Not Null,
	qt_Pedida Int Not Null,
	qt_Entregue Int,
	vl_Peca Money
)
Go

/* Uma entrega corresponde sempre a uma ordem de compra. Em uma entrega podem ser
entregues diferentes quantidades de diferentes peças. */ 

Create Table Entrega(
	cd_Entrega Int Not Null,
	cd_OC Int Not Null,
	dt_Entrega Datetime
)
Go

/* Para cada entrega, o setor de recepção monta uma lista de distribuição, que instrui o operador
   sobre que peças, em quantidade ele deve estocar em que receptáculos. */

Create Table Itens_Entrega(
	cd_Entrega Int Not Null,
	cd_Peca Int Not Null,
	qt_Peca Int
)
Go

/* 
O almoxarifado está organizado em corredores. Cada corredor possui vários receptáculos para
peças (um receptáculo é uma bacia retangular de material plástico). Os receptáculos são todos
do mesmo tamanho. Os corredores são numerados e os receptáculos são numerados por
corredor. 

As peças recebidas são colocadas sobre um estrado. Este estrado é então levado para o
almoxarifado por uma empilhadeira e as peças são distribuídas nos receptáculos. */

Create Table Receptaculo(
	cd_Receptaculo Int Not Null,
	cd_Corredor Int Not Null,
	cd_Peca Int,
	qt_Estocada Int
)
Go


/* A saída do almoxarifado se dá contra pedidos de clientes. Um pedido pode solicitar vários tipos
de peças. Todas peças que atendem um pedido são juntadas, embaladas e colocadas em uma
rampa de carga onde encosta o caminhão do cliente.  */

Create Table Pedido(
	cd_Pedido Int Not Null,
	cd_Cliente Int Not Null,
	vl_Pedido Money,
	dt_Pedido Datetime
)
Go

/* Para cada pedido, o setor de saída monta uma lista de busca, que instrui o operador sobre que
peças, em quantidade ele deve buscar em que receptáculos */

Create Table Itens_Pedido(
	cd_Pedido Int Not Null,
	cd_Peca Int Not Null,
	qt_Peca Int Not Null,
	vl_Peca Money
)
Go

/* O almoxarifado somente atende empresas. É necessário manter um cadastro de clientes com
CGC, nome, endereço e telefone de contato. Para cada peça é necessário conhecer seu UPC
(“Universal Product Code”), descrição e número interno à organização. */

Create Table Cliente(
	cd_Cliente Int Not Null,
	cd_Cnpj Varchar(20) Not Null,
	nm_Cliente Varchar(40),
	ds_Endereco Varchar(50),
	cd_Telefone Int
)
Go

-- Tabelas Procedures/Triggers

Create Table Pedidos_Finalizados(
	cd_Pedido Int Not Null,
	cd_Cliente Int Not Null,
	vl_Pedido Money,
	dt_Pedido Datetime
)
Go

Create Table Pedidos_Pecas_Finalizados(
	cd_Pedido Int Not Null,
	cd_Peca Int Not Null,
	qt_Peca Int Not Null,
	vl_Peca Money
)
Go

Create Table Pecas_Requisicao(
	cd_Peca Int Not Null,
	qt_Estoque Int Not Null,
	qt_Comprar Int
)
Go

Create Table Historico_Pecas_Excluidas(
	cd_Peca Int Not Null,
	ds_Peca Varchar(100)
)
Go

Create Table TentativasLog(
	cd_Log Int Not Null,
	dt_Log Datetime,
	ds_Operacao Varchar(60),
	cd_Peca Int,
	nm_Usuario Varchar(50)
)
Go

Create Table Historico_Precos(
	cd_Preco Int Not Null,
	cd_Peca Int Not Null,
	dt_Preco Datetime,
	vl_Preco_Antigo Money,
	vl_Preco_Novo Money,
	nm_Usuario Varchar(50)
)
Go