-- Create database
CREATE DATABASE IF NOT EXISTS oews_db;
USE oews_db;

-- Cart List
CREATE TABLE cart_list (
    id INT(30) NOT NULL AUTO_INCREMENT,
    customer_id INT(30) NOT NULL,
    product_id INT(30) NOT NULL,
    quantity INT(30) NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

-- Category List
CREATE TABLE category_list (
    id INT(30) NOT NULL AUTO_INCREMENT,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    status TINYINT(1) NOT NULL DEFAULT 0,
    delete_flag TINYINT(1) NOT NULL DEFAULT 0,
    date_created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Customer List
CREATE TABLE customer_list (
    id INT(30) NOT NULL AUTO_INCREMENT,
    firstname TEXT NOT NULL,
    middlename TEXT DEFAULT NULL,
    lastname TEXT NOT NULL,
    gender VARCHAR(100) NOT NULL,
    contact TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    avatar TEXT DEFAULT NULL,
    date_created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Order Item
CREATE TABLE order_items (
    order_id INT(30) NOT NULL,
    product_id INT(30) NOT NULL,
    quantity INT(3) NOT NULL DEFAULT 0,
    price FLOAT(12,2) NOT NULL
);

-- Order List
CREATE TABLE order_list (
    id INT(30) NOT NULL AUTO_INCREMENT,
    code VARCHAR(100) NOT NULL,
    customer_id INT(30) NOT NULL,
    delivery_address TEXT NOT NULL,
    total_amt FLOAT(12,2) NOT NULL DEFAULT 0,
    status TINYINT(1) NOT NULL DEFAULT 0,
    date_created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Product List
CREATE TABLE product_list (
    id INT(30) NOT NULL AUTO_INCREMENT,
    category_id INT(3) NOT NULL,
    brand TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    dose VARCHAR(250) NOT NULL,
    price FLOAT(12,2) NOT NULL DEFAULT 0,
    image_path TEXT DEFAULT NULL,
    status TINYINT(1) NOT NULL DEFAULT 1,
    delete_flag TINYINT(1) NOT NULL DEFAULT 1,
    date_created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Stock List
CREATE TABLE stock_list (
    id INT(30) NOT NULL AUTO_INCREMENT,
    product_id INT(30) NOT NULL,
    code VARCHAR(100) NOT NULL,
    quantity FLOAT(12,2) NOT NULL DEFAULT 0,
    date_created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- Stock Out
CREATE TABLE stock_out (
    id INT(30) NOT NULL AUTO_INCREMENT,
    order_id INT(30) NOT NULL,
    stock_id INT(30) NOT NULL,
    quantity INT(30) NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);
