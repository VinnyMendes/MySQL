SELECT g.nome, COUNT(c.id) as qtd_cancoes
FROM cancoes AS c
INNER JOIN generos AS g
ON c.id_genero = g.id
GROUP BY g.nome
ORDER BY qtd_cancoes DESC;

SELECT g.nome, COUNT(c.id) as qtd_cancoes
FROM cancoes AS c
INNER JOIN generos AS g
ON c.id_genero = g.id
GROUP BY g.nome
HAVING qtd_cancoes >10
ORDER BY qtd_cancoes DESC;

SELECT c.pais, COUNT(c.id) as qtd_cliente , SUM(f.valor_total) as fatura_total
FROM clientes AS c
INNER JOIN faturas AS f
ON c.id = f.id_cliente
GROUP BY c.pais
ORDER BY fatura_total DESC
LIMIT 7;