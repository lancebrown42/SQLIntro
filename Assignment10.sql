---- --------------------------------------------------------------------------------
---- Name: Lance Brown
---- Class: IT-111
---- Abstract: Assignment 10
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Options
---- --------------------------------------------------------------------------------
USE dbSQL1;     -- Get out of the master database
SET NOCOUNT ON; -- Report only errors

---- --------------------------------------------------------------------------------
----						Problem #1
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Create drop table
---- --------------------------------------------------------------------------------

---- Drop Table Statements

IF OBJECT_ID ('TOrderProducts')	IS NOT NULL DROP TABLE TOrderProducts
IF OBJECT_ID ('TOrders')		IS NOT NULL DROP TABLE TOrders
IF OBJECT_ID ('TCustomers')		IS NOT NULL DROP TABLE TCustomers
IF OBJECT_ID ('TProducts')		IS NOT NULL DROP TABLE TProducts
IF OBJECT_ID ('TVendors')		IS NOT NULL DROP TABLE TVendors





---- --------------------------------------------------------------------------------
----	Create table 
---- --------------------------------------------------------------------------------
CREATE TABLE TOrders
(
	 intOrderID			INTEGER				NOT NULL
	,intCustomerID		INTEGER				NOT NULL
	,strOrderNumber		VARCHAR(225)		NOT NULL
	,dtmOrderDate		DATETIME			NOT NULL
	,strStatus			VARCHAR(225)		NOT NULL
	,CONSTRAINT TOrders_PK PRIMARY KEY ( intOrderID )
)

CREATE TABLE TCustomers
(
	 intCustomerID		INTEGER				NOT NULL
	,strFirstName		VARCHAR(225)		NOT NULL
	,strLastName		VARCHAR(225)		NOT NULL
	,strAddress			VARCHAR(225)		NOT NULL
	,strCity			VARCHAR(225)		NOT NULL
	,strState			VARCHAR(225)		NOT NULL
	,strZip				VARCHAR(225)		NOT NULL
	,strGender			VARCHAR(225)		NOT NULL
	,strRace			VARCHAR(225)		NOT NULL
	,dtmDateOfBirth		DATETIME			NOT NULL
	,CONSTRAINT TCustomers_PK PRIMARY KEY ( intCustomerID )
)


CREATE TABLE TProducts
(
	 intProductID		INTEGER			NOT NULL
	,intVendorID		INTEGER			NOT NULL
	,strName			VARCHAR(225)	NOT NULL
	,decCost			DECIMAL			NOT NULL
	,decPrice			DECIMAL			NOT NULL
	,strCategory		VARCHAR(255)	NOT NULL
	,intInventory		INTEGER			NOT NULL
	,CONSTRAINT TProducts_PK PRIMARY KEY ( intProductID )
)
CREATE TABLE TVendors
(
	intVendorID			INTEGER				NOT NULL
	,strVendorName		VARCHAR(225)		NOT NULL
	,strAddress			VARCHAR(225)		NOT NULL
	,strCity			VARCHAR(225)		NOT NULL
	,strState			VARCHAR(225)		NOT NULL
	,strZip				VARCHAR(225)		NOT NULL
	,strContactFirst	VARCHAR(225)		NOT NULL
	,strContactLast		VARCHAR(225)		NOT NULL
	,strContactPhone	VARCHAR(225)		NOT NULL
	,strContactEmail	VARCHAR(225)		NOT NULL
	,CONSTRAINT TVendors_PK PRIMARY KEY ( intVendorID )
	
)

CREATE TABLE TOrderProducts
(
	intOrderProductID	INTEGER				NOT NULL
	,intOrderID			INTEGER				NOT NULL
	,intProductID		INTEGER				NOT NULL
	,CONSTRAINT TOrderProducts_PL PRIMARY KEY ( intOrderProductID )
)
-- --------------------------------------------------------------------------------
--	Create relationships. Foreign Keys
-- --------------------------------------------------------------------------------
ALTER TABLE TProducts ADD CONSTRAINT TProducts_TVendors_FK1
FOREIGN KEY ( intVendorID ) REFERENCES TVendors ( intVendorID )

ALTER TABLE TOrders ADD CONSTRAINT TOrders_TCustomers_FK1
FOREIGN KEY ( intCustomerID ) REFERENCES TCustomers ( intCustomerID )

ALTER TABLE TOrderProducts ADD CONSTRAINT TOrderProducts_TOrders_FK1
FOREIGN KEY ( intOrderID ) REFERENCES TOrders ( intOrderID )

ALTER TABLE TOrderProducts ADD CONSTRAINT TOrderProducts_TProducts_FK1
FOREIGN KEY ( intProductID ) REFERENCES TProducts ( intProductID )

-- --------------------------------------------------------------------------------
--	Add Sample Data - INSERTS
-- --------------------------------------------------------------------------------

