/*------------------------------------------------------------------------
|	V. 1.1	-	AUTORA: ANA LUIZA SAMPAIO			- DATA: 02/SET/2021  |
|				RA: 2101183												 |
|   OBJETIVO: ATIVIDADE CONTINUA 1										 |
|																		 |
------------------------------------------------------------------------*/

/*

Criar a seguinte estrutura em C?digo SQL, considerando as premissas:
1. Livre utiliza??o dos Tipos de Dados;
2. Respeite os tamanhos e formatos adequados para cada Campo;
3. Os relacionamentos devem possuir mesmo Tipo de Dado;
4. Crie as Primary e Foreign Key conforme o Modelo;
5. Campo CODFUN da Tabela de Empregados ? de Auto Numera??o;
6. Campo COD_DEPTO da Tabela de Departamentos ? de Auto Numera??o;
7. Campo COD_CARGO da Tabela de Cargos ? de Auto Numera??o;
8. Campos NOME (Tabelas Empregados e Dependentes), vari?veis, contendo 50 bytes;
9. Campos SALARIO, SALARIO_INIC e PREMIO_MENSAL s?o Monet?rios;
10. Apenas os campos OBS, FOTO E COD_SUPERVISOR aceitam NULOS;
Obs.: Teste as estruturas, inserindo 5 registros para cada tabela;
Obs.: O nome do Banco dever? ser RH

*/

DROP DATABASE DB_RH

CREATE DATABASE DB_RH

USE DB_RH

CREATE TABLE TB_DEPARTAMENTO
(
	COD_DEPTO	SMALLINT		IDENTITY 
,	DEPTO		VARCHAR(50)		NOT NULL

	CONSTRAINT PK_DEPARTAMENTO	PRIMARY KEY (COD_DEPTO)
)

INSERT TB_DEPARTAMENTO	(DEPTO) VALUES ('EGENHARIA'), ('MARKETING'), ('NEGOCIO')
, ('DESIGN'), ('JURIDICO')

SELECT * FROM TB_DEPARTAMENTO

UPDATE TB_DEPARTAMENTO
SET DEPTO = 'ENGENHARIA'
WHERE DEPTO = 'EGENHARIA'

DROP TABLE TB_CARGO

CREATE TABLE TB_CARGO
(
	COD_CARGO		SMALLINT		IDENTITY
,	CARGO			VARCHAR(50)		NOT NULL	
,	SALARIO_INIC	MONEY			NOT NULL

	CONSTRAINT		PK_CARGO	PRIMARY KEY (COD_CARGO)		
)

INSERT	TB_CARGO
		(CARGO,		SALARIO_INIC)
VALUES	('DEV JUNIOR',	3000),
		('DEV PLENO',	5000),
		('DEV SENIOR',	7000),
		('UX',			5000),
		('PO',			10000)

SELECT * FROM TB_CARGO

CREATE TABLE TB_EMPREGADO
(
	COD_FUNC			SMALLINT		IDENTITY
,	NOME				VARCHAR(50)		NOT NULL
,	DT_NASCIMENTO		DATE			NOT NULL
,	DEPARTAMENTO		SMALLINT		NOT NULL
,	CARGO				SMALLINT		NOT NULL
,	DT_ADMISSAO			DATE			NOT NULL
,	SALARIO				MONEY			NOT NULL
,	PREMIO_MENSAL		MONEY			NOT NULL
,	SINDICALIZADO		BIT				NOT NULL
,	OBS					VARCHAR(40)		NULL
,	FOTO				IMAGE			NULL
,	COD_SUPERVISOR		SMALLINT		NULL

	CONSTRAINT		PK_EMPREGADO				PRIMARY KEY (COD_FUNC)
,	CONSTRAINT		FK_EMPREGADO_DEPARTAMENTO	FOREIGN KEY (DEPARTAMENTO)	REFERENCES	TB_DEPARTAMENTO(COD_DEPTO)
,	CONSTRAINT		FK_EMPREGADO_CARGO			FOREIGN KEY (CARGO)			REFERENCES	TB_CARGO(COD_CARGO)

)

INSERT	TB_EMPREGADO
		(	NOME,			DT_NASCIMENTO,	DEPARTAMENTO,	CARGO,	DT_ADMISSAO,	SALARIO, PREMIO_MENSAL, SINDICALIZADO)
VALUES
		('ANA LUIZA SAMPAIO','1996-10-18',		1,				2,		'2019-03-06',	4000,	2000,	1)
,		('PEDRO BARCELLOS',	'1997-02-24',		1,				1,		'2021-09-02',	3000,	1500,	0)
,		('MARIA REIS',		'1998-10-29',		2,				4,		'2015-09-02',	10000,	500,	1)
,		('GISELE FERNANDES','1985-01-08',		3,				4,		'2015-09-02',	10000,	500,	0)
,		('RAFAEL HOSEOK',	'1994-01-08',		4,				3,		'2013-06-13',	10000,	500,	1)

SELECT * FROM TB_EMPREGADO

/*TESTE PRA VER SE AS FK ESTAO FUNCIONANDO MESMO, COLOCANDO DEPARTAMENTO INEXISTENTE*/

INSERT TB_EMPREGADO
		(	NOME,			DT_NASCIMENTO,	DEPARTAMENTO,	CARGO,	DT_ADMISSAO,	SALARIO, PREMIO_MENSAL, SINDICALIZADO)
VALUES
		('ANA LUIZA SAMPAIO','1996-10-18',		10,				2,		'2019-03-06',	4000,	2000,	1)

/*------TESTE OK-----------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE TB_DEPENDENTE
(
	COD_FUNC		SMALLINT		NOT NULL
,	COD_DEPEND		SMALLINT		IDENTITY
,	NOME			VARCHAR(50)		NOT NULL
,	DT_NASCIMENTO	DATE			NOT NULL

	CONSTRAINT		PK_DEPENDENTE				PRIMARY KEY (COD_DEPEND)
,	CONSTRAINT		FK_DEPENTENDE_FUNCIONARIO	FOREIGN KEY (COD_FUNC)	REFERENCES	TB_EMPREGADO(COD_FUNC)
)

SELECT * FROM TB_DEPENDENTE

INSERT	TB_DEPENDENTE
		(COD_FUNC, NOME, DT_NASCIMENTO)
VALUES
		(1,	'AMORA','2007-03-10')
,		(1, 'JIMIN', '2021-05-26')
,		(3, 'LETICIA', '2001-03-11')
,		(2, 'ISABEL', '1980-02-13')

SELECT * FROM TB_DEPARTAMENTO
SELECT * FROM TB_CARGO
SELECT * FROM TB_EMPREGADO
SELECT * FROM TB_DEPENDENTE