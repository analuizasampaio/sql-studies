/*----------------------------------------------------------------------------
|	V. 1.1	-	AUTORA: ANA LUIZA SAMPAIO - RA: 2101183	- DATA: 22/AGO/2021  |
|   OBJETIVO: TABELAS DE MULTAS DO DETRAN        			         		 |
-----------------------------------------------------------------------------*/

-- Exercícios: 
--a. Criar Banco de Dados de Empresa
CREATE DATABASE DB_EMPRESA
--b. Colocar Banco de Dados em Uso
USE DB_EMPRESA
--c. Criar Tabelas de:
--1. Funcionário (CPF, Nome, Salário, Data de Nascimento)

CREATE TABLE TB_FUNCIONARIO
(
	CPF				BIGINT			,
	NOME			VARCHAR(40)		,
	SALARIO			DECIMAL(9,2)	,
	DT_NASC			DATE			
)

SELECT * FROM TB_FUNCIONARIO
--2. Dependentes (CPF, CPF do Responsável, Nome, Data de Nascimento)

CREATE TABLE TB_DEPENDENTE
(
	CPF				BIGINT			,
	CPF_RESP		BIGINT			,
	NOME			VARCHAR(40)		,
	DT_NASC			DATE
)
--d. Inserir Registros em ambas
INSERT TB_FUNCIONARIO
( CPF , NOME , SALARIO , DT_NASC )
VALUES
(12345678,'FULANO DA SILVA', 1000.89 , '1996-10-18'),
(09875321,'MARIA PEREIRA', 2100.89 , '1980-06-08')

INSERT TB_DEPENDENTE
( CPF_RESP				, CPF				, NOME					, DT_NASC )
VALUES
(1234754321, 9813256348, 'JOAO', '2018-04-13'),
(1234754321, 981212128, 'RPBERTA', '2002-01-13')

SELECT * FROM TB_FUNCIONARIO
SELECT * FROM TB_DEPENDENTE
-- Obs.: Utilize a maior variedade de Tipos de Dados possível.

--a. Criar Banco de Dados de Notas Fiscais
CREATE DATABASE DB_NF
--b. Colocar Banco de Dados em Uso
USE DB_NF
--c. Criar Tabelas de:
--1. Pedidos (ID do Pedido, ID do Item, Valor Total, Descrição, Data do Pedido)
CREATE TABLE TB_PEDIDO
(
	ID				BIGINT				,
	ID_ITEM			BIGINT				,
	VALOR_TOTAL		DECIMAL(9,2)	,
	DESCRICAO		VARCHAR(100)	,
	DATA			DATE			
)
--2. Itens do Pedido (ID do Item, Descrição, Valor Unitário, Quantidade)

CREATE TABLE TB_ITEM
(
	ID			BIGINT				,
	DESCRICAO	VARCHAR(100)	,
	VALOR		DECIMAL(9,2)	,
	QUANTIDADE	INT
)
--d. Inserir Registros em ambas
INSERT TB_ITEM
(ID, DESCRICAO, VALOR, QUANTIDADE)
VALUES
(121, 'MARCATEXTO PILOT', 3, 300),
(1212, 'IPHONE SE', 300, 100),
(12123, 'BORRACHA', 0.40, 500)

INSERT TB_PEDIDO
(ID, ID_ITEM, VALOR_TOTAL, DESCRICAO, DATA)
VALUES
(1, 121, 9.00, '3 MARCATEXTO', '2021-08-22'),
(2, 1212, 300.00, 'IHPONE SUPER BARATO', '2021-08-21')

SELECT * FROM TB_ITEM
SELECT * FROM TB_PEDIDO
