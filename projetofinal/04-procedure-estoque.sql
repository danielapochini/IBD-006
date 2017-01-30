Create Procedure receberEstoque
	@OC Int, 
	@Peca Int,
	@qtdEntregue Int
As
	Declare @Entrega Int, @Estoque Int, @maxRecept Int

	Set @Entrega = (Select Max(cd_Entrega) From Entrega) + 1
	Set @Entrega = IsNull(@Entrega, 1)

	Insert Into Entrega
		Values (@Entrega,@OC, GetDate())

	Insert Into Itens_Entrega
		Values (@Entrega, @Peca, @qtdEntregue)

	Set @Estoque = (Select qt_Estoque From Pecas Where cd_Peca = @Peca) + @qtdEntregue
	
	Print 'Registrou Uma Nova Entrega'

	Update Pecas
		Set qt_Estoque = @Estoque
		Where cd_Peca = @Peca
	Print 'Atualização Do Numero De Peças Em Estoque'
	
	Update Itens_OrdemCompra
		Set qt_Entregue = @qtdEntregue
		Where cd_Peca = @Peca
	Print 'Atualização Em Itens Ordem De Compra - Quantidade De Peças Entregues'

	Update Receptaculo
			Set qt_Estocada = qt_Estocada + @qtdEntregue
			Where cd_Peca = @Peca And
			qt_Estocada = (Select Min(qt_Estocada) From Receptaculo Where cd_Peca = @Peca)
		Print 'Atualização Em Quantidade Estocada No Receptaculo'
		
		Select @maxRecept = qt_MaxReceptaculo From Pecas Where cd_Peca = @Peca
		If Exists (Select cd_Receptaculo From Receptaculo Where qt_Estocada >= @maxRecept)
		Begin
			Declare @cdRecept Int, @qtdExtra Int, @qtdNovaCarga Int, @cdNovaCarga Int, @qtRecept Int
			
			Select @cdRecept = cd_Receptaculo, @qtdExtra = qt_Estocada From Receptaculo Where qt_Estocada >= @maxRecept
			Set @qtdNovaCarga = @qtdExtra - @maxRecept
			While @qtdNovaCarga > 0
			
			Begin
				Set @cdNovaCarga = (Select Max(cd_Receptaculo) From Receptaculo) + 1
				Set @cdNovaCarga = Isnull(@cdNovaCarga, 1)

				If @qtdNovaCarga > @maxRecept
					Set @qtRecept = @maxRecept
				Else 
					Set @qtRecept = @qtdNovaCarga
					
				Insert Into Receptaculo
					Values (@cdNovaCarga, 1, @Peca, @qtRecept)
				Print 'Atualização: Utilizando Um Novo Receptaculo'

				Set @qtdNovaCarga = @qtdNovaCarga - @qtRecept
			End

			Update Receptaculo
				Set qt_Estocada = @maxRecept
				Where cd_Receptaculo = @cdRecept
		End