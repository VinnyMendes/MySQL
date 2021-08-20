-- 1A -------------------------------- 347
select artistas.nome, albuns.titulo
from artistas 
inner join albuns
on albuns.id_artista = artistas.id
order by artistas.id;
-- 1B -------------------------------- 418
select artistas.nome, albuns.titulo
from artistas 
left join albuns
on albuns.id_artista = artistas.id
order by artistas.id;
-- 2A -------------------------------- 350
select clientes.id, clientes.nome, faturas.valor_total
from clientes
inner join faturas
on clientes.id = faturas.id_cliente;
-- 2B -------------------------------- 412
select clientes.id, clientes.nome, faturas.valor_total
from clientes
right join faturas
on clientes.id = faturas.id_cliente;
-- 3A -------------------------------- 850
select cancoes.nome, tipos_de_arquivo.nome
from cancoes
inner join tipos_de_arquivo
on tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;
-- 3B -------------------------------- 853
select cancoes.nome, tipos_de_arquivo.nome
from cancoes
right join tipos_de_arquivo
on tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;
-- 3C -------------------------------- 3503
select cancoes.nome, tipos_de_arquivo.nome
from cancoes
left join tipos_de_arquivo
on tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;
-- --------------------------------------------------------------


create view umA as 
select artistas.nome, albuns.titulo
from artistas 
inner join albuns
on albuns.id_artista = artistas.id
order by artistas.id;

create view umB as 
select artistas.nome, albuns.titulo
from artistas 
left join albuns
on albuns.id_artista = artistas.id
order by artistas.id;

create view doisA as 
select clientes.id, clientes.nome, faturas.valor_total
from clientes
inner join faturas
on clientes.id = faturas.id_cliente;

create view doisB as 
select clientes.id, clientes.nome, faturas.valor_total
from clientes
right join faturas
on clientes.id = faturas.id_cliente;

create view tresA as 
select cancoes.nome as cancoesNome, tipos_de_arquivo.nome as tiposNome
from cancoes
inner join tipos_de_arquivo
on tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;

create view tresB as 
select cancoes.nome as cancoesNome, tipos_de_arquivo.nome as tiposNome
from cancoes
right join tipos_de_arquivo
on tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;

create view tresC as 
select cancoes.nome as cancoesNome, tipos_de_arquivo.nome as tiposNome
from cancoes
left join tipos_de_arquivo
on tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;

create view todasCancoes as 
select cancoes.nome from cancoes;

create view faturasMaiorQue5 as 
select * from faturas
where faturas.valor_total > 5;

create view artistasB as
select artistas.nome from artistas
where artistas.nome like 'B%';

select * from umA;
select * from umB;
select * from doisA;
select * from doisB;
select * from tresA;
select * from tresB;
select * from tresC;
select * from todasCancoes;
select * from faturaMaiorQue5;
select * from artistasB;