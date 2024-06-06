use BiteBox

--------------------------------stored procedures
-----------------------------------------------------------------------------------------
---------------------------------Log In--------------------------------------------------
---------------------Customer login
CREATE PROCEDURE userLogin
@cust_email VARCHAR(30),
@cust_password VARCHAR(30)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Customer_Signup WHERE Cust_email = @cust_email AND Cust_password = @cust_password)
    BEGIN
        DECLARE @ErrorMessage NVARCHAR(4000) = 'Could not find your account';
        THROW 51000, @ErrorMessage, 1;
    END
END

---------------------Restaurant login 
CREATE PROCEDURE restaurantLogin
@restemail VARCHAR(30),  @restPwd VARCHAR(30)
AS
BEGIN
		IF(NOT EXISTS(SELECT * FROM Restaurant where rest_email = @restemail AND rest_password = @restPwd))
		BEGIN
			DECLARE @ErrorMessage NVARCHAR(4000) = 'Could not find your account';
			THROW 51000, @ErrorMessage, 1;
		END
END

--------------------Rider login
CREATE PROCEDURE Rider_Login(
    @p_rider_email VARCHAR(30),
    @p_rider_password VARCHAR(30)
)
AS
BEGIN
    IF(NOT EXISTS(SELECT * FROM Rider_Signup where rider_email = @p_rider_email AND rider_password = @p_rider_password))
		BEGIN
			DECLARE @ErrorMessage NVARCHAR(4000) = 'Could not find your account';
			THROW 51000, @ErrorMessage, 1;
		END
END;

--------------------Admin login
CREATE PROCEDURE adminLogin
@ad_email VARCHAR(30),
@ad_password VARCHAR(30)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Admin_Acc WHERE admin_email = @ad_email AND admin_password = @ad_password)
    BEGIN
        DECLARE @ErrorMessage NVARCHAR(4000) = 'Could not find your account';
        THROW 51000, @ErrorMessage, 1;
    END
END

--------------------------------------------------------------------------------------
----------------------------------Sign Up---------------------------------------------
------------------------------------ Add User Account
CREATE PROCEDURE User_Signup (
    @p_Username VARCHAR(30),
    @p_Email VARCHAR(30),
    @p_Password VARCHAR(30),
    @p_PhoneNumber VARCHAR(13),
	@p_location VARCHAR(30)
)
AS
BEGIN
	 IF EXISTS (SELECT 1 FROM Customer_Signup WHERE Cust_email = @p_Email)
    BEGIN
        DECLARE @error_msg NVARCHAR(255) = 'Email already exists';
        THROW 51000, @error_msg, 1;
        RETURN;
    END;

    INSERT INTO Customer_Signup (Cust_Name, Cust_email, Cust_password, Cust_phone, Cust_location)
    VALUES (@p_Username, @p_Email, @p_Password, @p_PhoneNumber, @p_location);
END;

			
------------------------------------- Add restaurant account
CREATE PROCEDURE Restaurant_Signup (
    @p_RestaurantName VARCHAR(30),
    @p_RestaurantPassword VARCHAR(30),
    @p_RestaurantDescription TEXT,
    @p_Email VARCHAR(30),
	@p_Location VARCHAR(30),
    @p_SalesTax FLOAT,
    @p_OrderLeadTime INT,
    @p_DeliveryExtraTime INT
)
AS
BEGIN
    -- Check if the restaurant ID already exists
    IF EXISTS (SELECT 1 FROM Restaurant WHERE rest_email = @p_Email)
    BEGIN
        -- Signal an error if the restaurant ID already exists
        DECLARE @error_msg NVARCHAR(255)  = 'Restaurant already exists with this email';
		THROW 51000, @error_msg, 1;
    END
    ELSE
    BEGIN
        -- Insert new restaurant account into Restaurant table
        INSERT INTO Restaurant (rest_name, rest_password, rest_description, rest_email, sales_tax, order_lead_time, delivery_extra_time,rest_location)
        VALUES (@p_RestaurantName, @p_RestaurantPassword, @p_RestaurantDescription, @p_Email, @p_SalesTax, @p_OrderLeadTime, @p_DeliveryExtraTime, @p_Location);
    END
