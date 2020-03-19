---- --------------------------------------------------------------------------------
---- Name: Lance Brown
---- Class: IT-111
---- Abstract: Assignment 16
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
IF OBJECT_ID ('TStates')		IS NOT NULL DROP TABLE TStates
IF OBJECT_ID ('TGenders')		IS NOT NULL DROP TABLE TGenders
IF OBJECT_ID ('TRaces')			IS NOT NULL DROP TABLE TRaces





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
	,intStateID 		INTEGER 			NOT NULL
	,strZip				VARCHAR(225)		NOT NULL
	,intGenderID 		INTEGER 			NOT NULL
	,intRaceID 			INTEGER 			NOT NULL
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
	,intStateID 		INTEGER 			NOT NULL
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
CREATE TABLE TStates
(
	 intStateID			INTEGER				NOT NULL
	,strStateAbbrv		VARCHAR(255)		NOT NULL
	,strStateLong		VARCHAR(255)		NOT NULL
	,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID )
)
CREATE TABLE TGenders
(
	 intGenderID		INTEGER 			NOT NULL
	,strGender			VARCHAR(255)		NOT NULL
	,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID )
)
CREATE TABLE TRaces
(
	 intRaceID			INTEGER 			NOT NULL
	,strRace 			VARCHAR(255)		NOT NULL
	,CONSTRAINT TRaces_PK PRIMARY KEY ( intRaceID )
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

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TStates_FK1
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )


ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TGenders_FK1
FOREIGN KEY ( intGenderID ) REFERENCES TGenders ( intGenderID )


ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TRaces_FK1
FOREIGN KEY ( intRaceID ) REFERENCES TRaces ( intRaceID )

ALTER TABLE TVendors ADD CONSTRAINT TVendors_TStates_FK1
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )
-- --------------------------------------------------------------------------------
--	Add Sample Data - INSERTS
-- --------------------------------------------------------------------------------
INSERT into TStates( intStateID, strStateAbbrv, strStateLong)
VALUES 					(1, 'AL', 'Alabama')
						,(2,'AK', 'Alaska')
						,(3,'AL', 'Alabama')
						,(4,'AZ', 'Arizona')
						,(5,'AR', 'Arkansas')
						,(6,'CA', 'California')
						,(7,'CO', 'Colorado')
						,(8,'CT', 'Connecticut')
						,(9,'DE', 'Delaware')
						,(10,'DC', 'District of Columbia')
						,(11,'FL', 'Florida')
						,(12,'GA', 'Georgia')
						,(13,'HI', 'Hawaii')
						,(14,'ID', 'Idaho')
						,(15,'IL', 'Illinois')
						,(16,'IN', 'Indiana')
						,(17,'IA', 'Iowa')
						,(18,'KS', 'Kansas')
						,(19,'KY', 'Kentucky')
						,(20,'LA', 'Louisiana')
						,(21,'ME', 'Maine')
						,(22,'MD', 'Maryland')
						,(23,'MA', 'Massachusetts')
						,(24,'MI', 'Michigan')
						,(25,'MN', 'Minnesota')
						,(26,'MS', 'Mississippi')
						,(27,'MO', 'Missouri')
						,(28,'MT', 'Montana')
						,(29,'NE', 'Nebraska')
						,(30,'NV', 'Nevada')
						,(31,'NH', 'New Hampshire')
						,(32,'NJ', 'New Jersey')
						,(33,'NM', 'New Mexico')
						,(34,'NY', 'New York')
						,(35,'NC', 'North Carolina')
						,(36,'ND', 'North Dakota')
						,(37,'OH', 'Ohio')
						,(38,'OK', 'Oklahoma')
						,(39,'OR', 'Oregon')
						,(40,'PA', 'Pennsylvania')
						,(41,'PR', 'Puerto Rico')
						,(42,'RI', 'Rhode Island')
						,(43,'SC', 'South Carolina')
						,(44,'SD', 'South Dakota')
						,(45,'TN', 'Tennessee')
						,(46,'TX', 'Texas')
						,(47,'UT', 'Utah')
						,(48,'VT', 'Vermont')
						,(49,'VA', 'Virginia')
						,(50,'WA', 'Washington')
						,(51,'WV', 'West Virginia')
						,(52,'WI', 'Wisconsin')
						,(53,'WY', 'Wyoming')

INSERT INTO TGenders( intGenderID, strGender)
VALUES 					(1, 'Female')
						,(2, 'Male')
						,(3, 'Other')
INSERT INTO TRaces( intRaceID, strRace)
VALUES					(1, 'African-American')
						,(2, 'Asian')
						,(3, 'Caucasian')
						,(4, 'Hispanic')
						,(5, 'Native American')
						
