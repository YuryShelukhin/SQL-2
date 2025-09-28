SELECT 
    CONCAT(s.last_name, ' ', s.first_name) AS "Фамилия и Имя сотрудника",
    c.city AS "Город",
    COUNT(cu.customer_id) AS "Количество пользователей"
FROM store st
INNER JOIN staff s ON st.manager_staff_id = s.staff_id
INNER JOIN address a ON a.address_id = st.address_id
INNER JOIN city c ON c.city_id = a.city_id
INNER JOIN customer cu ON cu.store_id = st.store_id
GROUP BY 
    s.staff_id, 
    s.last_name, 
    s.first_name, 
    c.city,
    st.store_id
HAVING COUNT(cu.customer_id) > 300;


SELECT COUNT(*) AS "Количество фильмов"
FROM film
WHERE length > (SELECT AVG(length) FROM film);


SELECT 
    DATE_FORMAT(payment_date, '%m-%Y') AS payment_month,
    SUM(amount) AS total_payment_amount,
    COUNT(rental_id) AS rental_count
FROM 
    payment
GROUP BY 
    payment_month
ORDER BY 
    total_payment_amount DESC
LIMIT 1;

SELECT 
    s.staff_id AS "ID продавца",
    CONCAT(first_name, ' ', last_name) AS "Имя продавца",
    COUNT(payment_id) AS "Количество продаж",
    CASE 
        WHEN COUNT(payment_id) > 8000 THEN 'Да'
        ELSE 'Нет'
    END AS "Премия"
FROM 
    staff s
LEFT JOIN 
    payment p ON s.staff_id = p.staff_id
GROUP BY 
    s.staff_id, s.first_name, s.last_name
ORDER BY 
    "Количество продаж" DESC;

SELECT 
    f.film_id,
    f.title AS "Название",
    f.description AS "Описание"
FROM 
    film f
LEFT JOIN 
    inventory i ON f.film_id = i.film_id
LEFT JOIN 
    rental r ON i.inventory_id = r.inventory_id
WHERE 
    r.rental_id IS NULL;




