END;

-----------------------------------------Add rider account
CREATE PROCEDURE RiderSignup (
	@riderName VARCHAR(30),
    @riderPassword VARCHAR(30),
	@riderEmail VARCHAR(30),
    @riderLicense VARCHAR(11),
    @riderPhone VARCHAR(13),
    @riderLocation VARCHAR(30),
    @riderBalance FLOAT,
    @riderRating FLOAT,
    @riderTtlOrders INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Rider_Signup WHERE rider_email = @riderEmail)
    BEGIN
        DECLARE @error_msg NVARCHAR(255) = 'Rider with this email already exists';
        THROW 51000, @error_msg, 1;
        RETURN;
    END;
    -- Insert new rider account into Rider_Signup table
    INSERT INTO Rider_Signup (rider_name, rider_password, rider_license, rider_phone, rider_location, rider_balance, rider_rating, rider_ttl_orders, rider_email)
    VALUES (@riderName, @riderPassword, @riderLicense, @riderPhone, @riderLocation, @riderBalance, @riderRating, @riderTtlOrders, @riderEmail);
END;



--------------------------------------------------------------------------------
------------------------------------------insert triggers-----------------------
------------------------------- user sign up trigger
CREATE TRIGGER User_Signup_Validation
ON Customer_Signup
INSTEAD OF INSERT
AS
BEGIN
    -- Check if the cursor already exists and deallocate it if it does
    IF CURSOR_STATUS('global', 'Customer_Signup_cursor') >= 0
    BEGIN
    	CLOSE Customer_Signup_cursor;
    	DEALLOCATE Customer_Signup_cursor;
    END
   
    -- Declare the cursor if it doesn't already exist
    IF CURSOR_STATUS('global', 'Customer_Signup_cursor') < 0
    BEGIN
    	DECLARE @error_msg NVARCHAR(255);
    	DECLARE @username VARCHAR(30);
    	DECLARE @email VARCHAR(30);
    	DECLARE @password VARCHAR(30);
    	DECLARE @phoneNumber VARCHAR(13);
          	DECLARE @location VARCHAR(30);
 
    	DECLARE Customer_Signup_cursor CURSOR FOR
    	SELECT Cust_Name, Cust_email, Cust_password, Cust_phone, Cust_location FROM inserted;
 
    	OPEN Customer_Signup_cursor;
    	FETCH NEXT FROM Customer_Signup_cursor INTO @username, @email, @password, @phoneNumber, @location;
 
    	WHILE @@FETCH_STATUS = 0
    	BEGIN
        	-- Perform password validation checks
        	IF LEN(@password) < 8
        	BEGIN
            	SET @error_msg = 'Password must be at least 8 characters long';
            	THROW 51000, @error_msg, 1;
            	RETURN;
        	END;
 
        	IF NOT (
            	@password LIKE '%[A-Z]%' AND -- At least one uppercase letter
            	@password LIKE '%[!@#$%^&*()-_+=]%' -- At least one special character
        	)
        	BEGIN
            	SET @error_msg = 'Password must contain at least one uppercase letter and one special character';
            	THROW 51000, @error_msg, 1;
            	RETURN;
        	END;
 
        	-- Perform email validation checks
        	IF @email NOT LIKE '%@%._%'
        	BEGIN
            	SET @error_msg = 'Invalid email address';
            	THROW 51000, @error_msg, 1;
            	RETURN;
        	END;
 
        	-- Perform phone number format validation checks
        	IF @phoneNumber NOT LIKE '03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
        	BEGIN
            	SET @error_msg = 'Invalid phone number format. Format should be 03XZ-YYYYYYY';
            	THROW 51000, @error_msg, 1;
            	RETURN;
        	END;
 
        	-- If all checks pass, insert the row into the table
        	INSERT INTO Customer_Signup (Cust_Name, Cust_email, Cust_password, Cust_phone, Cust_location)
        	VALUES (@username, @email, @password, @phoneNumber, @location);
 
        	FETCH NEXT FROM Customer_Signup_cursor INTO @username, @email, @password, @phoneNumber, @location;
    	END;
 
    	CLOSE Customer_Signup_cursor;
    	DEALLOCATE Customer_Signup_cursor;
    END
