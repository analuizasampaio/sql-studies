/*----------------------------------------------------------------------------
|	V. 1.1	-	AUTORA: ANA LUIZA SAMPAIO - RA: 2101183	- DATA: 13/AGO/2021  |
|   OBJETIVO: TABELAS DE MULTAS DO DETRAN        			         		 |
-----------------------------------------------------------------------------*/

CREATE DATABASE DB_DETRAN
GO

USE DB_DETRAN
GO

CREATE TABLE TB_MULTAS
(
		COD_MULTA	CHAR(20)
	,	DESCRICAO	CHAR(60)
	,	VALOR		FLOAT
)

SELECT * FROM TB_MULTAS

CREATE TABLE TB_VEICULOS
(
		MODELO		CHAR(20)
	,	MARCA		CHAR(60)
	,	RENAVAN		CHAR(20)
)

INSERT TB_MULTAS
( COD_MULTA, DESCRICAO, VALOR)
VALUES
( '101', 'TESTE', 101.0)

SELECT * FROM TB_MULTAS