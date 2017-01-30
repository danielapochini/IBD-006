Create Procedure compararEstoque
	@Peca Int
As
	Declare @estoqueAtual Int, @estoqueMin Int, @qtdCompra Int

	Set @estoqueAtual = (Select qt_Estoque From Pecas Where cd_Peca = @Peca)
	Set @estoqueMin = (Select qt_Minima From Pecas Where cd_Peca = @Peca)

	Set @qtdCompra = @estoqueMin - @estoqueAtual

	If @estoqueAtual < @estoqueMin
		Insert Into Pecas_Requisicao
			Values (@Peca, @estoqueAtual, @qtdCompra)