-- 1) Revisão índices
-- a) Ex1: Na tabela canções liste todos os índices criados.
show index from cancoes;
-- b) Caso exista um índice criado na coluna nome, exclua-o.
DROP INDEX I_cancoes_nome ON cancoes;
-- c) Agora, crie um índice para a coluna nome.
CREATE INDEX I_cancoes_nome ON cancoes (nome);

-- 02) Explain
-- a) Use o comando Explain para fazer uma pesquisa
-- (select) na tabela canções que retorne o tamanho
-- da música chamada “Be Yourself”. E verifique o
-- número de rows percorridas (deve ser 1);
explain select length(cancoes.nome) from cancoes where cancoes.nome = "Be Yourself";

-- 3) Priority
-- a) Selecione todos os campos da tabela canções com
-- alta prioridade.
Select HIGH_PRIORITY * from cancoes;
-- b) Atualize o nome da canção “Crazy” para “I am
-- Crazy” com baixa prioridade.
UPDATE low_priority cancoes SET nome="I am Crazy" WHERE nome="Crazy";

-- 4) Benchmark
-- a) Faça o benchmark de uma consulta que retorne o
-- compositor da canção “I am Crazy” limitado a 1
-- registro realizada 100 milhões de vezes.
SELECT benchmark(100000000, (SELECT `compositor` FROM `cancoes` WHERE `nome`= 'I am Crazy' LIMIT 1));

-- 5) Permissões
-- a) Exiba todos os usuários dos bancos de dados.
select * from mysql.user;
-- b) Crie três usuários, um com o seu primeiro nome e
-- outros dois com nomes fictícios.
create user 'vinicius'@'localhost' identified by '123';
create user 'vegeta'@'localhost' identified by '123';
create user 'picolo'@'localhost' identified by '123';
-- c) Exiba novamente os usuários dos bancos de dados
-- para se certificar de que foram criados.
select * from mysql.user;
-- d) Conceda todos os privilégios, em todos os bancos e
-- tabelas para o usuário com o seu nome.
grant all privileges on *.* to vinicius@localhost;
-- e) Para o segundo usuário criado conceda a permissão
-- de inserir dados em todos os bancos e tabelas.
grant insert on *.* to vegeta@localhost;
-- f) Para o terceiro usuário conceda apenas a
-- permissão de selecionar dados da tabela canções
-- do banco musimundos_v2.
grant select on musimundosv2.* to picolo@localhost;
-- g) Exiba os privilégios do usuário com o seu nome.
show grants for vinicius@localhost;
-- h) Revogue a permissão de atualizar dados (update)
-- do usuário com o seu nome, para todos os bancos
-- de dados e tabelas.
revoke update on *.* from vinicius@localhost;
-- i) Exiba novamente os privilégios do usuário com o
-- seu nome.
show grants for vinicius@localhost;
-- j) Exclua o usuário com o seu nome e exiba
-- novamente os usuários.
drop user vinicius@localhost;
select * from mysql.user;