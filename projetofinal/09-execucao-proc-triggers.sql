-- Procedure Ex 1
Exec receberEstoque 1, 2, 110

-- Procedure Ex 2 
Exec finalizarPedido 07, 2016

-- Procedure Ex 3
Exec compararEstoque 4

-- Trigger Ex 1
Delete Pecas 
	Where cd_Peca = 5

-- Trigger Ex 2
Update Pecas
	Set vl_Peca = vl_Peca * 1.2
		Where cd_Peca = 3