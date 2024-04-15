show databases;
create database shopping;
use shopping;

CREATE TABLE User (
    user_id INT PRIMARY KEY,
    email_id VARCHAR(255) UNIQUE NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    country VARCHAR(255),
    address VARCHAR(255),
	dob DATE,
    login_status VARCHAR(255) NOT NULL,
    gender VARCHAR(255),
    no_of_orders INT
);

CREATE TABLE Mobile_No (
    user_id INT NOT NULL,
    mobile_number VARCHAR(15) PRIMARY KEY NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Cart (
    cart_id VARCHAR(255) PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Orders (
    order_id VARCHAR(255) PRIMARY KEY,
    order_date DATE,
    customer_address VARCHAR(255),
    track_status VARCHAR(255),
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Product (
    product_id VARCHAR(255) PRIMARY KEY,
    product_name VARCHAR(255) UNIQUE NOT NULL,
    pay_amount DECIMAL(10, 2),
    Discount DECIMAL(5, 2),
    price DECIMAL(10, 2) NOT NULL,
    count INT NOT NULL
);

CREATE TABLE Product_ID (
    cart_id VARCHAR(255) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (cart_id, product_id),
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create the Order_Product Table
CREATE TABLE Order_Product (
    order_id VARCHAR(255) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id,product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Mobile (
    mob_id VARCHAR(255) NOT NULL,
    mob_model_name VARCHAR(255) PRIMARY KEY NOT NULL,
    os VARCHAR(255),
    processor VARCHAR(255),
    p_memory VARCHAR(255) NOT NULL,
    s_memory VARCHAR(255) NOT NULL,
    FOREIGN KEY (mob_id) REFERENCES Product(product_id)
);

CREATE TABLE Laptop (
	lap_id VARCHAR(255)  NOT NULL,
    lap_model_name VARCHAR(255) PRIMARY KEY NOT NULL,
    os VARCHAR(255),
    processor VARCHAR(255),
    p_memory VARCHAR(255) NOT NULL,
    s_memory VARCHAR(255) NOT NULL,
    FOREIGN KEY (Lap_id) REFERENCES Product(product_id)
);

-- Create the Saved_Card Table
CREATE TABLE Saved_Card (
    card_no VARCHAR(255) PRIMARY KEY,
    user_id INT NOT NULL,
    cardholder_fname VARCHAR(255) NOT NULL,
    cardholder_lname VARCHAR(255) NOT NULL,
    expirydate DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
    
);

CREATE TABLE Feedback (
    order_id VARCHAR(255) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    feedback_rating INT NOT NULL,
    comment TEXT,
    PRIMARY KEY (order_id, product_id, feedback_rating),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
drop table Orders;


ALTER TABLE Order_Product
MODIFY order_id VARCHAR(255);









