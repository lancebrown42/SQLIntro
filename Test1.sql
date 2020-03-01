---- --------------------------------------------------------------------------------
---- Name: Lance Brown
---- Class: IT-111
---- Abstract: Test 1
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Options
---- --------------------------------------------------------------------------------
USE dbSQL1;     -- Get out of the master database
SET NOCOUNT ON; -- Report only errors

---- --------------------------------------------------------------------------------
----						Test 1
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Create drop table - Step 9
---- --------------------------------------------------------------------------------

---- Drop Table Statements

IF OBJECT_ID ('TPatients')		IS NOT NULL DROP TABLE TPatients
IF OBJECT_ID ('TDoctors')		IS NOT NULL DROP TABLE TDoctors
IF OBJECT_ID ('TNurses')		IS NOT NULL DROP TABLE TNurses
IF OBJECT_ID ('TVisits')		IS NOT NULL DROP TABLE TVisits
IF OBJECT_ID('TVisitNurses')	IS NOT NULL DROP TABLE TVisitNurses

---- --------------------------------------------------------------------------------
----	Create table - Step 9 and 10
---- --------------------------------------------------------------------------------
CREATE TABLE TPatients
(
	 intPatientID			INTEGER				NOT NULL
	,strFirstName			VARCHAR(255)		NOT NULL
	,strLastName			VARCHAR(255)		NOT NULL
	,dtmDOB					DATETIME			NOT NULL
	,strSSN					VARCHAR(255)		NOT NULL
	,strInsurance			VARCHAR(255)		NOT NULL
	,strPhone				VARCHAR(255)		NOT NULL
	,strEmail				VARCHAR(255)		NOT NULL
	,strEmergencyContact	VARCHAR(255)		NOT NULL
	,CONSTRAINT TPatients_PK PRIMARY KEY ( intPatientID )
)
CREATE TABLE TDoctors
(
	intDoctorID				INTEGER				NOT NULL
	,strFirstName			VARCHAR(255)		NOT NULL
	,strLastName			VARCHAR(255)		NOT NULL
	,dtmBoards				DATETIME			NOT NULL
	,strAddress				VARCHAR(255)		NOT NULL
	,strPhone				VARCHAR(255)		NOT NULL
	,strEmail				VARCHAR(255)		NOT NULL
)
CREATE TABLE TNurses
(
	intNurseID				INTEGER				NOT NULL
	,strFirstName			VARCHAR(255)		NOT NULL
	,strLastName			VARCHAR(255)		NOT NULL
	,dtmBoards				DATETIME			NOT NULL
	,strAddress				VARCHAR(255)		NOT NULL
	,strPhone				VARCHAR(255)		NOT NULL
	,strEmail				VARCHAR(255)		NOT NULL
)
CREATE TABLE TVisits
(
	intVisitID				INTEGER				NOT NULL
	,intPatientID			INTEGER 			NOT NULL
	,intDoctorID			INTEGER 			NOT NULL
	,dtmTime				DATETIME 			NOT NULL
	,strReason				VARCHAR(255)		NOT NULL
	,strDiagnosis			VARCHAR(255)		NOT NULL
	,CONSTRAINT TVisits_PK PRIMARY KEY ( intVisitID )
)
CREATE TABLE TVisitNurses
(
	intVisitNurseID		INTEGER				NOT NULL
	,intVisitID			INTEGER				NOT NULL
	,intNurseID			INTEGER				NOT NULL
	,CONSTRAINT TVisitNurses_PL PRIMARY KEY ( intVisitNurseID )
)
-- --------------------------------------------------------------------------------
--	Create relationships. Foreign Keys - Step 11
-- --------------------------------------------------------------------------------
ALTER TABLE TVisits ADD CONSTRAINT TVisits_TPatients_FK1
FOREIGN KEY ( intPatientID ) REFERENCES TPatients ( intPatientID )

ALTER TABLE TVisits ADD CONSTRAINT TVisits_TDoctors_FK1
FOREIGN KEY ( intDoctorID ) REFERENCES TDoctors ( intDoctorID )

ALTER TABLE TVisitNurses ADD CONSTRAINT TVisitNurses_TVisits_FK1
FOREIGN KEY ( intVisitID ) REFERENCES TVisits ( intVisitID )

ALTER TABLE TVisitNurses ADD CONSTRAINT TVisitNurses_TNurses_FK1
FOREIGN KEY ( intNurseID ) REFERENCES TNurses ( intNurseID )

-- --------------------------------------------------------------------------------
--	Add Sample Data - INSERTS - Step 12
-- --------------------------------------------------------------------------------
INSERT INTO TPatients (intPatientID, strFirstName, strLastName, dtmDOB, strSSN, strInsurance, strPhone, strEmail, strEmergencyContact) 
VALUES				 (1, 'Sylvan', 'Cosyns', '1/3/1970', '524-94-0926', 'Cartwright, MacGyver and Champlin', '850-665-0133', 'scosyns0@china.com.cn', 'Greg Cosyns');
					 (2, 'Sig', 'Combs', '4/3/1972', '488-59-4935', 'Will, Swaniawski and Haag', '387-738-5732', 'scombs1@google.com.br', 'Sean Combs');
					 (3, 'Hinze', 'Gorghetto', '3/20/1959', '341-62-0664', 'Koelpin, Wehner and Hettinger', '249-958-4640', 'hgorghetto2@google.de', 'Ralph Gorghetto');
					 (4, 'Inez', 'Santry', '8/27/1906', '123-46-5785', 'Dicki, Lowe and Fritsch', '930-128-0781', 'isantry3@mysql.com', 'Onez Santry');
					 (5, 'Andie', 'Toleman', '2/21/1976', '541-11-1169', 'Champlin and Sons', '642-137-5355', 'atoleman4@boston.com', 'Maria Toleman');