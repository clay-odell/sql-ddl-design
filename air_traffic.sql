-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country_name VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name VARCHAR(50) NOT NULL UNIQUE,
  country_id INT,
  FOREIGN KEY (country_id) REFERENCES countries(id)

);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airlines(id),
  from_city_id INT REFERENCES cities(id),
  from_country_id INT REFERENCES countries(id),
  to_city_id INT REFERENCES cities(id),
  to_country_id INT REFERENCES countries(id)
);

INSERT INTO countries
(country_name)
VALUES
('United States'), 
('Japan'), 
('United Kingdom'), 
('France'), 
('UAE'),
('Mexico'),
('Morocco'),
('Brazil'), 
('China'),
('Chile');


INSERT INTO cities
(city_name, country_id)
VALUES
('Los Angeles', (SELECT id FROM countries WHERE country_name = 'United States')),
('Las Vegas', (SELECT id FROM countries WHERE country_name = 'United States')),
('Seattle', (SELECT id FROM countries WHERE country_name = 'United States')),
('New York', (SELECT id FROM countries WHERE country_name = 'United States')),
('New Orleans', (SELECT id FROM countries WHERE country_name = 'United States')),
('Cedar Rapids', (SELECT id FROM countries WHERE country_name = 'United States')),
('Charlotte', (SELECT id FROM countries WHERE country_name = 'United States')),
('Chicago', (SELECT id FROM countries WHERE country_name = 'United States'))
('Washington DC', (SELECT id FROM countries WHERE country_name = 'United States')),
('Tokyo', (SELECT id FROM countries WHERE country_name = 'Japan')),
('London', (SELECT id FROM countries WHERE country_name = 'United Kingdom')),
('Paris', (SELECT id FROM countries WHERE country_name = 'France')),
('Dubai', (SELECT id FROM countries WHERE country_name = 'UAE')),
('Mexico City', (SELECT id FROM countries WHERE country_name = 'Mexico')),
('Bejing', (SELECT id FROM countries WHERE country_name = 'China')),
('Sao Paolo', (SELECT id FROM countries WHERE country_name = 'Brazil')),
('Santiago', (SELECT id FROM countries WHERE country_name = 'Chile')),
('Casablanca', (SELECt id FROM countries WHERE country_name = 'Morocco'));

INSERT INTO airlines
(airline_name)
VALUES
('United'), ('British Airways'),('Delta'),('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');



INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
SELECT
'Jennifer', '
Finch', 
'33B', 
'2018-04-08 09:00:00', 
'2018-04-08 12:00:00', 
(SELECT id FROM airlines WHERE airline_name = 'United' ),
(SELECT id FROM cities WHERE city_name = 'Washington DC'),
(SELECT id FROM countries WHERE country_name ='United States'), 
(SELECT id FROM cities WHERE city_name = 'Seattle'), 
(SELECT id FROM countries WHERE country_name = 'United States')
UNION ALL
SELECT
'Thadeus', 
'Gathercoal', 
'8A', 
'2018-12-19 12:45:00', 
'2018-12-19 16:15:00', 
(SELECT id FROM airlines WHERE airline_name = 'British Airways'), 
(SELECT id FROM cities WHERE city_name = 'Tokyo'), 
(SELECT id FROM countries WHERE country_name = 'Japan'), 
(SELECT id FROM cities WHERE city_name = 'London'), 
(SELECT id FROM countries WHERE country_name ='United Kingdom')
UNION ALL
SELECT
'Sonja', 
'Pauley', 
'12F', 
'2018-01-02 07:00:00', 
'2018-01-02 08:03:00', 
(SELECT id FROM airlines WHERE airline_name = 'Delta'), 
(SELECT id FROM cities WHERE city_name = 'Los Angeles'), 
(SELECT id FROM countries WHERE country_name = 'United States'), 
(SELECT id FROM cities WHERE city_name = 'Las Vegas'), 
(SELECT id FROM countries WHERE country_id = 'United States')
UNION ALL
SELECT
'Jennifer', 
'Finch', 
'20A', 
'2018-04-15 16:50:00', 
'2018-04-15 21:00:00', 
(SELECT id FROM airlines WHERE airline_name ='Delta'), 
(SELECT id FROM cities WHERE city_name = 'Seattle'), 
(SELECT id FROM countries WHERE country_name = 'United States'), 
(SELECT id FROM cities WHERE city_name = 'Mexico City'), 
(SELECT id FROM countries WHERE country_name = 'Mexico')
UNION ALL
SELECT
'Waneta', 
'Skeleton', 
'23D', 
'2018-08-01 18:30:00', 
'2018-08-01 21:50:00', 
(SELECT id FROM airlines WHERE airline_name = 'TUI Fly Belgium'), 
(SELECT id FROM cities WHERE city_name = 'Paris'), 
(SELECT id FROM countries WHERE country_name = 'France'), 
(SELECT id FROM cities WHERE city_name = 'Casablanca'), 
(SELECT id FROM countries WHERE country_name = 'Morocco')
UNION ALL
SELECT
'Thadeus', 
'Gathercoal', 
'18C', 
'2018-10-31 01:15:00', 
'2018-10-31 12:55:00', 
(SELECT id FROM airlines WHERE airline_name = 'Air China'), 
(SELECT id FROM cities WHERE city_name = 'Dubai'), 
(SELECT id FROM countries WHERE country_name = 'UAE'), 
(SELECT id FROM cities WHERE city_name = 'Beijing'), 
(SELECT id FROM countries WHERE country_name = 'China')
UNION ALL
SELECT
'Berkie', 
'Wycliff', 
'9E', 
'2019-02-06 06:00:00', 
'2019-02-06 07:47:00', 
(SELECT id FROM airlines WHERE airline_name = 'United'), 
(SELECT id FROM cities WHERE city_name = 'New York'), 
(SELECT id FROM countries WHERE country_name = 'United States'), 
(SELECT id FROM cities WHERE city_name = 'Charlotte'), 
(SELECT id FROM countries WHERE country_name = 'United States')
UNION ALL
SELECT
'Alvin', 
'Leathes', 
'1A', 
'2018-12-22 14:42:00', 
'2018-12-22 15:56:00', 
(SELECT id FROM airlines WHERE airline_name = 'American Airlines'), 
(SELECT id FROM cities WHERE city_name = 'Cedar Rapids'), 
(SELECT id FROM countries WHERE country_name = 'United States'), 
(SELECT id FROM cities WHERE city_name = 'Chicago'), 
(SELECT id FROM countries WHERE country_name = 'United States')
UNION ALL
SELECT
'Berkie', 
'Wycliff', 
'32B', 
'2019-02-06 16:28:00', 
'2019-02-06 19:18:00', 
(SELECT id FROM airlines WHERE airline_name = 'American Airlines'), 
(SELECT id FROM cities WHERE city_name = 'Charlotte'), 
(SELECT id FROM countries WHERE country_name = 'United States'), 
(SELECT id FROM cities WHERE city_name = 'New Orleans'), 
(SELECT id FROM countries WHERE country_name = 'United States')
UNION ALL
SELECT
'Cory', 
'Squibbes', 
'10D', 
'2019-01-20 19:30:00', 
'2019-01-20 22:45:00', 
(SELECT id FROM airlines WHERE airline_name = 'Avianca Brasil'), 
(SELECT id FROM cities WHERE city_name = 'Sao Paolo'), 
(SELECT id FROM countries WHERE country_name = 'Brazil'), 
(SELECT id FROM cities WHERE city_name = 'Santiago'), 
(SELECT id FROM countries WHERE country_name = 'Chile');