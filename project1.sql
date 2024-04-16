DROP TABLE IF EXISTS shop_data;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customer_interactions;
DROP TABLE IF EXISTS promotions;

CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY AUTOINCREMENT, -- customer id (auto genertated)
name TEXT NOT NULL,
phone_number TEXT NOT NULL CHECK (LENGTH(phone_number) = 8 AND phone_number GLOB '[0-9]*'), -- to limit the phone number must be 8 digit, and it must be a number(no charactor)
address TEXT,
gender TEXT CHECK (gender IN ('Male', 'Female', 'Other')), -- to limit gender option, only these 3 type of gender is allow in the data base
member_code NOT NULL UNIQUE, --(unique member code in case of duplication)
favorites TEXT,
email TEXT UNIQUE,
FOREIGN KEY(member_code) REFERENCES members(member_code) 
);
--Create members Table
CREATE TABLE members(
member_code INTEGER PRIMARY KEY AUTOINCREMENT,
Member_points INTEGER,
birthday DATE
);
-- Add CRM-specific columns to the Customers table
ALTER TABLE customers ADD COLUMN visit_frequency INTEGER;
ALTER TABLE customers ADD COLUMN last_visit DATE;
-- Create Employees Table
CREATE TABLE employees (
employee_number INTEGER PRIMARY KEY,
name TEXT NOT NULL,
role_position TEXT,
shift_schedule TEXT,
phone_number TEXT,
address TEXT
);
-- Create Supplier Table
CREATE TABLE suppliers (
supplier_id INTEGER PRIMARY KEY AUTOINCREMENT, -- supplier id (auto genertated)
information TEXT
);
-- Create the new detailed Inventory Table
CREATE TABLE inventory (
item_id INTEGER PRIMARY KEY AUTOINCREMENT, -- supplier id (auto genertated)
item_name TEXT NOT NULL,
category TEXT,
quantity INTEGER,
purchase_date DATE,
expiration_date DATE,
supplier_id INTEGER,
FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id) ON DELETE SET NULL ON UPDATE CASCADE
);
-- Create a table to track Customer Interactions
CREATE TABLE customer_interactions (
interaction_id INTEGER PRIMARY KEY AUTOINCREMENT, -- supplier id (auto genertated)
customer_id INTEGER,
interaction_date DATE,
interaction_type TEXT,
notes TEXT,
FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Create Promotions Table
CREATE TABLE promotions (
PROMOTION_ID INTEGER PRIMARY KEY AUTOINCREMENT, -- supplier id (auto genertated)
PROMOTION_NAME TEXT NOT NULL,
NOTES TEXT,
DESCRIPTION TEXT,
START_DATE DATE,
END_DATE DATE
);
-- Insert data into members table
INSERT INTO members (member_code, Member_points, birthday)
VALUES (001, 100, '1990-01-01');
INSERT INTO members (member_code, Member_points, birthday)
VALUES (002, 150, '1995-05-15');
-- Insert data into customers table
INSERT INTO customers (name, phone_number,address, gender, member_code, favorites, email,visit_frequency,last_visit)
VALUES ('John Doe', '12345678','King St', 'Male', 001, 'Espresso', 'john.doe@example.com',2,'2024-03-13');
INSERT INTO customers (name, phone_number,address ,gender, member_code, favorites, email,visit_frequency,last_visit)
VALUES ('Jane Smith', '87654321','Queen St' ,'Female', 002, 'Latte', 'jane.smith@example.com',3,'2024-03-14');
-- Insert data into employees table
INSERT INTO employees (employee_number, name, role_position, shift_schedule, phone_number, address)
VALUES (1, 'Alice Johnson', 'Manager', 'Day', '98765432', '123 Main St');
INSERT INTO employees (employee_number, name, role_position, shift_schedule, phone_number, address)
VALUES (2, 'Bob Williams', 'Assistant Manager', 'Night', '87654321', '456 Elm St');
-- Insert data into suppliers table
INSERT INTO suppliers (supplier_id, information)
VALUES (1, 'Supplier A');
INSERT INTO suppliers (supplier_id, information)
VALUES (2, 'Supplier B');
-- Insert data into inventory table
INSERT INTO inventory (item_id,item_name, category, quantity, purchase_date, expiration_date, supplier_id)
VALUES (1,'Espresso', 'Coffee', 50, '2024-01-01', '2024-02-01', 1);
INSERT INTO inventory (item_id,item_name, category, quantity, purchase_date, expiration_date, supplier_id)
VALUES (2,'Latte', 'Coffee', 100, '2024-02-01', '2024-03-01', 2);
-- Insert data into customer_interactions table
INSERT INTO customer_interactions (customer_id, interaction_date, interaction_type, notes)
VALUES (1, '2022-01-01', 'Inquiry', 'Customer inquired about a Latte');
INSERT INTO customer_interactions (customer_id, interaction_date, interaction_type, notes)
VALUES (2, '2022-02-01', 'Purchase', 'Customer purchased Espresso');
-- Insert data into promotions table
INSERT INTO promotions (PROMOTION_NAME, NOTES, DESCRIPTION, START_DATE, END_DATE)
VALUES ('Spring Sale', 'Discount on all product', 'Save up to 50% on your purchases', '2022-03-01', '2022-03-31'); 