END;


---------------------------------------------- restaurant sign up trigger
CREATE TRIGGER createRestaurantAcc
ON Restaurant
AFTER INSERT
AS
BEGIN
	DECLARE @pwd varchar(30);
	SELECT @pwd =  rest_password FROM inserted;
	DECLARE @password_length int = LEN(@pwd); -- original password length
    DECLARE @uppercase_count int = 0;
    DECLARE @lowercase_count int = 0;
    DECLARE @digit_count int = 0;
    DECLARE @special_count int = 0;
    
    -- number of capital letters
	DECLARE @i int = 1;
	WHILE @i <= LEN(@pwd)
    BEGIN
        IF ASCII(SUBSTRING(@pwd, @i, 1)) BETWEEN 65 AND 90
            SET @uppercase_count = @uppercase_count + 1;
        
        SET @i = @i + 1;
    END;
    
    -- number of small letters
	SET @i = 1;
	WHILE @i <= LEN(@pwd)
    BEGIN
        IF ASCII(SUBSTRING(@pwd, @i, 1)) BETWEEN 97 AND 122
            SET @lowercase_count = @lowercase_count + 1;
        
        SET @i = @i + 1;
    END;

     -- number of digits
	SET @i = 1;
	WHILE @i <= LEN(@pwd)
    BEGIN
        IF ASCII(SUBSTRING(@pwd, @i, 1)) BETWEEN 48 AND 57
            SET @digit_count = @digit_count + 1;
        
        SET @i = @i + 1;
    END;
    
   -- number of special char
    SET @i = 1;
	WHILE @i <= LEN(@pwd)
    BEGIN
		DECLARE @ascii_value int = ASCII(SUBSTRING(@pwd, @i, 1));
        IF (@ascii_value BETWEEN 33 AND 47 OR @ascii_value BETWEEN 58 AND 64 OR @ascii_value BETWEEN 91 AND 96 OR @ascii_value BETWEEN 123 AND 126)
            SET @special_count = @special_count + 1;
        
        SET @i = @i + 1;
    END;

	--email format
	DECLARE @correct_email int = 0;
	IF((SELECT rest_email FROM inserted) LIKE '%@%.%')
		BEGIN
			SET @correct_email = 1;
		END

	-- checking constraints
	IF @password_length < 8 OR
       @uppercase_count < 1 OR
       @lowercase_count < 1 OR
       @digit_count < 1 OR
       @special_count < 1 
	BEGIN
		DECLARE @id int;
		SELECT @id =  rest_id FROM inserted;
		DELETE FROM Restaurant WHERE rest_id = @id;
		DECLARE @ErrorMessage NVARCHAR(4000) = 'Weak passwords not allowed';
        THROW 51000, @ErrorMessage, 1;
	END

	IF @correct_email = 0
	BEGIN
		DECLARE @id1 int;
		SELECT @id1 =  rest_id FROM inserted;
		DELETE FROM Restaurant WHERE rest_id = @id1;
		DECLARE @ErrorMessage2 NVARCHAR(3000) = 'Wrong email format';
		THROW 51000, @ErrorMessage2, 1;
	END
END

