use sakila;

# punto 4
select count(actor_id) from actor;
select first_name, last_name from actor;

# punto 5
select
	f.title as Titulo,
    a.first_name as Nombre,
    a.last_name as Apellido
from 
	film f inner join film_actor f_a on f.film_id = f_a.film_id
    inner join actor a on f_a.actor_id = a.actor_id
where 
	f.title = "ACADEMY DINOSAUR" or
    f.title = "BERETS AGENT"
;

# punto 6
select
	f.title as Titulo,
    c.name as Categoria
from 
	actor a inner join film_actor f_a on a.actor_id = f_a.actor_id
    inner join film f on f_a.film_id = f.film_id
    inner join film_category f_c on f.film_id = f_c.film_id
    inner join category c on f_c.category_id = c.category_id
where 
	a.first_name = "KARL" and
    a.last_name = "BERRY"
;

# punto 7
select
	sum(f.replacement_cost) as "Costo total",
    count(f.replacement_cost) as Cantidad,
	sum(f.replacement_cost)/count(f.replacement_cost) as "Suma Promedio"
from 
	film f inner join film_category f_c on f.film_id = f_c.film_id
    inner join category c on f_c.category_id = c.category_id
where
	c.name="Drama"
;

# punto 8
select
	i.store_id as Tienda,
	sum(p.amount) as "Precio Total",
	c.name as Genero
from 
	category c inner join film_category f_c on c.category_id = f_c.category_id
    inner join film f on f.film_id = f_c.film_id
    inner join inventory i on i.film_id = f.film_id
    inner join rental r on r.inventory_id = i.inventory_id
    inner join payment p on p.rental_id = r.rental_id
group by
	c.name order by i.store_id
;

# punto 9
select 
	con.country as Pais,
	count(con.country_id) as "Cantidad de Paises"
from
	country con inner join city ci on con.country_id = ci.country_id
	inner join address ad on ci.city_id= ad.city_id
	inner join customer ct on ad.address_id=ct.address_id
group by 
	con.country_id
;

# punto 10
drop temporary table if exists Peliculas_Alquiladas_P;
create temporary table Peliculas_Alquiladas_P (   
	select 
		concat(first_name, ' ', last_name) As "Nombre Cliente" , f.title as "Pelicula"
	from
		customer ct inner join rental r on ct.customer_id = r.customer_id
		inner join inventory i on r.inventory_id = i.inventory_id
		inner join film f on i.film_id = f.film_id
		order by first_name
);
select * from Peliculas_Alquiladas_P;

# punto 11
select
	concat(first_name, ' ', last_name) As "Nombre Cliente",
	datediff (r.return_date , r.rental_date) as resultado,
	f.title as Titulo
from
	customer c inner join rental r on c.customer_id = r.customer_id
    inner join inventory i on r.inventory_id = i.inventory_id
    inner join film f on i.film_id = f.film_id
order by 
	first_name
;
    