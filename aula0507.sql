-- 1

select distinct concat(clientes.nome, " ", clientes.sobrenome) as NomeCompleto,
faturas.cidade_cobranca
from clientes
inner join faturas
on clientes.id = faturas.id_cliente;

-- 2

select cancoes.nome, tipos_de_arquivo.nome
from cancoes
left join tipos_de_arquivo
on cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id
order by cancoes.id
limit 4000;

-- 3

select faturas.id_cliente, faturas.data_fatura, cancoes.nome
from faturas
inner join itens_da_faturas
on faturas.id = itens_da_faturas.id_fatura
inner join cancoes
on cancoes.id = itens_da_faturas.id_cancao
order by faturas.id_cliente desc;

-- 4

select artistas.nome, albuns.titulo, cancoes.nome
from artistas
inner join albuns
on artistas.id = albuns.id_artista
inner join cancoes
on albuns.id = cancoes.id_album
order by artistas.nome desc;

-- 5

select generos.nome as Generos, cancoes.nome Cancoes, tipos_de_arquivo.nome as "Tipos de arquivo"
from cancoes
left join tipos_de_arquivo
on cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id
inner join generos
on generos.id = cancoes.id_genero
order by generos.nome desc;