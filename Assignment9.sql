---- --------------------------------------------------------------------------------
---- Name: Lance Brown
---- Class: IT-111
---- Abstract: Assignment 9
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

IF OBJECt_ID ('TCustomerSongs')	IS NOT NULL DROP TABLE TCustomerSongs
IF OBJECt_ID ('TCustomers')		IS NOT NULL DROP TABLE TCustomers
IF OBJECt_ID ('TSongs')			IS NOT NULL DROP TABLE TSongs
IF OBJECt_ID ('TArtists')		IS NOT NULL DROP TABLE TArtists


---- --------------------------------------------------------------------------------
---- Create table 
---- --------------------------------------------------------------------------------

CREATE TABLE TStates
(
	 intStateID			INTEGER				NOT NULL
	,strStateAbbrv		VARCHAR(255)		NOT NULL
	,strStateLong		VARCHAR(255)		NOT NULL
	,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID )
)
CREATE TABLE TGender
(
	 intGenderID		INTEGER 			NOT NULL
	,strGender			VARCHAR(255)		NOT NULL
	,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID )
)
CREATE TABLE TRace
(
	 intRaceID			INTEGER 			NOT NULL
	,strRace 			VARCHAR(255)		NOT NULL
	,CONSTRAINT TRaces_PK PRIMARY KEY ( intRaceID )
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

CREATE TABLE TSongs
(
	 intSongID				INTEGER				NOT NULL
	,intArtistID			INTEGER				NOT NULL
	,strName				VARCHAR(225)		NOT NULL
	,dtmDateRecorded		DATETIME			NOT NULL
	,strGenre				VARCHAR(225)		NOT NULL
	,strRecordLabel			VARCHAR(225)		NOT NULL
	,CONSTRAINT TSongs_PK PRIMARY KEY ( intSongID )
)

CREATE TABLE TArtists
(
	 intArtistID			INTEGER			NOT NULL
	,strName				VARCHAR(225)	NOT NULL
	,CONSTRAINT TArtists_PK PRIMARY KEY ( intArtistID )
)
CREATE TABLE TCustomerSongs
(
	 intCustomerSongID		INTEGER			NOT NULL
	,intCustomerID			INTEGER			NOT NULL
	,intSongID				INTEGER			NOT NULL
	,CONSTRAINT TCustomerSongs_PK PRIMARY KEY ( intCustomerSongID )
)
-- --------------------------------------------------------------------------------
-- Create relationships. Foreign Keys
-- --------------------------------------------------------------------------------


-- 1
ALTER TABLE TSongs ADD CONSTRAINT TSongs_TArtists_FK1
FOREIGN KEY ( intArtistID ) REFERENCES TArtists ( intArtistID )

-- 2
ALTER TABLE TCustomerSongs ADD CONSTRAINT TCustomerSongs_TSongs_FK1
FOREIGN KEY ( intSongID ) REFERENCES TSongs ( intSongID )

-- 3
ALTER TABLE TCustomerSongs ADD CONSTRAINT TCustomerSongs_TCustomers_FK1
FOREIGN KEY ( intCustomerID ) REFERENCES TCustomers ( intCustomerID )

-- 4
ALTER TABLE TCustomers ADD CONSTRAINT TStates_TCustomers_FK1
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

-- 5
ALTER TABLE TCustomers ADD CONSTRAINT TGenders_TCustomers_FK1
FOREIGN KEY ( intGenderID ) REFERENCES TGenders ( intGenderID )

--6
ALTER TABLE TCustomers ADD CONSTRAINT TRaces_TCustomers_FK1
FOREIGN KEY ( intRaceID ) REFERENCES TRaces ( intRaceID )
-- --------------------------------------------------------------------------------
-- Add Sample Data - INSERTS
-- --------------------------------------------------------------------------------

INSERT INTO TArtists( intArtistID, strName)
VALUES					   (1, 'Frank Zappa')
						  ,(2, 'Dweezl Zappa')
						  ,(3, 'Wolfgang Amadeus Mozart')

INSERT into TStates
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

INSERT INTO TCustomers (intCustomerID, strFirstName, strLastName, strAddress, strCity, strState, strZip, strGender, strRace, dtmDateOfBirth)
VALUES				  (1, 'Had', 'Vedeshkin', '8770 Arapahoe Crossing', 'Madison', 'WI', '53779', 'Male', 'Kiowa', '8/12/1920')
					 ,(2, 'Pearline', 'Beenham', '7 Warbler Road', 'Memphis', 'TN', '38136', 'Female', 'Latin American Indian', '6/23/2001')
					 ,(3, 'Willie', 'Medforth', '217 Rusk Place', 'Norfolk', 'VA', '23551', 'Male', 'Japanese', '3/24/1909')
					 ,(4, 'Katti', 'Stribling', '23929 Knutson Drive', 'Peoria', 'IL', '61605', 'Female', 'Navajo', '11/17/2000')
					 ,(5, 'Roley', 'Maud', '4626 Schmedeman Terrace', 'Saint Paul', 'MN', '55115', 'Male', 'Cuban', '4/15/1999')

INSERT INTO TSongs ( intSongID, intArtistID, strName, dtmDateRecorded, strGenre, strRecordLabel)
VALUES				 ( 1, 2, 'Escape Character', '9/13/2019', 'Electronica', 'Apple Records')
					,( 2, 2, 'Backslash', '1/13/2018', 'Metal', 'Geffen')
					,( 3, 1, 'Data Entry', '3/4/1990', 'Experimental Jazz', 'Independent')
					,( 4, 3, 'Creativity fails me', '4/9/1999', 'Pop', 'Record Records')


INSERT INTO TCustomerSongs ( intCustomerSongID, intCustomerID, intSongID)
VALUES						( 1, 1, 1)
						   ,( 2, 3, 2)
						   ,( 3, 2, 3)
						   ,( 4, 4, 2)
						   ,( 5, 5, 1)

SELECT * FROM TCustomers
SELECT * FROM TSongs
SELECT * FROM TArtists
SELECT * FROM TCustomerSongs


-- ---------------------------------------------------------------------
-- Select JOINS 
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
-- Select All Customers song info
-- ---------------------------------------------------------------------
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
	,TS.strName
	,TS.strGenre
	,TS.strRecordLabel
	,TA.strName
FROM 
	TCustomers AS TC
	,TCustomerSongs AS TCS
	,TSongs AS TS
	,TArtists AS TA
WHERE TC.intCustomerID = TCS.intCustomerID
AND TCS.intSongID = TS.intSongID
AND TS.intArtistID = TA.intArtistID
-----------------------------
-- Select by customer last name
-----------------------------
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
	,TS.strName
	,TS.strGenre
	,TS.strRecordLabel
	,TS.dtmDateRecorded
	,TA.strName
FROM 
	TCustomers AS TC
	,TCustomerSongs AS TCS
	,TSongs AS TS
	,TArtists AS TA
WHERE TC.intCustomerID = TCS.intCustomerID
AND TCS.intSongID = TS.intSongID
AND TS.intArtistID = TA.intArtistID
AND TC.strLastName = 'Maud'

-- --------------------------------
-- Select artists
-----------------------------------
SELECT
	TA.strName
	,TS.strName
	,TS.strGenre
	,TS.strRecordLabel
	,TS.dtmDateRecorded
FROM
	TArtists as TA
	,TSongs as TS
WHERE TA.intArtistID = TS.intArtistID

-----------------------------
-- Select by date recorded
-----------------------------
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
	,TS.strName
	,TS.strGenre
	,TS.strRecordLabel
	,TA.strName
FROM 
	TCustomers AS TC
	,TCustomerSongs AS TCS
	,TSongs AS TS
	,TArtists AS TA
WHERE TC.intCustomerID = TCS.intCustomerID
AND TCS.intSongID = TS.intSongID
AND TS.intArtistID = TA.intArtistID
AND TS.dtmDateRecorded > '2000-01-01'