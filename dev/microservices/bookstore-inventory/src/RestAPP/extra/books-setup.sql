CREATE TABLE booksinventory (
    id INT PRIMARY KEY IDENTITY (1, 1),
    bookid INT NOT NULL,
    quantity INT NOT NULL    
);

insert into booksinventory (id, bookid, quantity) VALUES (1, 1, 13)
insert into booksinventory (id, bookid, quantity) VALUES (2, 2, 24)
insert into booksinventory (id, bookid, quantity) VALUES (3, 3, 36)