INSERT INTO TCustomers (intCustomerID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, intGenderID, intRaceID, dtmDateOfBirth)
VALUES				  (1, 'Had', 'Vedeshkin', '8770 Arapahoe Crossing', 'Madison', 52, '53779', 2, 5, '8/12/1920')
					 ,(2, 'Pearline', 'Beenham', '7 Warbler Road', 'Memphis', 45, '38136', 1, 4, '6/23/2001')
					 ,(3, 'Willie', 'Medforth', '217 Rusk Place', 'Norfolk', 49, '23551', 2, 2, '3/24/1909')
					 ,(4, 'Katti', 'Stribling', '23929 Knutson Drive', 'Peoria', 15, '61605', 1, 3, '11/17/2000')
					 ,(5, 'Roley', 'Maud', '4626 Schmedeman Terrace', 'Saint Paul', 25, '55115', 2, 1, '4/15/1999')



INSERT INTO TOrders	(intOrderID, intCustomerID, strOrderNumber, dtmOrderDate, strStatus)
VALUES				  (1, 3, '123123',		'9/13/2019', 'Complete')
					 ,(2, 5, '9263494',		'3/9/2017', 'Pending')
					 ,(3, 5, '92342023',	'2/1/2020', 'Canceled')

INSERT INTO TVendors(intVendorID, strVendorName, strAddress, strCity, intStateID, strZip, strContactFirst, strContactLast, strContactPhone, strContactEmail)
VALUES				 (1, 'Tromp, Nolan and Walker', '97 Autumn Leaf Point', 'Minneapolis', 25, '55417', 'Arlee', 'Smeath', '651-398-9752', 'asmeath0@clickbank.net')
					,(2, 'Heidenreich-Prohaska', '44 Trailsway Place', 'Charlotte', 35, '28263', 'Margot', 'Hulland', '704-720-6544', 'mhulland1@liveinternet.ru')
					,(3, 'Heaney Group', '708 Summerview Street', 'Muskegon', 24, '49444', 'Letisha', 'Guterson', '231-991-0427', 'lguterson2@utexas.edu')

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


-- ------------------------------------------------------------------
-- Explicit Joins
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
-- Step 1 Customer names, order dates and products ordered by customer and date
-- ------------------------------------------------------------------
SELECT 
	TC.strFirstName
	,TC.strLastName
	,TOR.dtmOrderDate
	,TP.strName

FROM TCustomers as TC
	JOIN TOrders as TOR
		ON TC.intCustomerID = TOR.intCustomerID
	JOIN TOrderProducts as TORP
		ON TORP.intOrderID = TOR.intOrderID
	JOIN TProducts as TP
		ON TP.intProductID = TORP.intProductID
ORDER BY
	TC.intCustomerID
	,TOR.dtmOrderDate
-- ------------------------------------------------------------------
-- Step 2 show all products ordered by vendor name and product category and retail price descending
-- ------------------------------------------------------------------
SELECT 
	TP.strName
	,TV.strVendorName
	,TP.strCategory
	,TP.decPrice

FROM TProducts as TP
	JOIN TVendors as TV
		ON TV.intVendorID = TP.intVendorID
ORDER BY
	TV.strVendorName
	,TP.strCategory
	,TP.decPrice DESC
-- ------------------------------------------------------------------
-- Step 3 all products and inventory and vendors name and contact info for products with inventory less than 10
-- ------------------------------------------------------------------
SELECT 
	TP.strName
	,TP.intInventory
	,TV.strVendorName
	,TV.strContactFirst
	,TV.strContactLast
	,TV.strContactEmail
	,TV.strContactPhone
	

FROM TProducts as TP
	JOIN TVendors as TV
		ON TV.intVendorID = TP.intVendorID
WHERE TP.intInventory < 10
-- ------------------------------------------------------------------
-- Step 4 products from orders by males over 21 ordered by race
-- ------------------------------------------------------------------
SELECT 
	TC.strFirstName
	,TC.strLastName
	,TR.strRace
	,TOR.dtmOrderDate
	,TP.strName

FROM TCustomers as TC
	JOIN TRaces as TR
		ON TR.intRaceID = TC.intRaceID
	JOIN TGenders as TG
		ON TG.intGenderID = TC.intGenderID
	JOIN TOrders as TOR
		ON TC.intCustomerID = TOR.intCustomerID
	JOIN TOrderProducts as TORP
		ON TORP.intOrderID = TOR.intOrderID
	JOIN TProducts as TP
		ON TP.intProductID = TORP.intProductID
WHERE TG.strGender = 'Male'
	AND	TC.dtmDateOfBirth > 03/18/1999
ORDER BY
	TC.intRaceID

-- ------------------------------------------------------------------
-- Step 5 vendors with ordered products ordered by state
-- ------------------------------------------------------------------
SELECT 
	TV.strVendorName
	,TS.strStateAbbrv

FROM TCustomers as TC
	JOIN TStates as TS
		ON TS.intStateID = TC.intStateID
	JOIN TOrders as TOR
		ON TOR.intCustomerID = TC.intCustomerID
	JOIN TOrderProducts as TORP
		ON TORP.intOrderID = TOR.intOrderID
	JOIN TProducts as TP
		ON TP.intProductID = TP.intProductID
	JOIN TVendors as TV
		ON TV.intVendorID = TV.intVendorID
ORDER BY
	TS.strStateAbbrv