------------------------------------- rider sign up trigger
CREATE TRIGGER Rider_Signup_Trigger
ON Rider_Signup
INSTEAD OF INSERT
AS
BEGIN
    -- Perform validation checks for each inserted row
    DECLARE @error_msg NVARCHAR(255);
    DECLARE @riderName VARCHAR(30);
    DECLARE @riderPassword VARCHAR(30);
    DECLARE @riderLicense VARCHAR(11);
    DECLARE @riderPhone VARCHAR(13);
    DECLARE @riderLocation VARCHAR(30);
    DECLARE @riderBalance FLOAT;
    DECLARE @riderRating FLOAT;
    DECLARE @riderTtlOrders INT;
	DECLARE @riderEmail VARCHAR(30)
 
    DECLARE rider_cursor CURSOR FOR
    SELECT rider_name, rider_password, rider_license, rider_phone, rider_location, rider_balance, rider_rating, rider_ttl_orders, rider_email FROM inserted;
 
    OPEN rider_cursor;
    FETCH NEXT FROM rider_cursor INTO @riderName, @riderPassword, @riderLicense, @riderPhone, @riderLocation, @riderBalance, @riderRating, @riderTtlOrders, @riderEmail;
 
    WHILE @@FETCH_STATUS = 0
    BEGIN
    	-- Check if the username already exists
    	IF EXISTS (SELECT 1 FROM Rider_Signup WHERE rider_license = @riderLicense)
    	BEGIN
        	SET @error_msg = 'License number already exists';
        	THROW 51000, @error_msg, 1;
        	RETURN;
    	END;
 
    	-- Perform password validation checks
    	IF LEN(@riderPassword) < 8 OR
       	@riderPassword NOT LIKE '%[A-Z]%' OR -- At least one uppercase letter
       	@riderPassword NOT LIKE '%[!@#$%^&*()-_+=]%' -- At least one special character
    	BEGIN
        	SET @error_msg = 'Password must be at least 8 characters long and contain at least one uppercase letter and one special character';
        	THROW 51000, @error_msg, 1;
        	RETURN;
    	END;
 
    	-- Perform License number format validation checks
    	IF LEN(@riderLicense) <> 11 OR @riderLicense NOT LIKE '[A-Z][A-Z]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]'
    	BEGIN
        	SET @error_msg = 'Invalid License number format. License number must be in the format AA-XX-XXXXX';
        	THROW 51000, @error_msg, 1;
        	RETURN;
    	END;
 
    	-- Perform phone number format validation checks
    	IF @riderPhone NOT LIKE '03[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
    	BEGIN
        	SET @error_msg = 'Invalid phone number format. Phone number must be in the format 03XZ-YYYYYYY.';
        	THROW 51000, @error_msg, 1;
        	RETURN;
    	END;
 
    	-- Insert the validated data into the Rider_Signup table
    	INSERT INTO Rider_Signup (rider_name, rider_password, rider_license, rider_phone, rider_location, rider_balance, rider_rating, rider_ttl_orders, rider_email)
    	VALUES (@riderName, @riderPassword, @riderLicense, @riderPhone, @riderLocation, @riderBalance, @riderRating, @riderTtlOrders, @riderEmail);
 
    	FETCH NEXT FROM rider_cursor INTO @riderName, @riderPassword, @riderLicense, @riderPhone, @riderLocation, @riderBalance, @riderRating, @riderTtlOrders, @riderEmail;
    END;
 
    CLOSE rider_cursor;
    DEALLOCATE rider_cursor;
END;

-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------menu procedures----------------------------------
-- Updating menu item
CREATE PROCEDURE updateMenu
@nameItem varchar(30), @itemID int, @categ varchar(30), @itemdescr text, @priceItem float 
AS
BEGIN
	IF(EXISTS(SELECT * FROM Restaurant_Menu WHERE menu_id = @itemID))
	BEGIN
		UPDATE Restaurant_Menu
		SET 
		Category = @categ,
		item_name = @nameItem,
		item_description = @itemdescr,
		item_price = @priceItem
		WHERE menu_id = @itemID;
	END
	ELSE
	BEGIN
		DECLARE @ErrorMessage NVARCHAR(4000) = 'Could not find the menu item';
		THROW 51000, @ErrorMessage, 1;
	END
