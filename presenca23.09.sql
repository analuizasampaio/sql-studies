/*---------------------------------------------------------------------------
|	V. 1.1	-	AUTOR: ANA LUIZA SAMPAIO				- DATA: 24/SET/2021 |
|   OBJETIVO: EXERCICIO TSQL2012											|
---------------------------------------------------------------------------*/

/*|1|*/

SELECT 
	productid	AS [Número do Produto]
,	productname AS Nome
,	unitprice	AS 'Preço'
FROM 
	Production.Products 
WHERE 
	unitprice >= 19 AND unitprice <= 22

SELECT 
	productid 'Número do Produto'
,	productname	AS Nome
,	unitprice	AS Preço
FROM 
	Production.Products 
WHERE 
	unitprice BETWEEN 19 AND 22


/*|2|*/

SELECT 
	productid 'Número do Produto'
,	productname	 AS Nome
,	unitprice	 AS Preço
FROM
	Production.Products 
WHERE 
	unitprice = 18
OR	unitprice = 10
OR	unitprice = 21.35


SELECT 
	productid 'Número do Produto'
,	productname AS Nome
,	unitprice	AS Preço
FROM 
	Production.Products 
WHERE 
	unitprice in (18, 10, 21.35)


/*|3|*/

SELECT 
	empid 'Número do Empregado'
,	titleofcourtesy				AS 'Título'
,	firstname + ' ' + lAStname	AS 'Nome Completo'
,	birthdate					AS 'Data NAScimento'
FROM 
	HR.Employees
WHERE 
	birthdate BETWEEN '19470101' AND '19651231'


/*|4|*/

SELECT 
	city AS 'Cidade'
,	region Região
,	country AS País
FROM 
	HR.Employees
WHERE 
	city = 'Seattle'
OR	country = 'UK'

/*|5|*/

SELECT 
	empid 'Número do Empregado'
,	firstname Nome
,	hiredate AS 'Data de Contratação'
FROM 
	HR.Employees
WHERE 
	hiredate < '20030101' OR hiredate >= '20040101'


SELECT 
	empid 'Número do Empregado'
,	firstname Nome
,	hiredate AS 'Data de Contratação'
FROM 
	HR.Employees
WHERE 
	hiredate BETWEEN '20020101' AND '20021231 23:59:59.997'
OR	hiredate BETWEEN '20040101' AND '20041231 23:59:59.997'


/*|6|*/

SELECT top 20 *
FROM 
	Sales.Customers
ORDER BY custid desc


/*|7|*/

SELECT distinct country FROM  Sales.Customers 

SELECT 
	custid AS 'Número do Cliente'
,	contactname 'Nome do Contato'
,	city 'Cidade'
,	country AS País
FROM 
	Sales.Customers
WHERE
	country in ('Argentina', 'Brazil', 'Venezuela')
Order by País


/*|8|*/

SELECT  * FROM  Sales.Customers

SELECT 
	custid AS 'Número do Cliente'
,	contactname 'Nome do Contato'
,	fax
FROM 
	Sales.Customers
WHERE 
	fax is null
Order by custid desc


/*|9|*/

SELECT 
	custid AS 'Número do Cliente'
,	city 'Cidade'
,	country 'País'
,	region
FROM 
	Sales.Customers
WHERE
	region is null
ORder by 
	country ASc
,	Cidade desc