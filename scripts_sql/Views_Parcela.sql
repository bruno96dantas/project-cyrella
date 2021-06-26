-- valor em reais por mês
CREATE VIEW ValorMes
AS
select sum(ValorPrestacao) valorTotal, concat(mes,'/',ano) as 'mes/ano' from (select ValorPrestacao,  month(datavencimento) mes,  year(datavencimento) ano
from Parcela where situacaoparcela<>'PA') as soma group by mes, ano ;

-- top dividas
CREATE VIEW TopDividas
AS
Select top(10) dense_rank() over ( order by valortotal desc) as 'rank', valortotal, mesano from  (select sum(ValorPrestacao) valorTotal, concat(mes,'/',ano) as 'mesano' from (select ValorPrestacao,  month(datavencimento) mes,  year(datavencimento) ano
from Parcela where situacaoparcela<>'PA') as soma group by mes, ano) as  v ;


--devoderes por mais tempos
CREATE VIEW TopDevedores
AS
select top(10) data, contrato, sum(valorprestacao) total from (
select cast(datavencimento as date) 'data', contrato, valorprestacao from parcela) as t group by contrato, data, valorprestacao order by data desc

