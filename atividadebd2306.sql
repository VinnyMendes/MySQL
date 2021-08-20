SELECT artistas.nome as Artistas,
albuns.titulo as Albuns
FROM artistas
INNER JOIN albuns 
ON artistas.id = albuns.id_artista
order by artistas.id;

SELECT clientes.nome,
	faturas.valor_total
	FROM clientes
	INNER JOIN faturas
	ON clientes.id = faturas.id_cliente
	HAVING faturas.valor_total > 5
	order by faturas.valor_total DESC;

SELECT cancoes.nome AS Canções,
	tipos_de_arquivo.nome AS Arquivo
	FROM cancoes
	INNER JOIN tipos_de_arquivo
	ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id
	order by cancoes.id ASC;