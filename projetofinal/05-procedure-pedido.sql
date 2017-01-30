Create Procedure finalizarPedido
	@month Int,
	@year Int
As
	Declare @Pedido Int
	
	If Exists(Select cd_Pedido From Pedido Where Month(dt_Pedido) = @month And Year(dt_Pedido) = @year)
	Begin	
		While Exists(Select cd_Pedido From Pedido Where Month(dt_Pedido) = @month And Year(dt_Pedido) = @year)
		Begin
			Select @Pedido = Max(cd_Pedido) From Pedido Where Month(dt_Pedido) = @month And Year(dt_Pedido) = @year
		
			Insert Into Pedidos_Finalizados
				Select * From Pedido Where cd_Pedido =  @Pedido
			
			If Exists(Select cd_Peca From Itens_Pedido Where cd_Pedido = @Pedido)
				While Exists(Select cd_Peca From Itens_Pedido Where cd_Pedido = @Pedido)
				Begin
					Insert Into Pedidos_Pecas_Finalizados
						Select Top 1 * From Itens_Pedido Where cd_Pedido = @Pedido

					Delete Itens_Pedido Where cd_Pedido = (Select Top 1 cd_Pedido From Itens_Pedido Where cd_Pedido = @Pedido)
				End
			Else
				Print 'Atenção: Não existem este Item no Pedido solicitado.'
		
			Delete Pedido Where cd_Pedido =  @Pedido
		End
	End 
	Else
		Print 'Atenção: Não existe pedido neste período (Mês/Ano)'