END

--Remove Menu Items
CREATE PROCEDURE Remove_Menu_Item (
    @p_MenuID INT
)
AS
BEGIN
    IF(EXISTS(SELECT * FROM Restaurant_Menu WHERE menu_id= @p_MenuID))
	BEGIN
		DELETE FROM Restaurant_Menu WHERE menu_id= @p_MenuID;
	END
	ELSE
	BEGIN
		DECLARE @ErrorMessage NVARCHAR(4000) = 'Could not find the menu item';
		THROW 51000, @ErrorMessage, 1;
	END
END;

--Add menu items
CREATE PROCEDURE Add_Menu_Item(
	@nameItem varchar(30), @categ varchar(30), @descrItem text, @priceItem float, @restID int 
)
AS
BEGIN
	INSERT INTO Restaurant_Menu(rest_id, Category, item_name, item_description, item_price)
	VALUES (@restID, @categ, @nameItem, @descrItem, @priceItem);

END

----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------Orders------------------------------------
---------------------------fetch orders
CREATE PROCEDURE GetOrders
	@restID INT
AS
BEGIN
    SELECT *
    FROM Orders WHERE rest_id = @restID;
END;

----------------------------fetch orders for a given order_id
CREATE PROCEDURE GetOrderItems
    @order_id INT
AS
BEGIN
    SELECT *
    FROM Order_Items
    WHERE order_id = @order_id;
END;

------------------------------------------------------------------------
-------------------------------------------------------------------------
--------------------------Customer pov
Create PROCEDURE GetRestaurantMenu
    @CustomerID INT
AS
BEGIN
    DECLARE @CustomerLocation VARCHAR(30);
    DECLARE @CustomerLocationPrefix VARCHAR(30);
    
    SELECT @CustomerLocation = Cust_location FROM Customer_Signup WHERE Cust_id = @CustomerID;

    SET @CustomerLocationPrefix = LEFT(@CustomerLocation, CHARINDEX(':', @CustomerLocation + ':') - 1);

    SELECT 
        RM.menu_id,
        R.rest_name AS Restaurant_Name,
        RM.Category,
        RM.item_name,
        RM.item_description,
        RM.item_price
    FROM 
        Restaurant_Menu RM
    INNER JOIN 
        Restaurant R ON RM.rest_id = R.rest_id
    WHERE
        LEFT(R.rest_location, CHARINDEX(':', R.rest_location + ':') - 1) = @CustomerLocationPrefix;
END;

----------------------------------------------------

CREATE PROCEDURE Add_To_Cart(
    @p_cust_id INT,
    @p_menuID INT,
    @p_quantity INT
)
AS
BEGIN
    INSERT INTO Cart (Cust_id, menu_id, quantity, total_price)
    VALUES (@p_cust_id, @p_menuID, @p_quantity, (SELECT item_price * @p_quantity FROM Restaurant_Menu WHERE menu_id = @p_menuID));
END;
-----------------------------------------------------------------------------------------------
--Calculate Cart Total
CREATE PROCEDURE CalculateCartTotal
    @CustId INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalPrice FLOAT;

    SELECT @TotalPrice = SUM(total_price)
    FROM Cart
    WHERE Cust_id = @CustId;

    SELECT @TotalPrice AS TotalPrice;
END

-----------------------------------------------------------------------------------------------
CREATE PROCEDURE GetCartInfo
    @Cust_id INT
AS
BEGIN
    SELECT C.cart_id AS CartId,
           RM.item_name AS MenuItemName,
           C.quantity AS Quantity,
           C.total_price AS TotalPrice
    FROM Cart AS C
    INNER JOIN Restaurant_Menu AS RM ON C.menu_id = RM.menu_id
    WHERE C.Cust_id = @Cust_id;
