Create Trigger excluirPeca On Pecas
    Instead Of Delete 
    As
	Begin
		Declare @Peca Int
		Set @Peca = (Select cd_Peca From Deleted)
		If Exists (Select cd_Peca From Deleted Where qt_Estoque = 0)
			Begin
				Declare @ds_Peca Varchar(100)
				Set @ds_Peca = (Select ds_Peca From Deleted Where qt_Estoque = 0)

				Insert Into Historico_Pecas_Excluidas
					Values(@Peca, @ds_Peca)

				Delete Pecas Where cd_Peca = @Peca
			End
		Else
			Begin
				Declare @cd_Log Int
				Set @cd_Log = (Select Max(cd_Log) From TentativasLog) + 1
				Set @cd_Log = IsNull(@cd_Log, 1)

				Insert Into TentativasLog
					Values(@cd_Log, GetDate(), 'Exclusão de Peça', @Peca, 'root') 
			End
	End 
