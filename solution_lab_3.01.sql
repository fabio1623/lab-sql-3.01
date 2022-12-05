use sakila;

-- Activity 1

-- 1. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff(first_name, last_name, address_id, email, store_id, active, username)
values ('TAMMY', 'SANDERS', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'TAMMY');

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Use similar method to get inventory_id, film_id, and staff_id.
insert into rental(rental_date, inventory_id, customer_id, return_date, staff_id)
values(CURRENT_TIMESTAMP(), 1, 130, CURRENT_TIMESTAMP(), 1);

-- Verification
SELECT 
    *
FROM
    film
        JOIN
    inventory USING (film_id)
    join rental using(inventory_id)
WHERE
    title = 'ACADEMY DINOSAUR' and year(rental_date) = year(curdate());