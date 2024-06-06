create database BiteBox
use BiteBox
CREATE TABLE Restaurant (
    rest_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    rest_name VARCHAR(30),
    rest_password VARCHAR(30),
    rest_description TEXT,
	rest_location VARCHAR(30),
    rest_email VARCHAR(30),
    sales_tax DECIMAL(10, 2),
    order_lead_time INT,
    delivery_extra_time INT
);

CREATE TABLE Customer_Signup (
	Cust_Name VARCHAR(30),
    Cust_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Cust_email VARCHAR(30),
    Cust_password VARCHAR(30),
    Cust_phone VARCHAR(13),
	Cust_location VARCHAR(30) 
);

CREATE TABLE Rider_Signup (
    rider_name VARCHAR(30),
	rider_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	rider_email VARCHAR(30),
    rider_password VARCHAR(30),
    rider_license VARCHAR(11), 
    rider_phone VARCHAR(13),
	rider_location VARCHAR(30),
	rider_balance FLOAT,
	rider_rating FLOAT,
	rider_ttl_orders int
);


CREATE TABLE Restaurant_Menu (
    menu_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    rest_id INT,
    Category VARCHAR(30),
    item_name VARCHAR(30),
    item_description TEXT,
    item_price FLOAT,
	item_rating FLOAT
);

CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    order_total FLOAT,
    Cust_id int,
    rider_id int,
	rest_id int,
	order_status varchar(30)
);

CREATE TABLE Order_Items(
	order_id INT,
    menu_id INT,
	item_qty INT

	PRIMARY KEY(order_id,menu_id)
);

CREATE TABLE Cart (
    Cust_id int,
    cart_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    menu_id INT,
    quantity INT,
    total_price FLOAT
);

CREATE TABLE Admin_Acc (
	admin_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	admin_name VARCHAR(30),
    admin_password VARCHAR(30),
	admin_email VARCHAR(30)
)

SELECT name, type_desc
FROM sys.triggers
WHERE parent_id = OBJECT_ID('Customer_Signup') OR parent_id = OBJECT_ID('Restaurant') 
OR parent_id = OBJECT_ID('Rider_Signup');


ALTER TABLE Restaurant_Menu
ADD CONSTRAINT fk_restMenu_rest FOREIGN KEY (rest_id) REFERENCES Restaurant(rest_id) ON DELETE CASCADE

ALTER TABLE Order_Items
ADD CONSTRAINT fk_Orders_restMenu FOREIGN KEY (menu_id) REFERENCES Restaurant_Menu(menu_id) ON DELETE CASCADE

ALTER TABLE Order_Items
ADD CONSTRAINT fk_Orders_Orders FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE NO ACTION ON UPDATE NO ACTION

ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_user FOREIGN KEY (Cust_id) REFERENCES Customer_Signup(Cust_id) ON DELETE CASCADE

ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_rider FOREIGN KEY (rider_id) REFERENCES Rider_Signup(rider_id) ON DELETE SET NULL

ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_rest FOREIGN KEY (rest_id) REFERENCES Restaurant(rest_id) ON DELETE CASCADE


ALTER TABLE Cart
ADD CONSTRAINT fk_Cart_user FOREIGN KEY (Cust_id) REFERENCES Customer_Signup(Cust_id) ON DELETE CASCADE

ALTER TABLE Cart
ADD CONSTRAINT fk_Cart_restMenu FOREIGN KEY (menu_id) REFERENCES Restaurant_Menu(menu_id) ON DELETE CASCADE



--temp inserts:
INSERT INTO Restaurant_Menu (rest_id, Category, item_name, item_description, item_price, item_rating)
VALUES 
(11, 'Pizza', 'Pepperoni Pizza', 'Classic pizza topped with pepperoni and mozzarella cheese.', 10.99, 4.6),
(11, 'Pizza', 'Margherita Pizza', 'Traditional pizza topped with fresh tomatoes, mozzarella, and basil.', 9.99, 4.4),
(11, 'Sides', 'Garlic Knots', 'Soft bread knots brushed with garlic butter and parsley.', 4.49, 4.3),
(12, 'Burgers', 'Classic Cheeseburger', 'Beef patty with American cheese, lettuce, tomato, and pickles.', 8.99, 4.7),
(12, 'Burgers', 'Vegetarian Burger', 'Grilled portobello mushroom with roasted red pepper and avocado.', 9.49, 4.5),
(12, 'Sides', 'Crispy Fries', 'Golden fries seasoned with salt and served hot.', 3.99, 4.2);

