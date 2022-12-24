--ODEV1--
/*
1-film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
2-film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
3-film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
4-customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
5-film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.
*/


--1-
SELECT title,description FROM film;
--2-
SELECT * FROM film WHERE 60 < length AND length < 75;
--3-
SELECT * FROM film WHERE rental_rate = 0.99 AND (replacement_cost = 12.99 OR replacement_cost = 28.99);
--4-
SELECT last_name FROM customer WHERE first_name = 'Mary';
--5-
SELECT * FROM film WHERE length < 50 AND rental_rate <> 2.99 AND rental_rate <> 4.99;


-- Odev2--
/*
 1- film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve
 	16.99 küçük olma koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
 2- .actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 
 	'Nick' veya 'Ed' değerleri olması koşuluyla sıralayınız. ( IN operatörünü kullanınız.)
 3- film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 
 	12.99, 15.99, 28.99 olma koşullarıyla sıralayınız. ( IN operatörünü kullanınız.)
*/

-- 1 --

 select * from film where replacement_cost between 12.99 and 16.99;

-- 2 --

 select first_name, last_name from actor where first_name in ('Penelope','Nick','Ed');
 
 -- 3 --
 
 select * from film where (rental_rate in (0.99,2.99,4.99)) and (replacement_cost in (12.99, 15.99, 28.99));
 
   -- Odev3 --
  /*
 1- country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
2- country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
3- film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
4- film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.
*/
 
 -- 1 --
 select country from country where country like 'A%a';
 
 -- 2 --
 select country from country where country ~~ '_____a';
 -- 3 --
 select title from film where title ILIKE '%t%t%t%t%';
 -- 4 --
 select * from film where title like 'C%' and length>90 and rental_rate=2.99;
 
  -- Odev 4--
 /*
1-  film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
2- film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
3- film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
4- country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
5- city tablosundaki şehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?
*/

-- 1 --
select distinct replacement_cost from film;

-- 2 --
select count(distinct replacement_cost) from film;

-- 3 --
select count(title) from film where title like 'T%' and rating = 'G';

-- 4 --
select Count(*) from country where country like '_____';

-- 5 -- 
select count(*) from city where city ilike '%r';
