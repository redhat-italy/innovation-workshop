-- 
-- Editor SQL for DB table books
-- Created by http://editor.datatables.net/generator
-- 

CREATE TABLE IF NOT EXISTS books (
	id serial,
	title text,
	description text,
	author text,
	price numeric(9,2),
	PRIMARY KEY( id )
);

INSERT INTO books (id, title, description, author, price) VALUES (1, 'The Lord of The rings', 'The Lord of the Rings by J.R.R. Tolkien tells the story of the War of the Ring in the fictional world of Middle-earth.', 'J.R.R. Tolkien', 20);
INSERT INTO books (id, title, description, author, price) VALUES (2, '2001: A Space Odyssey', '2001: A Space Odyssey. In the beginning of the novel, the early ancestors of humans encounter the monolith on Earth. After they interact with the monolith, their intelligence, or at least their way of thinking, takes a leap. They begin to develop tools, which let them move up the food chain.', ' Arthur C. Clarke', 25);
INSERT INTO books (id, title, description, author, price) VALUES (3, 'Dune', 'Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis.', 'Frank Herbert', 35);