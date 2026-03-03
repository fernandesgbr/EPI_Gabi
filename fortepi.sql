CREATE DATABASE IF NOT EXISTS db_fortepi;
USE db_fortepi;

CREATE TABLE IF NOT EXISTS setor (
id_setor INT AUTO_INCREMENT PRIMARY KEY,
nome_setor VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS fornecedor (
id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(80) NOT NULL,
cnpj CHAR(14) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS funcionario (
id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf CHAR(11) UNIQUE NOT NULL,
cargo VARCHAR(80),
email VARCHAR (100) UNIQUE NOT NULL,
senha_de_rede VARCHAR (50) NOT NULL,
id_setor INT NOT NULL,
dt_admissao DATE,
nascimento DATE,
status VARCHAR(20) DEFAULT 'Ativo',
FOREIGN KEY (id_setor)
REFERENCES setor(id_setor)
);

CREATE TABLE IF NOT EXISTS epi (
id_epi INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
tipo VARCHAR(60),
fabricante VARCHAR(80),
dt_validade DATE NOT NULL,
periodicidade_meses INT DEFAULT 12
);
CREATE TABLE IF NOT EXISTS estoque (
id_estoque INT AUTO_INCREMENT PRIMARY KEY,
id_epi INT NOT NULL,
id_fornecedor INT,
qtd_disponivel INT NOT NULL DEFAULT 0,
lote VARCHAR(40),
FOREIGN KEY (id_epi) REFERENCES epi(id_epi),
FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);
CREATE TABLE IF NOT EXISTS entrega (
id_entrega INT AUTO_INCREMENT PRIMARY KEY,
id_funcionario INT NOT NULL,
id_epi INT NOT NULL,
id_estoque INT,
dt_entrega DATE NOT NULL,
dt_devolucao DATE, -- NULL = não devolvido
assinatura BOOLEAN DEFAULT FALSE,
observacao TEXT,
FOREIGN KEY (id_funcionario)
REFERENCES funcionario(id_funcionario),
FOREIGN KEY (id_epi)
REFERENCES epi(id_epi),
FOREIGN KEY (id_estoque)
REFERENCES estoque(id_estoque)
);

