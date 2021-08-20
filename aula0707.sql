-- TABELA CANCOES

SHOW INDEX FROM cancoes;

EXPLAIN SELECT cancoes.nome FROM cancoes WHERE cancoes.nome = "Hero";

CREATE INDEX I_cancoes_nome ON cancoes (nome);

DROP INDEX I_cancoes_nome ON cancoes;

-- TABELA ALBUNS

SHOW INDEX FROM albuns;

EXPLAIN SELECT albuns.titulo FROM albuns WHERE albuns.titulo = "Na Pista";

CREATE INDEX I_albuns_titulo ON albuns (titulo);

DROP INDEX I_albuns_titulo on albuns;