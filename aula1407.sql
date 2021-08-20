-- TABELA FATURAS

-- Crie uma procedure que selecione a fatura com o valor mais baixo de todas.
delimiter //
create procedure `menorFatura`()
begin
SELECT min(valor_total) FROM faturas;
END //
delimiter ;

call menorFatura();

-- Crie uma procedure que retorna a quantidade de faturas que tem o país de cobrança como “Canada”.

delimiter *-*
create procedure `faturasCanada`()
begin
SELECT count(id) FROM faturas where pais_cobranca="Canada";
END *-*
delimiter ;

call faturasCanada();

-- Uma procedure que retorna o valor somado de todas as faturas.

delimiter *-*
create procedure `faturasTotal`()
begin
SELECT sum(valor_total) FROM faturas;
END *-*
delimiter ;

call faturasTotal;

-- Uma procedure que retorna o valor médio de todas as faturas.

delimiter *-*
create procedure `faturasMedia`()
begin
SELECT avg(valor_total) FROM faturas;
END *-*
delimiter ;

call faturasMedia;

-- TABELA CANCOES

-- Crie uma procedure que retorna o tamanho em bytes e a duração de uma canção pelo seu id.

delimiter *-*
create procedure `cancoesTamanhoDuracao`(in id_cancao int)
begin
SELECT cancoes.nome, cancoes.bytes, cancoes.duracao_segundos FROM cancoes where cancoes.id = id_cancao;
END *-*
delimiter ;

call cancoesTamanhoDuracao(777);

-- Crie uma procedure que retorna o preço unitário uma canção pelo seu id.

delimiter *-*
create procedure `cancoesPreco`(in id_cancao int)
begin
SELECT cancoes.nome, cancoes.preco_unitario FROM cancoes where cancoes.id = id_cancao;
END *-*
delimiter ;

call cancoesPreco(777);

-- Crie uma procedure que retorna o id da canção, 
-- nome da canção e o tipo de arquivo(table tipos_de_arquivo) 
-- desta canção a partir de um id da canção informado.

delimiter *-*
create procedure `cancoesTipoArquivo`(in id_cancao int)
begin
SELECT cancoes.id, cancoes.nome Canção, tipos_de_arquivo.nome Tipo
FROM cancoes 
INNER JOIN tipos_de_arquivo
on tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo
where cancoes.id = id_cancao;
END *-*
delimiter ;

drop procedure cancoesTipoArquivo;

call cancoesTipoArquivo(777);

-- TABELA CLIENTES

-- Crie uma procedure que retorna o nome e sobrenome 
-- concatenados e também o email de todos os clientes.

delimiter *-*
create procedure `clientes`()
begin
SELECT concat(clientes.nome , " ", clientes.sobrenome) NomeCompleto, clientes.email 
FROM clientes; 
END *-*
delimiter ;

call clientes();

-- Crie uma procedure que retorna o nome completo 
-- (nome e sobrenome concatenados)  e também o endereço 
-- completo (endereço, cidade, estado e país) de um cliente pelo id informado.

delimiter *-*
create procedure `clientesEndereco`(in id_cliente int)
begin
SELECT concat(clientes.nome , " ", clientes.sobrenome) NomeCompleto, 
concat(clientes.endereco, "-", clientes.cidade, "-", clientes.estado, "-", clientes.pais) EndereçoCompleto
FROM clientes
where id = id_cliente; 
END *-*
delimiter ;

call clientesEndereco(1);

-- Crie uma procedure que retorna o nome do cliente
-- e o valor total de cada uma das suas faturas pelo 
-- id do cliente informado.

delimiter *-*
create procedure `clientesFaturas`(in id_cliente int)
begin
SELECT concat(clientes.nome , " ", clientes.sobrenome) NomeCompleto, 
sum(faturas.valor_total) FaturasTotal
FROM clientes
inner join faturas
on faturas.id_cliente = clientes.id
where clientes.id = id_cliente; 
END *-*
delimiter ;

call clientesFaturas(1);