END;
------------------------------------------------------------------------------------------
Create PROCEDURE [dbo].[deleteCart]
@ID int
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM Cart WHERE cart_id = @ID
END
-------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[UpdateQuantity]
@Quantity int, @CartID int
AS
BEGIN SET NOCOUNT ON;
Update Cart set quantity=@Quantity
where cart_id=@CartID;
END
-------------------------------------------------------------------------------------------------------
CREATE PROCEDURE GetRidersByCustomerLocation
    @CustID INT
AS
BEGIN
    DECLARE @CustomerLocationPrefix VARCHAR(30)
    SELECT @CustomerLocationPrefix = LEFT(Cust_location, CHARINDEX(':', Cust_location + ':') - 1)
    FROM Customer_Signup
    WHERE Cust_id = @CustID

    SELECT *
    FROM Rider_Signup
    WHERE LEFT(rider_location, CHARINDEX(':', rider_location + ':') - 1) = @CustomerLocationPrefix
END;

---------------------------------------------------------------------------
CREATE PROCEDURE GetOrdersCustomers(
	@custID INT
)
AS
BEGIN
	SELECT O.order_id, O.order_total, O.order_status, R.rest_name
	FROM Orders O JOIN Restaurant R ON O.rest_id = R.rest_id
	WHERE O.Cust_id = @custID;
END

----------------------------------------------------------------------------
CREATE PROCEDURE GetOrderItemsCustomers(
	@orderID INT
)
AS
BEGIN
	SELECT M.Category, M.item_name, O.item_qty
	FROM Order_Items O JOIN Restaurant_Menu M ON O.menu_id = M.menu_id
	WHERE O.order_id = @orderID;
END

drop procedure GetOrderItemsCustomers

------------------------------------------------------------------------
-------------------------------------------------------------------------
--------------------------Rider pov
CREATE PROCEDURE GetRiderOrders(
	@riderID INT
)
AS
BEGIN
	SELECT O.order_id, O.order_status, O.order_total, C.Cust_Name, C.Cust_location, R.rest_name, R.rest_location 
	FROM Orders O JOIN Restaurant R ON O.rest_id = R.rest_id
	JOIN Customer_Signup C ON C.Cust_id = O.Cust_id
	WHERE O.rider_id = 1;
END





--match locations of restaurant and customer
CREATE PROCEDURE matchLocationRestCustomer
@custID int
AS
BEGIN
	DECLARE @location varchar(30)
	SELECT @location = Cust_location FROM Customer_Signup WHERE Cust_id = @custID;
	SELECT rest_name, rest_password, rest_description, rest_email FROM Restaurant WHERE rest_location = @location;
END

drop procedure matchLocationRestCustomer
-- match locations of restaurant and rider
CREATE PROCEDURE matchLocationRestRider
@restID int
AS
BEGIN
	DECLARE @location varchar(30)
	SELECT @location = rest_location FROM Restaurant WHERE rest_id = @restID;
	SELECT * FROM Rider_Signup WHERE rider_location = @location;
END

-- add rider payment
CREATE PROCEDURE addRiderPayment
@completedOrderID int, @riderid int
AS
BEGIN
	DECLARE @orderTotal float
	SELECT @orderTotal = Order_Total FROM Orders WHERE order_id = @completedOrderID AND rider_id = @riderid
	DECLARE @riderPayment float
	SET @riderPayment = @orderTotal * 0.1
	UPDATE Rider_Signup
	SET rider_balance = rider_balance + @riderPayment
	WHERE rider_id = @riderid 
END

EXEC addRiderPayment
@completedOrderID = 5, @riderid = 1

SELECT * FROM Rider_Signup

---------------------------------------triggers
-- does not allow dropping or altering tables laiba
CREATE TRIGGER dbSecurity
ON DATABASE
FOR DROP_TABLE, ALTER_TABLE
AS
	ROLLBACK;



------------------- Add restaurant account


---------------------------------------------
-------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------




---------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------

