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
---- Create drop table
---- --------------------------------------------------------------------------------

---- Drop Table Statements

IF OBJECT_ID ('TPatients')		IS NOT NULL DROP TABLE TPatients
IF OBJECT_ID ('TVisits')		IS NOT NULL DROP TABLE TVisits
IF OBJECT_ID ('TDoctors')		IS NOT NULL DROP TABLE TDoctors
IF OBJECT_ID ('TNurses')		IS NOT NULL DROP TABLE TNurses

---- --------------------------------------------------------------------------------
----	Create table 
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
CREATE TABLE TVisits
(
	intVisitID				INTEGER				NOT NULL
	,intPatientID			INTEGER 			NOT NULL
	,intDoctorID			INTEGER 			NOT NULL
	,dtmTime				DATETIME 			NOT NULL
	,strReason				VARCHAR(255)		NOT NULL
	,strDiagnosis			VARCHAR(255)		NOT NULL
)