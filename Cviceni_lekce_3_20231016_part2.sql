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

SELECT 
	min(value),
	max(value),+
	category_code,
	CASE
		WHEN max(value)-min(value) <= 10 THEN 'rozdíl do 10 Kč'
		WHEN max(value)-min(value) <= 40 THEN 'rozdíl do 40 Kč'
		ELSE 'rozdíl nad 40 Kč'
			END AS DIFFERENCE
FROM czechia_price 
GROUP BY category_code 
ORDER BY DIFFERENCE;

SELECT *
FROM czechia_price_category ;

SELECT *
FROM czechia_price;

SELECT 
	min(value) as 'historicke minimum',
	max(value) as 'historicke_maximum',
	category_code,
	round(avg(value), 2) as 'aritmeticky_prumer',
	region_code 
FROM czechia_price 
GROUP BY category_code,
		region_code 
order by round(avg(value), 2) desc ;
 

select *
from demographics ;

select *
from countries  ;


select 
	distinct continent,
	sum(population) 
from countries 
group by continent
order by sum(population) desc;

select 
	round(AVG(surface_area)),
	continent 
from countries 
group by continent
order by round(AVG(surface_area)) desc ;

select continent , round( avg(surface_area) )
from countries c 
group by continent 
order by avg(surface_area) desc;




select 
	religion ,
	count(*)
from countries
group BY religion  desc
order by count(*) ;

/* Úkol 2.1:
 * Zjistěte celkovou populaci, průměrnou populaci a počet států pro každý kontinent
 */
select 
	continent ,
	round( sum(population)),
	round( avg(population)),
	count(country) 
from countries 
where continent is not null 
group by continent 
order by round(sum(population)) desc ;


select continent , sum(population), round( avg(population) ), count(*)
from countries
where continent is not null
group by continent
order by sum(population) desc ;

/*Úkol 2.2:
 * Zjistěte celkovou rozlohu kontinentu a průměrnou rozlohu států ležících na daném kontinentu
*/

select *
from countries  ;

SELECT 
	continent,
	round(sum(surface_area)) AS 'celkova rozloha',
	round(avg(surface_area)) AS 'průměrná rozloha'
FROM countries 
GROUP BY continent
ORDER BY round( sum(surface_area)) DESC  ;
	
	
select continent ,
    sum(surface_area), round( avg(surface_area) )
from countries c 
group by continent
order by sum(surface_area) desc
;


/*
 * Úkol 2.3 Zjistěte celkovou populaci a počet států rozdělených podle hlavního náboženství
 *  */
select *
from countries  ;

SELECT 
	continent ,
	round( sum(population)) AS 'celková populace',
	count(country) ,
	religion 
FROM countries 
GROUP BY 	religion  
ORDER BY round( sum(population)) DESC ;


select religion, sum(population), count(*)
from countries c 
group by religion 
order by sum(population) desc
;

/*
 * Úkol 3: Pro každý kontinent zjistěte podíl počtu vnitrozemských států (sloupec landlocked),
 *  podíl populace žijící ve vnitrozemských státech a podíl rozlohy vnitrozemských států.
 */
SELECT 
	round(sum(landlocked)/count(*)) AS 'celkový podíl počtu vnitrozemských států'  ,
	round(sum(population)*sum(landlocked)) / 
FROM countries;


/*
 * Úkol 4: Zjistěte celkovou populaci ve státech rozdělených podle kontinentů a regionů (sloupec region_in_world).
 *  Seřaďte je podle kontinentů abecedně a podle populace sestupně.
 */










