Create Trigger modificarPreco On Pecas
    For Update 
    As
	Begin
		If (Select vl_Peca From Inserted) <> (Select vl_Peca From Deleted)
		Begin
			Declare @Preco Int, @Peca Int, @ValorAntigo Money, @ValorNovo Money
			Set @Preco = (Select Max(cd_Preco) From Historico_Precos) + 1
			Set @Preco = IsNull(@Preco, 1)
			Select @Peca = cd_Peca From Inserted
			Select @ValorNovo = vl_Peca From Inserted
			Select @ValorAntigo = vl_Peca From Deleted

			Insert Into Historico_Precos
				Values(@Preco, @Peca, GetDate(), @ValorAntigo, @ValorNovo, 'root') 	
		End
	End