INSERT INTO Restaurant_Menu (rest_id, Category, item_name, item_description, item_price, item_rating)
VALUES 
(12, 'Burgers', 'Classic Cheeseburger', 'Beef patty with American cheese, lettuce, tomato, and pickles.', 8.99, 4.7),
(12, 'Burgers', 'Vegetarian Burger', 'Grilled portobello mushroom with roasted red pepper and avocado.', 9.49, 4.5),
(12, 'Sides', 'Crispy Fries', 'Golden fries seasoned with salt and served hot.', 3.99, 4.2);

INSERT INTO Restaurant (rest_name, rest_password, rest_description, rest_location, rest_email, sales_tax, order_lead_time, delivery_extra_time)
VALUES 
('Pizza Palace', 'pizzapass123', 'Your go-to place for delicious pizzas and sides.', 'Gulberg', 'info@pizzapalace.com', 0.12, 40, 25),
('Burger Barn', 'burgerlover456', 'Serving up mouthwatering burgers, fries, and shakes.', 'Valencia', 'contact@burgerbarn.com', 0.1, 35, 20);
INSERT INTO Restaurant_Menu (rest_id, Category, item_name, item_description, item_price, item_rating)
VALUES 
(9, 'Appetizers', 'Garlic Bread', 'Toasted bread slices topped with garlic butter and herbs.', 5.99, 4.5),
(9, 'Main Course', 'Spaghetti Carbonara', 'Pasta served in a creamy sauce with bacon and Parmesan cheese.', 12.99, 4.8),
(10, 'Appetizers', 'Samosas', 'Deep-fried pastry filled with spiced potatoes and peas.', 4.49, 4.2),
(10, 'Main Course', 'Chicken Tikka Masala', 'Grilled chicken cooked in a rich tomato-based curry sauce.', 14.99, 4.7);
INSERT INTO Rider_Signup (rider_name, rider_password, rider_license, rider_phone, rider_location, rider_balance, rider_rating, rider_ttl_orders)
VALUES 
('Mike Johnson', 'mikeriderpass', 'AB123456789', '+11234567890', 'DHA', 100.00, 4.5, 50),
('Sara Lee', 'sarariderpass', 'CD987654321', '+19876543210', 'Gulberg', 75.50, 4.8, 70);
INSERT INTO Customer_Signup (Cust_Name, Cust_email, Cust_password, Cust_phone, Cust_location)
VALUES 
('John Doe', 'john@example.com', 'securepass123', '+1234567890', 'DHA'),
('Jane Smith', 'jane@example.com', 'password456', '+1987654321', 'Gulberg');
INSERT INTO Restaurant (rest_name, rest_password, rest_description, rest_location, rest_email, sales_tax, order_lead_time, delivery_extra_time)
VALUES 
('Tasty Bites', 'Password123', 'A cozy restaurant serving delicious comfort food.', 'Gulberg', 'info@tastybites.com', 0.1, 30, 15),
('Spice Route', 'Spicyfoodlover', 'Experience the flavors of India with our authentic dishes.', 'DHA', 'contact@spiceroute.com', 0.08, 45, 20);

-- Inserting some orders into the Orders table

-- Insert orders for restaurant ID 12 and customers with IDs 1, 2, and 3
INSERT INTO Orders (order_total, Cust_id, rest_id, order_status)
VALUES
    (100.00, 1, 10, 'Pending'), -- Order for customer ID 1
    (150.00, 1, 10, 'Pending'), -- Order for customer ID 2
    (80.00, 3, 10, 'Pending');  -- Order for customer ID 3
INSERT INTO Orders (order_total, Cust_id, rest_id, order_status)
VALUES	
	(30.00, 1, 11, 'Pending'),  -- Order for customer ID 3
	(85.00, 2, 10, 'Pending'),  -- Order for customer ID 3
	(10.00, 2, 10, 'Pending');  -- Order for customer ID 3

-- Insert order items for each order
-- For simplicity, let's assume each order has one item with a quantity of 1
INSERT INTO Order_Items (order_id, menu_id, item_qty)
VALUES
    (1, 4, 1), -- Item 17 for order ID 1
    (2, 5, 1), -- Item 18 for order ID 1
    (3, 5, 1)-- Item 19 for order ID 1

INSERT INTO Order_Items (order_id, menu_id, item_qty)
VALUES
    (4, 7, 2), -- Item 17 for order ID 1
	(5, 4, 1),
	(5, 5, 1),
	(6, 4, 1);


	SELECT * FROM Order_Items
	SELECT * FROM Orders
	Select * from Restaurant_Menu
	Select * from Rider_Signup
	Select * from Restaurant
	Select * from Admin_Acc

	Insert into Admin_Acc
	Values('Admin', 'Admin@123', 'SuperSecretAdmin@gmail.com')
