use Imovel

go

-- 1.	Faça uma lista de imóveis do mesmo bairro do imóvel 2. Exclua o imóvel 2 da sua busca.

Select cd_Bairro
	From Imovel
		Where cd_Imovel = 2
go

Select cd_Imovel, cd_Bairro
	From Imovel
		Where cd_Bairro = 2 and cd_Imovel != 2
go

Select cd_Imovel, cd_Bairro
	From Imovel
		Where cd_Bairro = 
			(Select cd_Bairro
				From Imovel
				Where cd_Imovel = 2) -- retorna o cod do bairro
			and cd_Imovel <> 2
go

-- 2.	Faça uma lista que mostre todos os imóveis que custam mais que a média de preço dos imóveis.

Select cd_Imovel, vl_Imovel
	From Imovel 
		Where vl_Imovel >
			(Select AVG(vl_Imovel) 
				From Imovel)
go

-- 3.	Faça uma lista com todos os compradores que tenham ofertas cadastradas com o valor superior a 70 mil.

Select cd_Comprador, vl_Oferta
	From Oferta
		Where vl_oferta > 70000
go

-- 4.	Faça uma lista com todos os imóveis com oferta superior à média do valor das Ofertas.

Select cd_Imovel, vl_Oferta 
	From Oferta 
		Where vl_Oferta >
			(Select AVG(vl_Oferta)
					From Oferta)
go

-- 5.	Faça uma lista com todos os imóveis com preço superior à média de preço dos imóveis do mesmo bairro.

Select cd_Imovel, vl_Imovel
		From Imovel as I
			Where vl_Imovel > 
				(Select AVG(vl_Imovel)
					From Imovel 
						Where cd_Bairro = I.cd_Bairro)
go
	
 -- 6.	Faça uma lista dos imóveis com o maior preço agrupado por bairro, cujo maior preço seja superior à média de preços dos imóveis.

 Select cd_Bairro, MAX(vl_Imovel)
	From Imovel  
		Group by cd_Bairro
			Having MAX(vl_Imovel) >
				(Select AVG(vl_Imovel)
					From Imovel)
go

-- 7.	Faça uma lista com os imóveis que tem o preço igual ao menor preço de cada vendedor

Select cd_Imovel, cd_Vendedor, vl_Imovel
	From Imovel as I
		Where vl_Imovel = 
				(Select MIN(vl_Imovel)
					From Imovel 
						Where cd_Vendedor = I.cd_Vendedor)

go

-- 8.	Faça uma lista com os imóveis que têm o preço igual ao menor preço de todos os vendedores, exceto os imóveis do próprio vendedor.

Select cd_Imovel, cd_Vendedor, vl_Imovel
	From Imovel as I
		Where vl_Imovel =
				(Select MIN(vl_Imovel)
					From Imovel 
						Where cd_Vendedor <> I.cd_Vendedor) 
go

-- 9.	Faça uma lista com as ofertas menores que todas as ofertas do comprador 2, exceto os imóveis do próprio comparador.

Select cd_Imovel, cd_Comprador, vl_Oferta
	From Oferta
		Where vl_Oferta < 
			(Select max(vl_Oferta)
			From Oferta
			Where cd_Comprador = 2)
		and cd_Comprador <> 2
go

-- 10.	Faça uma lista de todos os imóveis cujo Estado e Cidade sejam os mesmos do vendedor 3, exceto os imóveis do vendedor 3.

Select cd_Imovel, cd_Cidade, sg_Estado, cd_Vendedor
		From Imovel as I
		Where (sg_Estado) in (Select sg_Estado
							From Imovel
							Where cd_Vendedor = 3) and
			   (cd_Cidade) in (Select cd_Cidade
							From Imovel
							Where cd_Cidade = 3)
				and cd_Vendedor <> 3
go
-- 11.	Faça uma lista com todos os nomes de bairro cujos imóveis sejam do mesmo Estado, cidade e bairro do imóvel código 5.

Select  nm_Bairro
From Bairro
	Where (sg_Estado) = 
			(Select sg_Estado
				From Imovel
					Where cd_Imovel = 5) and
			(cd_Cidade) =
				(Select cd_Cidade
				From Imovel
					Where cd_Imovel = 5) and
			(cd_Bairro) =
				(Select cd_Bairro
					From Imovel
						Where cd_Imovel = 5)
go