INSERT INTO TCustomers (intCustomerID, strFirstName, strLastName, strAddress, strCity, strState, strZip, strGender, strRace, dtmDateOfBirth)
VALUES				  (1, 'Had', 'Vedeshkin', '8770 Arapahoe Crossing', 'Madison', 'WI', '53779', 'Male', 'Kiowa', '8/12/1920')
					 ,(2, 'Pearline', 'Beenham', '7 Warbler Road', 'Memphis', 'TN', '38136', 'Female', 'Latin American Indian', '6/23/2001')
					 ,(3, 'Willie', 'Medforth', '217 Rusk Place', 'Norfolk', 'VA', '23551', 'Male', 'Japanese', '3/24/1909')
					 ,(4, 'Katti', 'Stribling', '23929 Knutson Drive', 'Peoria', 'IL', '61605', 'Female', 'Navajo', '11/17/2000')
					 ,(5, 'Roley', 'Maud', '4626 Schmedeman Terrace', 'Saint Paul', 'MN', '55115', 'Male', 'Cuban', '4/15/1999')

INSERT INTO TOrders	(intOrderID, intCustomerID, strOrderNumber, dtmOrderDate, strStatus)
VALUES				  (1, 3, '123123',		'9/13/2019', 'Complete')
					 ,(2, 5, '9263494',		'3/9/2017', 'Pending')
					 ,(3, 5, '92342023',	'2/1/2020', 'Canceled')

INSERT INTO TVendors(intVendorID, strVendorName, strAddress, strCity, strState, strZip, strContactFirst, strContactLast, strContactPhone, strContactEmail)
VALUES				 (1, 'Tromp, Nolan and Walker', '97 Autumn Leaf Point', 'Minneapolis', 'MN', '55417', 'Arlee', 'Smeath', '651-398-9752', 'asmeath0@clickbank.net')
					,(2, 'Heidenreich-Prohaska', '44 Trailsway Place', 'Charlotte', 'NC', '28263', 'Margot', 'Hulland', '704-720-6544', 'mhulland1@liveinternet.ru')
					,(3, 'Heaney Group', '708 Summerview Street', 'Muskegon', 'MI', '49444', 'Letisha', 'Guterson', '231-991-0427', 'lguterson2@utexas.edu')

INSERT INTO TProducts(intProductID, intVendorID, strName, decCost, decPrice, strCategory, intInventory)
VALUES				  (1, 3, 'Cheese', 0.1, 1, 'Food', 209)
					 ,(2, 2, 'Drill Bit', 0.01, 10, 'Tools', 74)
					 ,(3, 1, 'Ford Fiesta', 17003.93, 22000, 'Cars', 4)




INSERT INTO TOrderProducts(intOrderProductID, intOrderID, intProductID)
VALUES				 (1, 3, 2)
					,(2, 2, 3)
					,(3, 1, 1)
					,(4, 1, 2)
					,(5, 1, 3)

SELECT * FROM TCustomers
SELECT * FROM TOrders
SELECT * FROM TProducts
SELECT * FROM TVendors
SELECT * FROM TOrderProducts
-- ------------------------------------------------------------------
-- Select joins
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
-- Select all customers and their orders
-- ------------------------------------------------------------------
SELECT 
		TC.strFirstName
		,TC.strLastName
		,TC.strAddress
		,TC.strCity
		,TC.strState
		,TC.strZip
		,TC.strGender
		,TC.strRace
		,TC.dtmDateOfBirth
		,TOR.strOrderNumber
		,TOR.dtmOrderDate
FROM
		 TCustomers as TC
		,TOrders as TOR
WHERE
		TC.intCustomerID = TOR.intCustomerID

-- ------------------------------------------------------------------
-- Select customer by last name and their orders
-- ------------------------------------------------------------------
SELECT 
		TC.strFirstName
		,TC.strLastName
		,TC.strAddress
		,TC.strCity
		,TC.strState
		,TC.strZip
		,TC.strGender
		,TC.strRace
		,TC.dtmDateOfBirth
		,TOR.strOrderNumber
		,TOR.dtmOrderDate
FROM
		 TCustomers as TC
		,TOrders as TOR
WHERE
		TC.intCustomerID = TOR.intCustomerID
AND		TC.strLastName = 'Maud'
-- ------------------------------------------------------------------
-- Select customer by last name and their orders and products therein
-- ------------------------------------------------------------------
SELECT 
		TC.strFirstName
		,TC.strLastName
		,TC.strAddress
		,TC.strCity
		,TC.strState
		,TC.strZip
		,TC.strGender
		,TC.strRace
		,TC.dtmDateOfBirth
		,TOR.strOrderNumber
		,TOR.dtmOrderDate
		,TP.strName
		
FROM
		 TCustomers as TC
		,TOrders as TOR
		,TOrderProducts as TORP
		,TProducts as TP
WHERE
		TC.intCustomerID = TOR.intCustomerID
AND		TC.strLastName = 'Maud'
AND		TOR.intOrderID = TORP.intOrderID
AND		TORP.intProductID = TP.intProductID
-- ------------------------------------------------------------------
-- Select all vendors and all their products
-- ------------------------------------------------------------------
SELECT 
		TV.*
		,TP.strName

FROM
		TVendors as TV
		,TProducts as TP
WHERE
		TV.intVendorID = TP.intVendorID

-- ------------------------------------------------------------------
-- Select all vendors and all their products
-- ------------------------------------------------------------------
SELECT 
		TV.*
		,TP.strName

FROM
		TVendors as TV
		,TProducts as TP
WHERE
		TV.intVendorID = TP.intVendorID
AND		TV.strVendorName = 'Heaney Group'