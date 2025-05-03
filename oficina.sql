DROP DATABASE IF EXISTS oficina_glodi;
CREATE DATABASE oficina_glodi;
USE oficina_glodi;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE cor (
    id_cor INT AUTO_INCREMENT PRIMARY KEY,
    cor VARCHAR(50) NOT NULL
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE modelo (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_conserto (
    id_tipo_conserto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE peca (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome_peca VARCHAR(100) NOT NULL,
    estoque INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE automovel (
    id_automovel INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    id_cor INT,
    id_modelo INT,
    id_categoria INT,
    id_cliente INT,
    FOREIGN KEY (id_cor) REFERENCES cor(id_cor),
    FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    qtd_manutencao INT,
    data DATETIME NOT NULL,
    id_funcionario INT,
    id_automovel INT,
    id_tipo_conserto INT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
    FOREIGN KEY (id_automovel) REFERENCES automovel(id_automovel),
    FOREIGN KEY (id_tipo_conserto) REFERENCES tipo_conserto(id_tipo_conserto)
);

CREATE TABLE manutencao_peca (
    id_manutencao INT,
    id_peca INT,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (id_manutencao, id_peca),
    FOREIGN KEY (id_manutencao) REFERENCES manutencao(id_manutencao),
    FOREIGN KEY (id_peca) REFERENCES peca(id_peca)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pedido VARCHAR(100),
    preco_total DECIMAL(10, 2),
    id_pagamento INT,
    id_cliente INT,
    data DATETIME NOT NULL,
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE pedido_peca (
    id_pedido INT,
    id_peca INT,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (id_pedido, id_peca),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_peca) REFERENCES peca(id_peca)
);

CREATE TABLE pedido_servico (
    id_pedido INT,
    id_tipo_conserto INT,
    PRIMARY KEY (id_pedido, id_tipo_conserto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_tipo_conserto) REFERENCES tipo_conserto(id_tipo_conserto)
);
