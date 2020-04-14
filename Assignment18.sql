---- --------------------------------------------------------------------------------
---- Name: Lance Brown
---- Class: IT-111
---- Abstract: Assignment 18
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
IF OBJECT_ID ('TEventCorporateSponsorshipTypes') IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypes
IF OBJECT_ID ('TEventCorporateSponsorshipTypeCorporateSponsors') IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypeCorporateSponsors
IF OBJECT_ID ('TCorporateSponsors') IS NOT NULL DROP TABLE TCorporateSponsors
IF OBJECT_ID ('TEvents') IS NOT NULL DROP TABLE TEvents
IF OBJECT_ID ('TCorporateSponsorshipTypes') IS NOT NULL DROP TABLE TCorporateSponsorshipTypes
IF OBJECT_ID ('TEventGolfers') IS NOT NULL DROP TABLE TEventGolfers
IF OBJECT_ID ('TEventGolferSponsors') IS NOT NULL DROP TABLE TEventGolferSponsors
IF OBJECT_ID ('TEventGolferTeamAndClubs') IS NOT NULL DROP TABLE TEventGolferTeamAndClubs
IF OBJECT_ID ('TTeamAndClubs') IS NOT NULL DROP TABLE TTeamAndClubs
IF OBJECT_ID ('TGenders') IS NOT NULL DROP TABLE TGenders
IF OBJECT_ID ('TStates') IS NOT NULL DROP TABLE TStates
IF OBJECT_ID ('TShirtSizes') IS NOT NULL DROP TABLE TShirtSizes
IF OBJECT_ID ('TTypesOfTeams') IS NOT NULL DROP TABLE TTypesOfTeams
IF OBJECT_ID ('TLevelOfTeams') IS NOT NULL DROP TABLE TLevelOfTeams
IF OBJECT_ID ('TPaymentTypes') IS NOT NULL DROP TABLE TPaymentTypes
IF OBJECT_ID ('TGolfers') IS NOT NULL DROP TABLE TGolfers
IF OBJECT_ID ('TSponsors') IS NOT NULL DROP TABLE TSponsors
IF OBJECT_ID ('TPaymentStatuses') IS NOT NULL DROP TABLE TPaymentStatuses


---- --------------------------------------------------------------------------------
----	Create table 
---- --------------------------------------------------------------------------------

