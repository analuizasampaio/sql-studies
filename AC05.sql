
-- Na base Concessionária, utilize funções de agregação para solucionar as seguintes questões: 
-- 1) Qual o número de registros existentes na tabela VendasAnuais ? 

SELECT COUNT(*) AS REGISTROS_EXISTENTES
FROM VendasAnuais

-- 2) Qual o acumulado da quantidade de vendas Totais até o momento ? 
SELECT SUM(qtd) AS ACUMULADO 
FROM VendasAnuais

-- 3) Quais as quantidades de vendas Totais até o momento para: menor venda, média de vendas e a maior venda? 
SELECT 
	MAX(qtd)	AS	MAIOR_VENDA
,	MIN(qtd)	AS	MENOR_VENDA
,	AVG(qtd)	AS	MEDIA
FROM VendasAnuais


-- 4) Extraia a soma das vendas anuais por ano em ordem descendente. 

SELECT
		SUM(qtd)	AS	VENDAS_ANUAIS, idAnodaVenda
FROM		VendasAnuais
GROUP BY	idAnodaVenda
ORDER BY	idAnodaVenda	ASC

-- 5) Traga a soma das vendas anuais para o veículo/modelo CG 125 STD (as informações do veículo devem constar na query). 

SELECT 
		SUM(qtd)		AS	SOMA_VENDAS_ANUAIS
FROM	VendasAnuais	AS	VDS
INNER JOIN
		Veiculo			AS	CARRO
ON		VDS.idVeiculo	=	CARRO.idVeiculo


-- 6) Traga as primeiras datas (ANOS) de FABRICAÇÃO de todos os veículos e modelos, 
-- ordenados pelo nome do fabricante (ascendente), ano (descendente), Veículo (ascendente) 
-- e Modelo (descendente) Toda as informações solicitadas, inclusive ordenação, devem constar na query. 

SELECT CARRO.descricao AS CARRO, MODELO.descricao AS MODELO, ANO.descricao AS ANO
FROM Veiculo	AS	CARRO
INNER JOIN Modelo	AS MODELO	
ON	CARRO.idModelo = MODELO.idModelo
INNER JOIN Ano	AS ANO
ON CARRO.idAnoFabricacao	=	ANO.idAno

ORDER BY CARRO.descricao ASC, idAnoFabricacao DESC, idVeiculo ASC


-- 7) Extraia a menor, maior, média e a soma das vendas de cada mês do ano de 2020, em ordem ascendente. 

SELECT MAX(qtd) AS MAIOR, MIN(qtd) AS MENOR, AVG(qtd) AS MEDIA, SUM(qtd) AS SOMA, idMesdaVenda
FROM VendasAnuais
WHERE idAnodaVenda = 2
GROUP BY idMesdaVenda
ORDER BY idMesdaVenda ASC



-- 8) Retorne a mesma consulta anterior, mas somente os registros que tiverem média de vendas superior a 500.

