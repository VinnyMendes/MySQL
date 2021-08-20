CREATE SCHEMA `controle_educacao`;

CREATE TABLE `controle_educacao`.`escolas`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100),
    `endereco` VARCHAR(255),
    `email` VARCHAR(80),
    `cnpj` INT,
    PRIMARY KEY(`id`)
);

CREATE TABLE `controle_educacao`.`alunos`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100),
    `endereco` VARCHAR(255),
    `email` VARCHAR(80),
    `cpf` INT,
    `id_escola` INT,
    PRIMARY KEY(`id`),
    CONSTRAINT `FK_escola`
		FOREIGN KEY(`id_escola`) 
        REFERENCES `controle_educacao`.`escolas`(`id`)
);