CREATE PROCEDURE Add_To_Cart(
    @p_cust_id INT,
    @p_menuID INT,
    @p_quantity INT
)
AS
BEGIN
    INSERT INTO Cart (Cust_id, menu_id, quantity, total_price)
    VALUES (@p_cust_id, @p_menuID, @p_quantity, (SELECT item_price * @p_quantity FROM Restaurant_Menu WHERE menu_id = @p_menuID));
END;
----------------------------------------------------------------------------------------
--Cancel order
CREATE PROCEDURE Cancel_Order(
    @p_orderID INT
)
AS
BEGIN
    DECLARE @menu_id INT;

    -- Get the menu_id of the canceled order
    SELECT @menu_id = menu_id 
    FROM Order_Items
    WHERE order_id = @p_orderID;

    -- Delete the order
    DELETE FROM Orders WHERE order_id = @p_orderID;
END;
---------------------------------------------------------------------------------------
--Place Order NOT Working
CREATE PROCEDURE Place_Order (
    @p_Username VARCHAR(30),
    @p_MenuID INT,
    @p_OrderItems INT,
    @p_OrderID INT OUTPUT
)
AS
BEGIN
    DECLARE @total_price FLOAT;
    
    SELECT @total_price = item_price * @p_OrderItems 
    FROM Restaurant_Menu
    WHERE menu_id = @p_MenuID;
    
    INSERT INTO Orders (menu_id, item_qty, Order_Total, Cust_id)
    VALUES (@p_MenuID, @p_OrderItems, @total_price, @p_Username);
    
    SET @p_OrderID = SCOPE_IDENTITY();
END

---------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--match locations of restaurant and customer
CREATE PROCEDURE matchLocationRestCustomer
@custID int
AS
BEGIN
	DECLARE @location varchar(30)
	SELECT @location = Cust_location FROM Customer_Signup WHERE Cust_id = @custID;
	SELECT rest_name, rest_password, rest_description, rest_email FROM Restaurant WHERE rest_location = @location;
END
---------------------------------------------------------------------------------------
-- match locations of restaurant and rider
CREATE PROCEDURE matchLocationRestRider
@restID int
AS
BEGIN
	DECLARE @location varchar(30)
	SELECT @location = rest_location FROM Restaurant WHERE rest_id = @restID;
	SELECT * FROM Rider_Signup WHERE rider_location = @location;
END
--------------------------------------------------------------------------------
-- add rider payment
CREATE PROCEDURE addRiderPayment
@completedOrderID int, @riderid int
AS
BEGIN
	DECLARE @orderTotal float
	SELECT @orderTotal = Order_Total FROM Orders WHERE order_id = @completedOrderID AND rider_id = @riderid
	DECLARE @riderPayment float
	SET @riderPayment = @orderTotal * 0.1
	UPDATE Rider_Signup
	SET rider_balance = rider_balance + @riderPayment
	WHERE rider_id = @riderid 
END

--------------------------------------------------------------------------------
-- DELETE ACCOUNT ADMIN
CREATE PROCEDURE Delete_Account
    @account_type VARCHAR(15),  -- Specify the type of account to be deleted (e.g., 'Customer', 'Restaurant', 'Rider')
    @account_id INT             -- Specify the ID of the account to be deleted
AS
BEGIN
    IF @account_type = 'Customer'
    BEGIN
        DELETE FROM Customer_Signup WHERE Cust_id = @account_id;
        PRINT 'Customer account deleted successfully.';
    END
    ELSE IF @account_type = 'Restaurant'
    BEGIN
        DELETE FROM Restaurant WHERE rest_id = @account_id;
        PRINT 'Restaurant account deleted successfully.';
    END
    ELSE IF @account_type = 'Rider'
    BEGIN
        DELETE FROM Rider_Signup WHERE rider_id = @account_id;
        PRINT 'Rider account deleted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Invalid account type. Please specify either "Customer", "Restaurant", or "Rider".';
    END
END;
---------------------------------------------------------
