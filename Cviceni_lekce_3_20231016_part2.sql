SELECT COUNT (1)
FROM czechia_price;

SELECT *
FROM czechia_price ;

SELECT *
FROM czechia_payroll  ;

SELECT count(id) AS pocet
FROM czechia_payroll ;

SELECT *
FROM czechia_payroll_industry_branch  ;

SELECT *
FROM czechia_payroll_calculation  ;

SELECT *
FROM czechia_payroll_value_type ;

SELECT count(value_type_code) AS prumerne_pocty_zamestnanců
FROM czechia_payroll 
WHERE value_type_code = '316' AND value IS NOT NULL;

SELECT *
FROM czechia_price ;

SELECT *
FROM czechia_price_category ;

SELECT
category_code ,
YEAR (date_from) AS year_of_entry,
count(id) AS rows_in_category
FROM czechia_price 
GROUP BY category_code,
		date_from ;
	
SELECT *
FROM czechia_payroll ;


SELECT  *
FROM czechia_payroll_value_type  ;

SELECT  *
FROM czechia_payroll_calculation  ;

SELECT *
FROM czechia_payroll_unit  ;

SELECT sum(value) AS celkova_suma_zamestnancu
FROM czechia_payroll 
WHERE value_type_code = '316' AND 
		value IS NOT NULL;


SELECT *
FROM czechia_region ;

SELECT *
FROM czechia_price ;

SELECT 
	sum(value) AS součet_průměrných_cen,
	id ,
	category_code
FROM czechia_price 
WHERE region_code = 'CZ064'
GROUP BY (category_code);


SELECT 
	category_code,
	sum(value) AS součet_průměrných_cen_potravin,
	id 
FROM czechia_price 
WHERE date_from =  CAST('2018-01-15' AS DATE);

SELECT 
	count(*) AS celkovy_pocet_radků,
	category_code,
	SUM (value)
FROM czechia_price 
WHERE YEAR (date_from) = '2018'
GROUP BY category_code ;


SELECT 
	max(value),
	value_type_code
FROM czechia_payroll 
WHERE value_type_code = '5958';


SELECT category_code,
		min(value)
FROM czechia_price 
WHERE YEAR(date_from) BETWEEN '2015' AND '2017'
GROUP BY category_code ;

SELECT *
FROM czechia_payroll_industry_branch ;

SELECT 
	code,
	name
FROM czechia_payroll_industry_branch ;

SELECT 
	industry_branch_code,
	max(value) AS 'nejvyssi_mzda',
	(SELECT name FROM czechia_payroll_industry_branch WHERE code = czechia_payroll.industry_branch_code) AS 'Nazev oddeleni'
FROM czechia_payroll 
WHERE value_type_code = '5958'
	AND industry_branch_code IS NOT NULL
GROUP BY industry_branch_code
ORDER BY MAX(value) DESC;

SELECT 
	industry_branch_code,
	max(value) AS 'nejvyssi_mzda',
	(SELECT name FROM czechia_payroll_industry_branch WHERE code = czechia_payroll.industry_branch_code) AS 'Nazev oddeleni'
FROM czechia_payroll 
WHERE value_type_code = '5958'
	AND industry_branch_code IS NOT NULL
GROUP BY industry_branch_code
ORDER BY MAX(value) DESC
LIMIT 1;

SELECT
    *
FROM czechia_payroll_industry_branch
WHERE code IN (
    SELECT
        industry_branch_code
    FROM czechia_payroll
    WHERE value IN (
        SELECT
            MAX(value)
        FROM czechia_payroll
        WHERE value_type_code = 5958
    )
);


SELECT *
FROM czechia_payroll ;

SELECT *
FROM healthcare_provider ;




SELECT *
FROM czechia_region ;
