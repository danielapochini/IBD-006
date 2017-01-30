Insert Into Fornecedor
	Values (1, '68.422.419/0001-75', 'Palacio das Ferramentas e Parafusos Ltda', 'Avenida Santos Dumont, 11000 Franca/SP', 21049666),
		   (2, '02.557.216/0000-02', 'Prodemol Industria e Comercio de Ferramentas Ltda', 'Estrada Particular Sadae Takagi, 2760 São Bernardo do Campo/SP', 43936363)
Go

Insert Into Pecas
	Values (1, '30473', 'Parafusadeira à Bateria 3,6V 2000 110V SKIL', 30, 20, 50, 81),
		   (2, '53865', 'Parafusadeira à Bateria 3,6V com 33 Peças BIVOLT PBN 036 NOVE54', 35, 15, 50, 99),
		   (3, '51797', 'Bateria 14,4V 3,0Ah Lítio GBA LI-ION BOSCH', 22, 30, 58, 358),
		   (4, '32131', 'Furadeira Industrial 1/2 POL 550W BOSCH', 10, 35, 40, 235),
		   (5, '18357', 'Policorte 14 POL GCO 2000W GCO 2000  BOSCH', 16, 10, 24, 110)
Go

Insert Into OrdemCompra
	Values (1, 1, '5600', '28-07-2016'),
		   (2, 1, '2900', '12-08-2016'),
		   (3, 2, '3700', '16-09-2016')
Go

Insert Into Itens_OrdemCompra
	Values (1, 1, 20, 0, 81),
		   (1, 2, 110, 0, 99),
		   (1, 3, 75, 0, 358),
		   (2, 4, 155, 0, 235),
		   (3, 5, 100, 0, 110)
Go

Insert Into Receptaculo
	Values (1, 1, 1, 30),
		   (2, 1, 2, 35),
		   (3, 1, 3, 22),
		   (4, 1, 4, 10),
		   (5, 1, 5, 16)
Go

Insert Into Cliente
	Values (1, '98.643.219/0004-56', 'Loja SempreAberta', 'Avenida João Cleber, 156', 33551985),
		   (2, '67.749.172/0001-06', 'Soares Acessórios Peças e Serviços', 'Rua Eugênio Ribeiro, 42', 55109890),
		   (3, '19.144.125/0000-01', 'Covrechini Construções', 'Alameda Itu, 1067', 68124542)
Go

Insert Into Pedido
	Values (1, 1, '7160', '25-09-2016'),
		   (2, 3, '4050', '14-08-2016'),
		   (3, 2, '6930', '07-07-2016'),
		   (4, 1, '11750', '20-09-2016'),
		   (5, 3, '6000', '23-10-2016')
Go

Insert Into Itens_Pedido
	Values (1, 3, 20, 358),
		   (2, 1, 50, 81),
		   (3, 2, 70, 99),
		   (4, 1, 50, 235),
		   (5, 3, 60, 110)
Go