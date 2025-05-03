
INSERT INTO cliente (cpf, nome) VALUES
('98765432100', 'Felipe Andrade'),
('87654321099', 'Beatriz Lima'),
('76543210988', 'Marcos Ferreira'),
('65432109877', 'Tatiane Ramos'),
('54321098766', 'Ricardo Moreira');

INSERT INTO cor (cor) VALUES
('Preto'),
('Branco'),
('Prata'),
('Vermelho'),
('Azul');

INSERT INTO pagamento (tipo) VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('PIX'),
('Transferência');

INSERT INTO modelo (tipo) VALUES
('Sedan'),
('Hatch'),
('SUV'),
('Pickup'),
('Esportivo');

INSERT INTO categoria (tipo) VALUES
('Passeio'),
('Utilitário'),
('Carga'),
('Luxo'),
('Comercial');

INSERT INTO tipo_conserto (nome, preco) VALUES
('Troca de óleo', 149.90),
('Alinhamento', 95.50),
('Balanceamento', 82.75),
('Freios', 310.00),
('Revisão completa', 520.00);

INSERT INTO peca (estoque, preco, nome_peca) VALUES
(12, 48.00, 'Filtro de óleo'),
(6, 105.00, 'Pastilha de freio'),
(7, 72.00, 'Correia dentada'),
(18, 58.00, 'Velas de ignição'),
(22, 42.00, 'Lâmpada do farol');

INSERT INTO funcionario (cpf, nome) VALUES
('99988877766', 'Eduardo Pacheco'),
('88877766655', 'Larissa Mendes'),
('77766655544', 'André Rocha'),
('66655544433', 'Patrícia Almeida'),
('55544433322', 'Tiago Carvalho');

INSERT INTO automovel (placa, id_cor, id_modelo, id_categoria, id_cliente) VALUES
('QWE1Z23', 1, 3, 2, 1),
('RTY2X34', 2, 2, 4, 2),
('UIO3C45', 3, 5, 1, 3),
('PAS4V56', 4, 1, 5, 4),
('DFG5B67', 5, 4, 3, 5),
('DJ2FD3F', NULL, 4, 3, 1),
('DWI21DF', NULL, 3, 2, 1);

INSERT INTO manutencao (qtd_manutencao, data, id_funcionario, id_automovel, id_tipo_conserto) VALUES
(NULL, '2025-04-10 08:30:00', 1, 1, 2),
(5, '2025-04-12 09:45:00', 2, 2, 4),
(3, '2025-04-13 11:00:00', 3, 3, 1),
(3, '2025-04-15 13:15:00', 4, 4, 3),
(7, '2025-04-17 16:30:00', 5, 5, 5);

INSERT INTO manutencao_peca (id_manutencao, id_peca, quantidade) VALUES
(1, 2, 1),
(2, 4, 5),
(3, 1, 3),
(4, 3, 3),
(5, 5, 7);

INSERT INTO pedido (tipo_pedido, preco_total, id_pagamento, id_cliente, data) VALUES
('Troca de óleo', 149.90, 1, 1, '2025-04-10 10:00:00'),
('Balanceamento', 82.75, 2, 2, '2025-04-11 11:00:00'),
('Freios', 310.00, 3, 3, '2025-04-12 12:00:00'),
('Alinhamento', 95.50, 4, 4, '2025-04-13 13:00:00'),
('Revisão completa', 520.00, 5, 5, '2025-04-14 14:00:00');

INSERT INTO pedido_peca (id_pedido, id_peca, quantidade) VALUES
(1, 1, 1),
(1, 4, NULL),
(3, 2, 1),
(4, 3, 1),
(5, 5, 1);

INSERT INTO pedido_servico (id_pedido, id_tipo_conserto) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 2),
(5, 5);