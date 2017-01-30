-- 1. 	Escreva uma procedure que receba o nome do bairro e um valor percentual como parâmetro, aplique este percentual de acréscimo nos imóveis deste bairro.
Create Procedure ReajusteBairro
	@Bairro varchar(20), 
   @Percent decimal(4,2)
as
	Declare @Codigo int,@Cidade int, @Estado char(2), @valor money
    
	set @Codigo = (Select cd_Bairro from Bairro 
				Where nm_Bairro = @Bairro)
set @Cidade = (Select cd_Cidade from Bairro 
				Where nm_Bairro = @Bairro)
set @Estado = (Select sg_Estado from Bairro 
				Where nm_Bairro = @Bairro)

	set @Valor = (1 + @Percent / 100)
	Update Imovel
		Set vl_Imovel = vl_Imovel * @valor
		Where cd_Bairro = @Codigo 
and cd_Cidade = @Cidade and sg_Estado = @Estado


-- 2.	Escreva uma procedure que receba o código do comprador e um valor percentual como parâmetro, aplique este percentual de acréscimo na última oferta com o maior valor que esse comprador fez, se o valor desta oferta representar um valor inferior a 10% de acréscimo do valor do Imóvel, desconsiderar o reajuste.
Create Procedure ReajusteImovel 
	@Comprador int, @Percent decimal(4,2)
as
	declare @valor money, @imovel int, @ValorImovel int
	set @imovel = (select cd_imovel from Oferta
			Where dt_Oferta = (select max(dt_Oferta)from oferta
						  where cd_comprador = @Comprador) and
                      vl_oferta = (select max(vl_Oferta)from oferta
						  where cd_comprador = @comprador) and
			      cd_comprador = @Comprador)

	set @valor = (select vl_oferta from oferta 
			where cd_comprador = @Comprador and cd_imovel = @imovel)
	set @valor = @valor * (1 + (@percent / 100))
	set @ValorImovel = (Select vl_imovel from Imovel
					Where cd_Imovel = @imovel)
  	if @Valor > (@ValorImovel * 1.2)
	   Begin
		print 'Atualiza o valor da Oferta'
		update oferta set vl_Oferta = @valor
		Where cd_Comprador = @Comprador and cd_Imovel =  @imovel
	   end
	else
	   print 'Atualização descartada'


-- 3.	Escreva uma procedure que calcule a média dos valores das ofertas de cada imóvel e salve esta média no registro do imóvel.
 	Create Procedure MediaOferta 
	as
	UPDATE Imovel SET vl_MediaOferta = media
	FROM Imovel I INNER JOIN 
		(select cd_imovel, avg(vl_Oferta) media from Oferta
		group by cd_imovel) O
	ON I.cd_Imovel = O.cd_Imovel

-- 4.	Faça uma procedure que aplique um aumento no valor do Imóvel (cujo valor deve ser recebido como parâmetro), somente para os imóveis que estão com um índice de “BAIXO” na faixa de imóveis.
Create Procedure ReajustaImovel 
	@Percent decimal(4,2)
as
	UPDATE Imovel SET vl_Imovel = vl_Imovel * (1 + @Percent / 100)
	FROM Imovel I, Faixa_Imovel F
	Where I.vl_Imovel Between F.vl_Maximo and F.vl_Minimo and
		F.nm_Faixa = 'Médio'

-- 5.	Escreva uma procedure que receba um valor percentual como parâmetro e aplique um desconto no valor do Imóvel somente nos Imóveis do estado de São Paulo.
Create Procedure ReajustaImovelSP 
	@Percent decimal(4,2)
as
	UPDATE Imovel SET vl_Imovel = vl_Imovel * (1 + @Percent / 100)
	Where sg_Estado = 'SP'

-- 6.	Escreva uma procedure que receba como parâmetro o número do Imóvel, o número do comprador e a quantidade de parcelas em que o valor do imóvel será dividido. A procedure deve obter o valor do Imovel, calcular o valor de cada parcela e gravar cada parcela na tabela Parcelas. Se a quantidade de parcelas for maior que 3, acrescente 10% ao valor total do pedido, divida-o na quantidade de parcelas recebida como parâmetro e grave-as na tabela Parcelas.  Se a quantidade de parcelas for 1, retorne a mensagem: pedido à vista e interrompa o processamento. Não deixe que o número de parcelas ultrapasse a 10. Se ultrapassar, retorne a mensagem: Quantidade de parcelas inválida.
Antes de executar esta procedure, criar a tabela Parcelas e fazer o relacionamento com Imóvel e Comprador.

Create Table Parcelas (
	cd_Imovel int not null,
	cd_Parcela int not null,
	cd_Comprador int,
	vl_Parcela money,
	dt_Vencimento datetime,
	primary key (cd_Imovel, cd_Parcela)) 

Create Procedure ParcelasPedido 
	@Imovel int, @Comprador int, @Parcelas int
as
	Declare @Valor money, @Cont int, @Venc datetime
	set @Valor = (Select vl_Imovel From Imovel 
					Where cd_Imovel = @Imovel)

	If @Parcelas < 1 or @Parcelas > 10
        print 'Quantidade de parcela invalida'
    Else 
	  If @Parcelas = 1
		print 'Pagamento a Vista'
	  Else 
		If @Parcelas > 3
			Begin
				Set @Valor = @Valor * 1.10
				Set @Valor = @Valor / @Parcelas
			end
		Else
			Begin
				Set @Valor = @Valor / @Parcelas
			End
    Set @Cont = 0
    Set @Venc = getdate()	
    While @Parcelas > @Cont
	 Begin
        Set @Cont = @Cont + 1
        Insert Into Parcelas Values 
	  (@Imovel, @Cont, @Comprador, @Valor, dateadd(MM,@cont,@Venc))
	 End
