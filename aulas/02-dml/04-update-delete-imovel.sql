use Imovel
go

-- 8. Aumente o pre�o de vendas dos im�veis em 10% 
update Imovel
	set vl_Imovel = vl_Imovel * 1.10
go

-- 9. Abaixe o pre�o de venda dos im�veis do vendedor 1 em 5% 
update Imovel
	set vl_Imovel = vl_Imovel * 0.95
		where cd_Vendedor = 1
go

-- 10. Aumente em 5% o valor das ofertas do comprador 2
update Oferta
	set vl_oferta = vl_oferta * 1.05
		where cd_Comprador = 2
go

-- 11. Altere o endere�o do comprador 3 para R. ANAN�S, 45 e o estado para RJ
update Comprador
	set ds_Endereco = 'R. ANAN�S, 45', sg_Estado = 'RJ'
		where cd_Comprador = 3
go

-- 12. Altere a oferta do comprador 2 no im�vel 4 para 101.000
update Oferta
	set vl_oferta = 101000
		where cd_Comprador = 2 and cd_Imovel = 4
go

-- 13. Exclua a oferta do comprador 3 no im�vel 1
delete Oferta
	where cd_Comprador = 3 and cd_Imovel = 1
go

-- 14. Exclua a cidade 3 do estado SP
delete Cidade
	where cd_Cidade = 3 and sg_Estado = 'SP'
go


/*  
15. Inclua linhas na tabela FAIXA_IMOVEL:
cd_Faixa nmFaixa vl_Minimo vl_Maximo
1 BAIXO 0 105000
2 M�DIO 105001 180000
3 ALTO 180001 999999
*/

insert into Faixa_Imovel
	(cd_Faixa, nm_Faixa, vl_Minimo, vl_Maximo)
	values (1, 'BAIXO', 0, 105000),
	(2, 'M�DIO', 105001, 180000),
	(3, 'ALTO', 180001, 999999)
go