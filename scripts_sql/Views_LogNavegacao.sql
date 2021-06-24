-- Acessos por página

CREATE VIEW AcessosPorPagina
AS
select count(Pagina) qtd_acessos, Pagina from [dbo].[LogNavegacao] group by Pagina;


--Quantidades de acessos por mês
CREATE VIEW AcessosPorMes
AS
select count(1) qtd_acessos, mes from (select  month(dataEvento) mes from LogNavegacao ) as meses group by mes

-- Top Atendentes
CREATE VIEW TopAtendentes
AS
select  DENSE_RANK() OVER(order by qtd desc) AS "rank", idatendente, qtd from (select  count(1)qtd, idatendente from LogNavegacao where idatendente is not null group by idatendente) as atendimentos;


-- Atividade Normalizada
CREATE VIEW AtividadeNormalizada
AS
select atividadenormalized from LogNavegacao where atividadenormalized is not null and atividadenormalized <> '';


 -- quantidade de eventos por data
 CREATE VIEW EventosPorData
 AS
 select count(1) qtd_acessos, mes, ano from (select  month(dataEvento) mes,  year(dataEvento) ano from log_navegacao ) as meses group by mes, ano

-- quantidade de acesso por origem 
CREATE VIEW QtdeOrigem
AS
select OrigemNormalized, count(1)  qtdOrigem from LogNavegacao group by OrigemNormalized
