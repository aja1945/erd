CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Ticket (
    ticket_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES Movie(movie_id),
    customer_id INT REFERENCES Customer(customer_id),
    seat_number INT,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Concession (
    concession_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    item_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Movie (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    genre VARCHAR(255),
    duration INT,
    rating VARCHAR(5)
);

INSERT INTO Customer (name, email) VALUES
    ('John Doe', 'john.doe@example.com'),
    ('Jane Smith', 'jane.smith@example.com');

INSERT INTO Movie (title, release_date, genre, duration, rating) VALUES
    ('Movie 1', '2023-01-15', 'Action', 120, 'PG-13'),
    ('Movie 2', '2023-02-20', 'Comedy', 110, 'R');

INSERT INTO Ticket (movie_id, customer_id, seat_number, price) VALUES
    (1, 1, 101, 10.50),
    (2, 2, 102, 12.00);

INSERT INTO Concession (customer_id, item_name, price) VALUES
    (1, 'Popcorn', 5.50),
    (1, 'Soda', 3.00),
    (2, 'Candy', 2.75);