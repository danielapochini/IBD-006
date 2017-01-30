use Imovel
go

-- 1. Liste todas as linhas e os campos cd_Comprador, nm_Comprador e ds_Email da tabela COMPRADOR
Select cd_Comprador, nm_Comprador, ds_Email
	From Comprador
go

-- 2.Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela 
Select cd_Vendedor, nm_Vendedor, ds_Email
	From Vendedor
	Order by nm_Vendedor asc;
go

-- 3.Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os imóveis do vendedor 2.
Select cd_Imovel, cd_Vendedor, vl_Imovel
	From Imovel
		Where cd_Vendedor = 2;	
go

-- 4.Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e sejam do Estado do RJ.
Select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
	From Imovel
	Where vl_Imovel < 150000 and sg_Estado = 'RJ'
go

-- 5.Liste as colunas cd_Imovel, cd_Vendedor, vl_Preco e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil ou seja do vendedor não seja 2.
Select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
	From Imovel
	Where vl_Imovel < 150000 or cd_Vendedor <> 2
go

-- 6. Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco e sg_Estado da tabela COMPRADOR em que o Estado seja nulo.
Select cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado
	From Comprador 
	Where sg_Estado is null
go

-- 7.Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mill
Select *
	From Oferta
	Where vl_Oferta between 100000 and 150000
go

-- 8. Liste todas as ofertas cuja data da oferta esteja entre 01/02/2009 e 01/03/2009.
Select *
	From Oferta
	Where dt_Oferta between '01-01-2009' and '01-03-2009'
go

-- 9. Liste todos os vendedores que comecem com a letra M.
Select *
	From Vendedor
	Where nm_Vendedor like 'M%'
go

-- 10. Liste todos vendedores que tenham a letra A na segunda posição do nome
Select *
	From Vendedor
	Where nm_Vendedor like '_A%'
go

-- 11. Liste todos os compradores que tenham a letra U em qualquer posição do endereço
Select *
	From Comprador
	Where nm_Comprador like '%U%'
go

-- 12. Liste todos os imóveis cujo código seja 2 ou 3 em ordem alfabética de endereço.
Select *
	From Imovel
	Where cd_Imovel in (2,3)
	Order by ds_Endereco
go

-- 13. Liste todas as ofertas cujo imóvel seja 2 ou 3 e o valor da oferta seja maior que 140 mil, em ordem decrescente de data.
Select *
	From Oferta
	Where cd_Imovel in (2,3) and vl_Oferta > 140000
	Order by dt_Oferta DESC
go

-- 14. Liste todos os imóveis cujo preço de venda esteja entre 110 mil e 200 mil ou seja do vendedor 1 em ordem de área útil.
Select *
	From Imovel
	Where (vl_Imovel between 110000 and 200000) or cd_Vendedor = 1 
	Order by qt_AreaUtil
go

-- 15. Verifique a maior, a menor e o valor médio das ofertas da tabela.
Select max(vl_Oferta) Maior, min(vl_Oferta) Menor, avg(vl_Oferta) Media
	From Oferta
go

-- 16. Mostre o maior, o menor, o total e a média de preço de venda dos imóveis.
Select max(vl_Imovel) Maior, min(vl_Imovel) Menor, sum(vl_Imovel) Soma, avg(Vl_Imovel) Media
	From Imovel
go

-- 17. Modifique o comando anterior para que sejam mostrados os mesmos índices por bairro.
Select cd_Bairro, cd_Cidade, sg_Estado, Max(vl_Imovel) Maior, Min(vl_Imovel) Menor, Sum(vl_Imovel) Soma, Avg(vl_Imovel) Media
	From Imovel
	Group by cd_Bairro, cd_Cidade, sg_Estado
go

-- 18. Faça uma busca que retorne o total de ofertas realizadas nos anos de 2008, 2009 e 2010.
Select sum(vl_Oferta) Soma
	From Oferta
	Where Year(dt_Oferta) between 2008 and 2010