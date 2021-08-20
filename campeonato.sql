CREATE SCHEMA `campeonato`;

CREATE TABLE `campeonato`.`competidores`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100),
    `endereco` VARCHAR(255),
    `email` VARCHAR(80),
    `cpf` INT,
    PRIMARY KEY(`id`)
);

CREATE TABLE `campeonato`.`eventos`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100),
    `endereco` VARCHAR(255),
    `modalidade` VARCHAR(80),
    PRIMARY KEY(`id`)
);

CREATE TABLE `campeonato`.`competidores_evento`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `id_competidor` INT,
    `id_evento` INT,
    `data_horario` DATETIME,
    PRIMARY KEY(`id`),
    CONSTRAINT `FKcompetidor`
		FOREIGN KEY(`id_competidor`) 
        REFERENCES `campeonato`.`competidores`(`id`),
	CONSTRAINT `FKevento`
		FOREIGN KEY(`id_evento`)
        REFERENCES `campeonato`.`eventos`(`id`)
)