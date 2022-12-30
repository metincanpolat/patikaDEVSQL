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


-- oDEV5 --

/*
1- film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
2- film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sıralayınız.
3- customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.
*/
-- 1 --
select title from film where title like '%n' order by length desc limit 5; 

-- 2 --
select title from film where title like '%n' order by length offset 5 limit 5; 

-- 3 --
select * from customer where store_id=1 order by last_name desc limit 4; 

-- ODEV6 --
/*
film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
*/

-- 1 --
SELECT round(avg(rental_rate),2) from film;

-- 2 --
select count(*) as basHarfC from film where title like 'C%';

-- 3 --
select max(length) from film where rental_rate=0.99 ;

-- 4 --
select count(distinct replacement_cost) from film where length>150;

-- ODEV 7 --
/*
1 - film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
2 - film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan
replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
3 - customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir? 
4 - city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra
en fazla şehir sayısı barındıran country_id bilgisini ve şehir sayısını paylaşınız.
*/
-- 1 --
select rating, title from film group by rating,title order by rating;

-- 2 --
select replacement_cost,count(*) as toplam from film group by replacement_cost having count(*) >50 order by count(*) ;

-- 3 --
select store_id,count(*) from customer group by store_id;

-- 4 --
select country_id, count(*) from city group by country_id order by count(*) desc limit 1;
