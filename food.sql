DROP DATABASE IF EXISTS foodexpress_db;
CREATE DATABASE foodexpress_db;
USE foodexpress_db;


CREATE TABLE customers (
    customer_id   INT,
    customer_name VARCHAR(30),
    city          VARCHAR(30)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(1,  'Aditya Nair',   'Kochi'),
(2,  'Bhavya Menon',  'Thrissur'),
(3,  'Charan Raj',    'Kozhikode'),
(4,  'Devika Pillai', 'Kochi'),
(5,  'Ebin Thomas',   'Trivandrum'),
(6,  'Farha Nazir',   'Kozhikode'),
(7,  'Gokul Das',     'Kochi'),
(8,  'Hima Joseph',   'Thrissur'),
(9,  'Ishan Verma',   'Trivandrum'),
(10, 'Jancy Mathew',  'Kochi'),
(11, 'Kiran Babu',    'Kozhikode'),
(12, 'Leena Sasi',    'Trivandrum');

CREATE TABLE restaurants (
    restaurant_id   INT,
    restaurant_name VARCHAR(30),
    city            VARCHAR(30),
    cuisine         VARCHAR(30)
);

INSERT INTO restaurants (restaurant_id, restaurant_name, city, cuisine) VALUES
(1, 'Spice Route',   'Kochi',      'South Indian'),
(2, 'Biryani House', 'Kozhikode',  'Biryani'),
(3, 'Dragon Wok',    'Kochi',      'Chinese'),
(4, 'Pizza Corner',  'Thrissur',   'Italian'),
(5, 'Green Bowl',    'Trivandrum', 'Healthy'),
(6, 'Tandoor Tales', 'Kochi',      'North Indian');

CREATE TABLE orders (
    order_id      INT,
    customer_id   INT,
    restaurant_id INT,
    order_date    DATE,
    amount        DECIMAL(10,2)
);

INSERT INTO orders (order_id, customer_id, restaurant_id, order_date, amount) VALUES
(1001, 1,    1, '2026-08-03', 420.00),
(1002, 2,    2, '2026-08-05', 650.00),
(1003, 3,    3, '2026-08-09', 380.00),
(1004, 1,    4, '2026-08-14', 540.00),
(1005, NULL, 1, '2026-08-18', 260.00),
(1006, 4,    2, '2026-08-22', 720.00),
(1007, 5,    3, '2026-08-27', 310.00),
(1008, 2,    1, '2026-09-01', 480.00),
(1009, 6,    2, '2026-09-04', 590.00),
(1010, 7,    4, '2026-09-08', 450.00),
(1011, 1,    2, '2026-09-12', 680.00),
(1012, NULL, 3, '2026-09-15', 350.00),
(1013, 8,    1, '2026-09-19', 300.00),
(1014, 3,    2, '2026-09-23', 760.00),
(1015, 4,    4, '2026-09-27', 410.00),
(1016, 5,    1, '2026-10-02', 520.00),
(1017, 7,    3, '2026-10-06', 290.00),
(1018, 2,    4, '2026-10-10', 630.00),
(1019, NULL, 2, '2026-10-14', 840.00),
(1020, 6,    1, '2026-10-18', 370.00),
(1021, 8,    3, '2026-10-22', 460.00),
(1022, 1,    1, '2026-10-25', 400.00),
(1023, 4,    3, '2026-10-28', 330.00),
(1024, 3,    4, '2026-10-30', 570.00);

CREATE TABLE delivery_partners (
    partner_id    INT,
    partner_name  VARCHAR(30),
    city          VARCHAR(30),
    supervisor_id INT
);

INSERT INTO delivery_partners (partner_id, partner_name, city, supervisor_id) VALUES
(1, 'Mohan Kumar',   'Kochi',      NULL),
(2, 'Nisha Varma',   'Kozhikode',  1),
(3, 'Omar Faizal',   'Kochi',      1),
(4, 'Preethi Raj',   'Thrissur',   2),
(5, 'Rahul Dev',     'Kozhikode',  2),
(6, 'Sajid Ali',     'Kochi',      3),
(7, 'Tessa George',  'Trivandrum', 3),
(8, 'Uday Krishnan', 'Thrissur',   4);

CREATE TABLE old_customers (
    customer_id   INT,
    customer_name VARCHAR(30),
    city          VARCHAR(30)
);

INSERT INTO old_customers (customer_id, customer_name, city) VALUES
(3,  'Charan Raj',     'Kozhikode'),
(7,  'Gokul Das',      'Kochi'),
(13, 'Manu Varghese',  'Kochi'),
(14, 'Neethu Paul',    'Thrissur'),
(15, 'Oliver Jose',    'Trivandrum');

CREATE TABLE old_orders (
    order_id      INT,
    customer_id   INT,
    restaurant_id INT,
    order_date    DATE,
    amount        DECIMAL(10,2)
);

INSERT INTO old_orders (order_id, customer_id, restaurant_id, order_date, amount) VALUES
(901, 3,  1, '2025-11-04', 350.00),
(902, 13, 2, '2025-11-11', 610.00),
(903, 7,  3, '2025-11-19', 280.00),
(904, 14, 4, '2025-12-02', 490.00),
(905, 3,  2, '2025-12-10', 700.00),
(906, 15, 1, '2025-12-21', 330.00),
(907, 7,  4, '2026-01-08', 520.00),
(908, 13, 3, '2026-01-15', 410.00);


-- =====================================================
-- PRACTICE QUESTIONS
-- =====================================================
-- section A
--  1. Show the customer name, order ID and amount of every order
--    placed by a registered customer.
select c.customer_name,o.order_id,o.amount from customers c inner join orders o on c.customer_id=o.customer_id;


-- 2. Show the customer name, city and amount of every order above 500.
select c.customer_name,c.city,o.amount from customers c left join orders o on c.customer_id=o.customer_id where o.amount>500;

-- 3. Show the restaurant name and amount of every order.
select r.restaurant_name,o.amount from restaurants r inner join orders o on r.restaurant_id=r.restaurant_id;

-- SECTION B
-- 4. Show all customers with their order IDs and amounts, including
--    customers who have never placed an order.
select c.customer_name,o.order_id,o.amount from customers c left join orders o on c.customer_id=o.customer_id;

-- 5. Show the names of customers who have never placed an order.
select c.customer_name,o.order_id from customers c left join orders o on c.customer_id=o.customer_id where o.order_id is null;

-- 6. Show all restaurants with the order IDs they received, including restaurants that received no order.
select r.restaurant_name,o.order_id from restaurants r left join orders o on r.restaurant_id=o.restaurant_id;

-- 7. Show the names of restaurants that have not received any order.
select r.restaurant_name,o.order_id from restaurants r left join orders o on r.restaurant_id=o.restaurant_id where o.order_id is not null;

-- SECTION C
-- 8. Show every order with the customer's name, including orders placed without a customer account. Write the customers table
--    first and the orders table second.
select c.customer_name,o.order_id from customers c right join orders o on c.customer_id=o.customer_id;

-- 9. Show the order ID and amount of orders placed without a customer
--    account.
select o.order_id,o.amount,c.customer_id from orders o left join customers c on c.customer_id=o.customer_id where c.customer_id is null;

-- 10. Show the result of question 6 again, but write the orders table
--     first and the restaurants table second.
select o.order_id, r.restaurant_name from orders o right join restaurants r on o.restaurant_id=r.restaurant_id;

-- SECTION D
-- 11. Show each delivery partner's name with their supervisor's name.
SELECT p.partner_name, s.partner_name FROM delivery_partners p inner JOIN delivery_partners s ON p.supervisor_id = s.partner_id;

-- 12. Show the same list, but also include the partner who has no
--     supervisor.
SELECT p.partner_name, s.partner_name FROM delivery_partners p left JOIN delivery_partners s ON p.supervisor_id = s.partner_id;

-- 13. Show the names of the delivery partners supervised by
--     Mohan Kumar.
SELECT p.partner_name, s.partner_name FROM delivery_partners p inner JOIN delivery_partners s ON p.supervisor_id = s.partner_id where p.partner_name='mohan kumar';

-- SECTION E
-- 14. Show the name and city of all customers from the customers and
--     old_customers tables together, with each repeated person shown
--     only once.
select*from customers
union all
select*from old_customers;

-- 15. Show the same list again, but keep every row.
select*from customers
union 
select*from old_customers;

-- 16. Show all orders from the orders and old_orders tables together
--     in one list, keeping every row.
select*from orders union all select*from old_orders;

-- SECTION F
-- 17. Show each customer's name with the number of orders they placed,
--     including customers who placed none.
SELECT c.customer_name,COUNT(o.order_id) AS total_orders FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id group by c.customer_name;

-- 18. Show each restaurant's name with the total amount of its orders,
--     only for restaurants whose total is above 2500.
SELECT r.restaurant_name,SUM(o.amount) AS total_amount FROM restaurants r INNER JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name HAVING SUM(o.amount) > 2500;