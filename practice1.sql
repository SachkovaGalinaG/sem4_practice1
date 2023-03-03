-- Напишите запрос, который выведет все столбцы с данными из таблицы movies
select *
from movies

-- Напишите запрос, который выведет название фильма, его жанр и год выпуска
select name, genre, year
from movies

-- Напишите запрос, который выведет название фильма, но переименуйте столбец на Titles
select name as Titles
from movies

-- Напишите запрос, который выведет уникальные названия жанров
select distinct genre
from movies

-- Напишите запрос, который выведет все столбцы из таблицы movies, при условии что рейтинг фильмов меньше 5
select *
from movies
where imdb_rating<5

--Исправьте предыдущий запрос, чтобы выводились все столбцы из таблицы movies, при условии что год выпуска больше 2014
select *
from movies
where year>2014

--Напишите запрос, который выведет только названия фильмов, при условии, что у них рейтинг заполнен
select name
from movies 
where imdb_rating is not null

--Исправьте предыдущий запрос так, чтобы выводились названия фильмов, у которых рейтинг не заполнен
select name
from movies 
where imdb_rating is null

--Напишите запрос, который выведет все данные из таблицы movies для тех фильмов, которые были выпущены 
--в период между 1990 и 1999 годами включительно.
select *
from movies
where year between 1990 and 1999

--Напишите запрос, который выведет все данные из таблицы movies для тех фильмов, первая буква названия которых
--лежит в промежутке между буквами алфавита A и J. Отсортируйте результат по названию фильма в алфавитном порядке
select *
from movies
where name between 'A' and 'J'
order by name

--Напишите запрос, который выведет все данные из таблицы movies для фильмов c жанром romance, которые были выпущены 
--в период между 1990 и 1999 годами включительно.	
select *
from movies
where genre = 'romance' and year between 1990 and 1999

--Напишите запрос, который выведет все данные из таблицы movies для фильмов c рейтингом больше 8, которые были выпущены 
--в период между 1970 и 1979 годами включительно.
select *
from movies
where imdb_rating>8 and year between 1970 and 1979

--Напишите запрос, который выведет все данные из таблицы movies для фильмов c жанром horror, которые были выпущены 
--ранее 1985 года не включая этот год
select *
from movies
where genre='horror' and year<1985

--Напишите запрос, который выведет все данные из таблицы movies для фильмов либо c жанром action, либо те, 
--которые были выпущены позже 2014 года, не включая этот год. Отсортируйте по жанру в алфавитном порядке
select * 
from movies
where genre='action' or year>2014
order by genre

--Напишите запрос, который выведет все данные из таблицы movies для фильмов либо c жанром romance, 
--либо c жанром comedy. Отсортируйте результат по названию жанра в обратном алфавитному порядку
select *
from movies
where genre='romance' or genre='comedy'
order by genre desc

--Напишите запрос, который выведет все данные из таблицы movies о топ-3 фильмах с наибольшим рейтингом.
--Напишите запрос, который выведет все данные из таблицы movies о топ-3 фильмах с наибольшим рейтингом.
--Не включайте те фильмы, у которых рейтинг отсутствует
select *
from movies
where imdb_rating is not null
order by imdb_rating desc
limit 3

--Найдите количество девочек, которым было дано имя Lillian. Выведите год, когда было дано имя, и количество 
select year, number
from babies
where name = 'Lillian' AND gender = 'F'

--Выведите имя ребенка, пол, и количество раз, когда было дано данное имя в 1880 году.
--Отсортируйте результат по количеству по убыванию и выведите только 10 записей.
select name, gender, number
from babies
where year = 1880
order by number DESC
limit 10

--Выведите все данные о ресторанах с японской (Japanese) кухней с категорией цен = '$$' 
select *
from nomnom
where cuisine = 'Japanese' and price = '$$'

--Выведите данные о ресторанах, по которым нет оценки здоровья
select *
from nomnom
where health is null

--Напишите запрос, который вывод нзвание статьи и её издателя. Отсортируйте результа по названию статьи в порядке возростания
select title, publisher
from news
order by title

--Посчитать количество записей в таблице fake_apps
select count(*)
from fake_apps

--Посчитать количество бесплатных приложений в таблице fake_apps
select count(*)
from fake_apps
where price = 0.00

--Посчитайте сумму всех загрузок приложений в таблице fake_apps
select sum(downloads)
from fake_apps

--Посчитайте максимальное, минимальное и среднее количество загрузок приложений в таблице fake_apps
select max(downloads), min(downloads), avg(downloads)
from fake_apps

--Выведите название приложения, его цену в том виде, какая она есть и цену, округлённую до целого числа
select name, price, round(price,0)
from fake_apps

--Найдите среднюю цену на все приложения и результат округлите до двух знаков	
select round(avg(price),2)
from fake_apps	

--Выведите средний рейтинг кинофильмов в разбивке по годам выпуска из таблицы movies.
--Результат отсортируйте по году выпуска в порядке возростания

select year, avg(imdb_rating)
from movies
group by year
order by year

--Напишите запрос, который позволяет нам посчитать количество приложений с отдельно взятой ценой у нас имеется в таблице fake_apps,
--при условии, что количество загрузок больше 20000
select price, count(*)
from fake_apps
where downloads>20000
group by price

--Напишите запрос, который посчитает сумму загрузок по каждой категории приложений
select category, sum(downloads)
from fake_apps
group by category

--Напишите запрос, который посчитает нам количество названий фильмов в разбивке по рейтинге, 
--при этом рейтинг должен быть округлен до целого числа. Результат отсортируйте по округлённому рейтингу

select round(imdb_rating), count(name)
from movies	
group by 1
order by 1

--Напишите запрос, который найдет среднее количество загрузок приложений в разбивке в категориям,
--при этом каждая категория отображается в разбивке по цене
select category, price, avg(downloads)
from fake_apps
group by category, price
order by category

--Напишите запрос, который посчитает нам количество названий фильмов в разбивке по годам выпуска, 
--при этом каждый год будет отображается в разбивке по жанру. Выведите только те фильмы, количество которых
--больше 10 (не включая 10). Результат отсортируйте по году выпуска в порядке убывания
select year, genre, count(name)
from movies
group by year, genre
having count(name) > 10
order by year desc
