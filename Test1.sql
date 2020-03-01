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
VALUES				  (1, 'Sylvan', 'Cosyns', '1/3/1970', '524-94-0926', 'Cartwright, MacGyver and Champlin', '850-665-0133', 'scosyns0@china.com.cn', 'Greg Cosyns')
					 ,(2, 'Sig', 'Combs', '4/3/1972', '488-59-4935', 'Will, Swaniawski and Haag', '387-738-5732', 'scombs1@google.com.br', 'Sean Combs')
					 ,(3, 'Hinze', 'Gorghetto', '3/20/1959', '341-62-0664', 'Koelpin, Wehner and Hettinger', '249-958-4640', 'hgorghetto2@google.de', 'Ralph Gorghetto')
					 ,(4, 'Inez', 'Santry', '8/27/1906', '123-46-5785', 'Dicki, Lowe and Fritsch', '930-128-0781', 'isantry3@mysql.com', 'Onez Santry')
					 ,(5, 'Andie', 'Toleman', '2/21/1976', '541-11-1169', 'Champlin and Sons', '642-137-5355', 'atoleman4@boston.com', 'Maria Toleman')
INSERT INTO TDoctors (intDoctorID, strFirstName, strLastName, dtmBoards, strAddress, strPhone, strEmail) 
VALUES 				 (1, 'Shelia', 'McSkin', '9/30/1996', '6 Rutledge Court', '797-954-8306', 'smcskin0@paginegialle.it')
					,(2, 'Maximilianus', 'Poe', '7/21/1962', '2739 Amoth Point', '594-525-2064', 'mpoe1@sciencedaily.com')
					,(3, 'Verine', 'Choppen', '1/9/1982', '911 Summer Ridge Trail', '475-177-3555', 'vchoppen2@go.com')
					,(4, 'Wesley', 'Byrne', '8/16/1983', '23613 Muir Crossing', '941-847-5450', 'wbyrne3@chron.com')
					,(5, 'Gael', 'Leavy', '12/23/1956', '17 Porter Circle', '410-876-1555', 'gleavy4@clickbank.net')
INSERT INTO TNurses (intNurseID, strFirstName, strLastName, dtmBoards, strAddress, strPhone, strEmail)
VALUES				 (1, 'Micheal', 'Hansard', '6/28/1953', '3266 Mandrake Park', '584-261-6117', 'mhansard0@ebay.com')
					,(2, 'Delmore', 'Singyard', '8/17/1976', '94787 Nancy Court', '598-519-0118', 'dsingyard1@tmall.com')
					,(3, 'Karissa', 'Cappineer', '12/29/1994', '2 Maywood Trail', '453-477-8427', 'kcappineer2@ftc.gov')
					,(4, 'Florian', 'Philo', '11/25/1973', '34 Colorado Plaza', '964-601-3141', 'fphilo3@state.gov')
					,(5, 'Madelene', 'Peaurt', '10/20/1979', '46 Stone Corner Point', '282-306-3606', 'mpeaurt4@prweb.com')
INSERT INTO TVisits (intVisitID, intPatientID, intDoctorID, dtmTime, strReason, strDiagnosis) 
VALUES 				 (1, 1, 2, '2/15/1955', '4545 Roth Junction', '701-920-9322')
					,(2, 5, 4, '6/25/1979', '0 Longview Court', '208-414-9920')
					,(3, 4, 1, '2/12/1995', '34 Kedzie Avenue', '311-463-5298')
					,(4, 4, 2, '3/4/1963', '7 Rieder Trail', '763-896-0714')
					,(5, 5, 1, '8/5/1987', '320 Kensington Parkway', '587-450-6718')
INSERT INTO TVisitNurses (intVisitNurseID, intVisitID, intNurseID)
VALUES				 (1, 3, 5)
					,(2, 2, 4)
					,(3, 2, 1)
					,(4, 4, 2)
					,(5, 1, 3)
					,(6, 5, 2)
-- ------------------------------------------------------------------
-- Select joins - Step 13
-- ------------------------------------------------------------------