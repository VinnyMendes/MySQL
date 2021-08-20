-- Checkpoint Banco de Dados
-- Aluno: Vinícius Mendes da Silva
-- Turma: 2
-- Email: vinypotter.vm@gmail.com

-- Criando o banco de dados VinnyFlix
CREATE SCHEMA vinnyflix;

-- Criação das tabelas
CREATE TABLE `vinnyflix`.`endereco` (
	`endereco_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `endereco_cep` INT,
    `endereco_cidade` VARCHAR(100),
    `endereco_estado` VARCHAR(100),
    `endereco_logradouro` VARCHAR(100),
    `endereco_bairro` VARCHAR(50)
);

CREATE TABLE `vinnyflix`.`premiacao` (
	`premiacao_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `premiacao_nome` VARCHAR(250),
    `premiacao_data` DATE
);

CREATE TABLE `vinnyflix`.`ator` (
	`ator_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ator_nome` VARCHAR(25),
    `ator_sobrenome` VARCHAR(100)
);

CREATE TABLE `vinnyflix`.`genero` (
	`genero_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `genero_nome` VARCHAR(50),
    `genero_descricao` VARCHAR(351)
);

CREATE TABLE `vinnyflix`.`dados` (
	`dados_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dados_plano` VARCHAR(100),
    `dados_email` VARCHAR(100),
    `dados_pagamento` VARCHAR(255),
    `endereco_id` INT,
    CONSTRAINT `fk_dados_endereco`
		FOREIGN KEY (`endereco_id`)
        REFERENCES `vinnyflix`.`endereco` (`endereco_id`)
);

CREATE TABLE `vinnyflix`.`usuario` (
	`usuario_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `usuario_nome` VARCHAR(100),
    `usuario_contas` VARCHAR(12),
    `dados_id` INT,
    CONSTRAINT `fk_usuario_dados`
		FOREIGN KEY (`dados_id`)
        REFERENCES `vinnyflix`.`dados` (`dados_id`) 
);

CREATE TABLE `vinnyflix`.`filme` (
	`filme_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `filme_nome` VARCHAR(255),
    `filme_data_lancamento` DATE,
    `filme_classificacao` VARCHAR(2),
    `ator_id` INT,
    `genero_id` INT,
    `premiacao_id` INT,
    CONSTRAINT `fk_filme_ator`
		FOREIGN KEY (`ator_id`)
        REFERENCES `vinnyflix`.`ator` (`ator_id`),
	CONSTRAINT `fk_filme_genero`
		FOREIGN KEY (`genero_id`)
        REFERENCES `vinnyflix`.`genero` (`genero_id`),
	CONSTRAINT `fk_filme_premiacao`
		FOREIGN KEY (`premiacao_id`)
        REFERENCES `vinnyflix`.`premiacao` (`premiacao_id`)
);

CREATE TABLE `vinnyflix`.`usuario_filme` (
	`usuario_filme_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `usuario_filme_avaliacao` TINYINT,
	`usuario_id` INT,
    `filme_id` INT,
    CONSTRAINT `fk_usuario_filme_usuario`
		FOREIGN KEY (`usuario_id`)
        REFERENCES `vinnyflix`.`usuario` (`usuario_id`),
	CONSTRAINT `fk_usuario_filme_filme`
		FOREIGN KEY (`filme_id`)
        REFERENCES `vinnyflix`.`filme` (`filme_id`)
);

-- Inserindo dados

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('O Poderoso Chefão', '1972-7-7', '14');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('Matrix', '1999-5-21', '14');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('Toy Story', '1995-12-22', 'L');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('Jurassic Park', '1993-6-13', '14');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('Gladiador', '2000-5-19', '14');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('Wall-E', '2008-6-27', 'L');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('Tron: O Legado', '2010-12-17', '10');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('Senhor dos Aneis', '2002-1-1', '12');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('UP - Altas Aventuras', '2009-9-4', 'L');

INSERT INTO `vinnyflix`.`filme`(`filme_nome`, `filme_data_lancamento`, `filme_classificacao`)
VALUES ('Divertidamente', '2015-6-18', '10');

-- Atualizando dados

UPDATE `vinnyflix`.`filme` SET `filme_nome` = 'Senhor dos Anéis' 
WHERE `filme_nome` = 'Senhor dos Aneis';

UPDATE `vinnyflix`.`filme` SET `filme_classificacao` = '18'
WHERE `filme_nome`= 'O Poderoso Chefão';

UPDATE `vinnyflix`.`filme` SET `filme_data_lancamento` = '2009-9-3'
WHERE `filme_nome` = 'UP - Altas Aventuras';

-- Excluindo dados

DELETE FROM `vinnyflix`.`filme` 
WHERE `filme_nome` = 'Gladiador';

-- Selecionando dados

SELECT * FROM `vinnyflix`.`filme`;

















