-- Exemplo Function 

Create Function sf_Fat(@Num Integer) Returns int as
BEGIN
	DECLARE @Fator INT, @I INT
	SET @Fator = 1
	SET @I = 1
	IF (@Num > 1)
		WHILE (@I <= @Num)
			BEGIN
				SET @Fator = @Fator * @I;
				SET @I = @I + 1
			END
	RETURN (@Fator)	
END

-- 1.	Escreva uma função que receba o código do Imóvel como parâmetro e retorne a quantidade de ofertas recebidas de todos os imóveis mesmo que não tenha oferta cadastrada, mostrando zero na quantidade.
Create Function MostraOferta (@Imovel int)
Returns int
as
  Begin
	Declare @Quant int
	set @Quant = (Select count(*) from oferta 
                 where cd_Imovel = @imovel)
	Return(@Quant)
  End

-- 2.	Escreva uma função que receba o código do Imóvel como parâmetro e mostre o nome do comprador que fez a última oferta.

Create Function MostraComprador (@Imovel int)
Returns Varchar(20)
as
  Begin
	   Declare @Nome varchar(20)
	   set @Nome =(Select C.nm_Comprador 
			from Comprador C Inner Join Oferta O
			on C.cd_Comprador = O.cd_Comprador
			Where O.cd_Imovel = @Imovel and
				O.dt_Oferta = (select max(dt_Oferta)
						from oferta
						where cd_Imovel = @Imovel))
	   Return(@Nome)
	End