CREATE TABLE TEventCorporateSponsorshipTypes
(
		intEventCorporateSponsorshipTypeID						INTEGER 		NOT NULL
		,intCorporateSponsorID 									INTEGER 		NOT NULL
		,intEventID 											INTEGER 		NOT NULL
		,dblSponsorshipCost										VARCHAR(255) 	NOT NULL
		,blnSponsorshipAvailable 								BOOLEAN			NOT NULL
		,CONSTRAINT TEventCorporateSponsorshipTypes_PK PRIMARY KEY (intEventCorporateSponsorshipTypeID)
)
CREATE TABLE TEventCorporateSponsorshipTypeCorporateSponsors
(
		intEventCorporateSponsorshipTypeCorporateSponsorID		INTEGER 		NOT NULL
		,intCorporateSponsorshipTypeID 							INTEGER 		NOT NULL
		,intCorporateSponsorID 									INTEGER 		NOT NULL
		,CONTRAINT TEventCorporateSponsorshipTypeCorporateSponsors_PK PRIMARY KEY ( intEventCorporateSponsorshipTypeCorporateSponsorID)
)
CREATE TABLE TCorporateSponsors
(
		intCorporateSponsorID									INTEGER 		NOT NULL
		,strFirstName 											VARCHAR(255)    NOT NULL
		,strLastName 											VARCHAR(255) 	NOT NULL
		,strAddress												VARCHAR(225)		NOT NULL
		,strCity												VARCHAR(225)		NOT NULL
		,intStateID 											INTEGER 			NOT NULL
		,strZip													VARCHAR(225)		NOT NULL
		,strContactPhone										VARCHAR(225)		NOT NULL
		,strContactEmail										VARCHAR(225)		NOT NULL
		,CONTRAINT TCorporateSponsors_PK PRIMARY KEY ( intCorporateSponsorID)
)
CREATE TABLE TEvents
(
		intEventID												INTEGER 		NOT NULL
		,dtmEventYear 											DATETIME 		NOT NULL
		,CONTRAINT TEvents_PK PRIMARY KEY ( intEventID)
		
)
CREATE TABLE TCorporateSponsorshipTypes
(
		intCorporateSponsorshipTypeID							INTEGER 		NOT NULL
		,intCorporateSponsorshipTypeID 							INTEGER 		NOT NULL
		,CONTRAINT TCorporateSponsorshipTypes_PK PRIMARY KEY ( intCorporateSponsorshipTypeID)
		
)
CREATE TABLE TEventGolfers
(
		intEventGolferID										INTEGER 		NOT NULL
		,intEventID 											INTEGER 		NOT NULL
		,intGolferID 											INTEGER 		NOT NULL
		,CONTRAINT TEventGolfers_PK PRIMARY KEY ( intEventGolferID)
		
)
CREATE TABLE TEventGolferSponsors
(
		intEventGolferSponsorID									INTEGER 		NOT NULL
		,intEventGolferID 										INTEGER
		,CONTRAINT TEventGolferSponsors_PK PRIMARY KEY ( intEventGolferSponsorID)
		
)
CREATE TABLE TEventGolferTeamAndClubs
(
		intEventGolferTeamAndClubID								INTEGER 		NOT NULL
		,CONTRAINT TEventGolferTeamAndClubs_PK PRIMARY KEY ( intEventGolferTeamAndClubID)
		
)
CREATE TABLE TTeamAndClubs
(
		intTeamAndClubID										INTEGER 		NOT NULL
		,CONTRAINT TTeamAndClubs_PK PRIMARY KEY ( intTeamAndClubID)
		
)
CREATE TABLE TGenders
(
		intGenderID												INTEGER 		NOT NULL
		,CONTRAINT TGenders_PK PRIMARY KEY ( intGenderID)
		
)
CREATE TABLE TStates
(
		intStateID												INTEGER 		NOT NULL
		,CONTRAINT TStates_PK PRIMARY KEY ( intStateID)
		
)
CREATE TABLE TShirtSizes
(
		intShirtSizeID											INTEGER 		NOT NULL
		,CONTRAINT TShirtSizes_PK PRIMARY KEY ( intShirtSizeID)
		
)
CREATE TABLE TTypesOfTeams
(
		intTypesOfTeamID										INTEGER 		NOT NULL
		,CONTRAINT TTypesOfTeams_PK PRIMARY KEY ( intTypesOfTeamID)
		
)
CREATE TABLE TLevelOfTeams
(
		intLevelOfTeamID										INTEGER 		NOT NULL
		,CONTRAINT TLevelOfTeams_PK PRIMARY KEY ( intLevelOfTeamID)
		
)
CREATE TABLE TPaymentTypes
(
		intPaymentTypeID										INTEGER 		NOT NULL
		,CONTRAINT TPaymentTypes_PK PRIMARY KEY ( intPaymentTypeID)
		
)
CREATE TABLE TGolfers
(
		intGolferID												INTEGER 		NOT NULL
		,CONTRAINT TGolfers_PK PRIMARY KEY ( intGolferID)
		
)
CREATE TABLE TSponsors
(
		intSponsorID											INTEGER 		NOT NULL
		,CONTRAINT TSponsors_PK PRIMARY KEY ( intSponsorID)
		
)
CREATE TABLE TPaymentStatuses
(
		intPaymentStatuseID										INTEGER 		NOT NULL
		,CONTRAINT TPaymentStatuses_PK PRIMARY KEY ( intPaymentStatuseID)
		
)