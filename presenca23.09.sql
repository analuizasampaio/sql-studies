/*---------------------------------------------------------------------------
|	V. 1.1	-	AUTOR: ANA LUIZA SAMPAIO				- DATA: 24/SET/2021 |
|   OBJETIVO: EXERCICIO TSQL2012											|
---------------------------------------------------------------------------*/

/*|1|*/

SELECT 
	productid	AS [N�mero do Produto]
,	productname AS Nome
,	unitprice	AS 'Pre�o'
FROM 
	Production.Products 
WHERE 
	unitprice >= 19 AND unitprice <= 22

SELECT 
	productid 'N�mero do Produto'
,	productname	AS Nome
,	unitprice	AS Pre�o
FROM 
	Production.Products 
WHERE 
	unitprice BETWEEN 19 AND 22


/*|2|*/

SELECT 
	productid 'N�mero do Produto'
,	productname	 AS Nome
,	unitprice	 AS Pre�o
FROM
	Production.Products 
WHERE 
	unitprice = 18
OR	unitprice = 10
OR	unitprice = 21.35


SELECT 
	productid 'N�mero do Produto'
,	productname AS Nome
,	unitprice	AS Pre�o
FROM 
	Production.Products 
WHERE 
	unitprice in (18, 10, 21.35)


/*|3|*/

SELECT 
	empid 'N�mero do Empregado'
,	titleofcourtesy				AS 'T�tulo'
,	firstname + ' ' + lAStname	AS 'Nome Completo'
,	birthdate					AS 'Data NAScimento'
FROM 
	HR.Employees
WHERE 
	birthdate BETWEEN '19470101' AND '19651231'


/*|4|*/

SELECT 
	city AS 'Cidade'
,	region Regi�o
,	country AS Pa�s
FROM 
	HR.Employees
WHERE 
	city = 'Seattle'
OR	country = 'UK'

/*|5|*/

SELECT 
	empid 'N�mero do Empregado'
,	firstname Nome
,	hiredate AS 'Data de Contrata��o'
FROM 
	HR.Employees
WHERE 
	hiredate < '20030101' OR hiredate >= '20040101'


SELECT 
	empid 'N�mero do Empregado'
,	firstname Nome
,	hiredate AS 'Data de Contrata��o'
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
	custid AS 'N�mero do Cliente'
,	contactname 'Nome do Contato'
,	city 'Cidade'
,	country AS Pa�s
FROM 
	Sales.Customers
WHERE
	country in ('Argentina', 'Brazil', 'Venezuela')
Order by Pa�s


/*|8|*/

SELECT  * FROM  Sales.Customers

SELECT 
	custid AS 'N�mero do Cliente'
,	contactname 'Nome do Contato'
,	fax
FROM 
	Sales.Customers
WHERE 
	fax is null
Order by custid desc


/*|9|*/

SELECT 
	custid AS 'N�mero do Cliente'
,	city 'Cidade'
,	country 'Pa�s'
,	region
FROM 
	Sales.Customers
WHERE
	region is null
ORder by 
	country ASc
,	Cidade desc