/*------------------------------------------------------------------------
|	V. 1.1	-	AUTORA: ANA LUIZA SAMPAIO			- DATA: 03/OUT/2021  |
|				RA: 2101183												 |
|   OBJETIVO: ATIVIDADE CONTINUA 2										 |
|																		 |
------------------------------------------------------------------------*/

-- ENTREGAR O CÓDIGO SQL CORRESPONDENTE ÀS QUESTÕES ABAIXO
-- BANCO DE DADOS: PEDIDOS

USE PEDIDOS

-- TESTE TABELAS
SELECT * FROM TB_PEDIDO
SELECT * FROM TB_EMPREGADO
SELECT * FROM TB_PRODUTO
SELECT * FROM TB_CLIENTE
SELECT * FROM TB_ITENSPEDIDO


-- 01. RETORNE NOME, SALÁRIO, PREMIO MENSAL, CONDIÇÃO SINDICAL E CÓDIGO DO CARGO
--     PARA TODOS OS COLABORADORES QUE SEJAM SINDICALIZADOS E ESTEJAM NOS CARGOS ÍMPARES
--    TABELA: TB_EMPREGADO

SELECT	
		NOME
,		SALARIO
,		PREMIO_MENSAL
,		SINDICALIZADO
,		COD_CARGO
FROM	TB_EMPREGADO
WHERE	SINDICALIZADO = 'S'	AND
		COD_CARGO % 2 = 1

-- 02. SELECIONE OS 10 PRODUTOS MAIS CAROS DA TABELA PRODUTOS (CONSIDERAR PRECO_VENDA)
--     TABELA: TB_PRODUTO

SELECT		TOP 10 * 
FROM		TB_PRODUTO
ORDER BY	PRECO_VENDA DESC




-- 03. SELECIONA TODOS OS PEDIDOS (TABELA: TB_ITENSPEDIDO) QUE  FORAM FEITOS NOS
--     MESES DE JANEIRO, FEVEREIRO OU MARÇO, DE QUALQUER ANO.

SELECT	* 
FROM	TB_ITENSPEDIDO
WHERE	MONTH(DATA_ENTREGA) IN 
		(1,2, 3)



-- 04. SELECIONE TODOS OS PEDIDOS (TABELA DE PEDIDOS) QUE POSSUAM A PALAVRA 'CANETA'
--     EM QUALQUER PARTE DO CAMPO OBSERVACOES
--     RETORNAR NA LISTA APENAS CASO O CÓDIGO DO VENDEDOR SEJA MENOR DO QUE 10


SELECT	* 
FROM	TB_PEDIDO
WHERE	OBSERVACOES	LIKE '%CANETA%' AND
		CODVEN	< 10

-- 05. SELECIONAR OS CLIENTES (TABELA TB_CLIENTE) QUE MOREM EM CIDADES ONDE A TERCEIRA LETRA
--     SEJA UMA VOGAL.

SELECT	*
FROM	TB_CLIENTE
WHERE	CIDADE LIKE '__[AEIOU]%'

-- 06. AINDA NESTA TABELA, OBTER A LISTA DE CLIENTES QUE ESTEJAM NOS ESTADOS DO SUL E SUDESTE
--     CAMPOS A SELECIONAR: NOME, FANTASIA, CIDADE, ESTADO, E A DIFERENÇA ENTRE O 
--     ANO DA DATA DE CADASTRO E O ANO DA DATA ATUAL

SELECT		
		NOME
,		FANTASIA
,		CIDADE
,		ESTADO
,		YEAR(GETDATE())-YEAR(DATA_CAD)	AS	DIF_ANOS
FROM		TB_CLIENTE
WHERE		ESTADO	IN	
			('SP', 'MG', 'RJ', 'ES','SC', 'RS', 'PR')


-- 07. SELECIONAR OS FUNCIONÁRIOS QUE POSSUAM SALÁRIO ACIMA DE 3500.
--     RETORNAR TODOS OS CAMPOS DA TABELA E TAMBÉM UM CAMPO ADICIONAL COM A CONSTANTE
--     'FACULDADE IMPACTA'. ESTE NOVO CAMPO DEVERÁ SE CHAMAR 'ORIGEM'.

SELECT	* 
,		ORIGEM = 'FACULDADE IMPACTA' 
FROM	TB_EMPREGADO

-- 08. TRAZER O NOME DOS FUNCIONÁRIOS, SEU SALÁRIO, PREMIO MENSAL E DATA DE NASCIMENTO.

--     CRIAR TAMBÉM UM CAMPO COM O SALÁRIO DE TODOS OS FUNCIONÁRIOS ACRESCIDOS DE 15%\

--     ALÉM DISSO, CRIAR UM SEGUNDO CAMPO SOMANDO A METADE DO PREMIO MENSAL COM METADE
--     DO NOVO VALOR DO SALÁRIO (SALÁRIO JÁ ACRESCIDO DE 15%).

--     ESTA OPERAÇÃO SERÁ REALIZADA APENAS PARA PROFISSIONAIS NASCIDOS EM ANOS PARES
--     E MESES ÍMPARES.

SELECT	
		NOME
,		SALARIO				AS		SALARIO_ANTIGO
,		PREMIO_MENSAL
,		DATA_NASCIMENTO
,		((SALARIO * 0.15) + SALARIO) 	AS		SALARIO_NOVO
,		(PREMIO_MENSAL + ((SALARIO * 0.15) + SALARIO))/2		AS		METADE_SALARIO_PREMIO
FROM	TB_EMPREGADO
WHERE	YEAR(DATA_NASCIMENTO)	% 2 = 0		AND
		MONTH(DATA_NASCIMENTO)	% 2 = 1
