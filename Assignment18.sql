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
		,dblSponsorshipCost										DECIMAL		 	NOT NULL
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
		,strAddress												VARCHAR(225)	NOT NULL
		,strCity												VARCHAR(225)	NOT NULL
		,intStateID 											INTEGER 		NOT NULL
		,strZip													VARCHAR(225)	NOT NULL
		,strContactPhone										VARCHAR(225)	NOT NULL
		,strContactEmail										VARCHAR(225)	NOT NULL
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
		,intEventGolferID 										INTEGER 		NOT NULL
		,intSponsorID 											INTEGER 		NOT NULL
		,dtmPledgeDate											DATETIME 		NOT NULL
		,dblPledgePerHole 										DECIMAL 		NOT NULL
		,intPaymentTypeID 										INTEGER 		NOT NULL
		,intPaymentStatuseID 									INTEGER 		NOT NULL
		,CONTRAINT TEventGolferSponsors_PK PRIMARY KEY ( intEventGolferSponsorID)
		
)
CREATE TABLE TEventGolferTeamAndClubs
(
		intEventGolferTeamAndClubID								INTEGER 		NOT NULL
		,intEventGolferID 										INTEGER 		NOT NULL
		,intTeamAndClubID 										INTEGER 		NOT NULL
		,CONTRAINT TEventGolferTeamAndClubs_PK PRIMARY KEY ( intEventGolferTeamAndClubID)
		
)
CREATE TABLE TTeamAndClubs
(
		intTeamAndClubID										INTEGER 		NOT NULL
		,intTypesOfTeamID 										INTEGER 		NOT NULL
		,intLevelOfTeamID 										INTEGER 		NOT NULL
		,intGenderID 											INTEGER 		NOT NULL
		,CONTRAINT TTeamAndClubs_PK PRIMARY KEY ( intTeamAndClubID)
		
)
CREATE TABLE TGenders
(
		intGenderID												INTEGER 		NOT NULL
		strGender 												VARCHAR(255) 	NOT NULL
		,CONTRAINT TGenders_PK PRIMARY KEY ( intGenderID)
		
)
CREATE TABLE TStates
(
		intStateID												INTEGER 		NOT NULL
		,strStateAbbrv											VARCHAR(255)	NOT NULL
		,strStateLong											VARCHAR(255)	NOT NULL
		,CONTRAINT TStates_PK PRIMARY KEY ( intStateID)
		
)
CREATE TABLE TShirtSizes
(
		intShirtSizeID											INTEGER 		NOT NULL
		,strShirtSize 											VARCHAR(255) 	NOT NULL
		,CONTRAINT TShirtSizes_PK PRIMARY KEY ( intShirtSizeID)
		
)
CREATE TABLE TTypesOfTeams
(
		intTypesOfTeamID										INTEGER 		NOT NULL
		,strType												INTEGER 		NOT NULL
		,CONTRAINT TTypesOfTeams_PK PRIMARY KEY ( intTypesOfTeamID)
		
)
CREATE TABLE TLevelOfTeams
(
		intLevelOfTeamID										INTEGER 		NOT NULL
		,strLevel												VARCHAR(255)	NOT NULL
		,CONTRAINT TLevelOfTeams_PK PRIMARY KEY ( intLevelOfTeamID)
		
)
CREATE TABLE TPaymentTypes
(
		intPaymentTypeID										INTEGER 		NOT NULL
		,strPaymentType 										VARCHAR(255)	NOT NULL
		,CONTRAINT TPaymentTypes_PK PRIMARY KEY ( intPaymentTypeID)
		
)
CREATE TABLE TGolfers
(
		intGolferID												INTEGER 		NOT NULL
		,strFirstName											VARCHAR(255)	NOT NULL
		,strLastName											VARCHAR(255)	NOT NULL
		,strAddress												VARCHAR(255)	NOT NULL
		,strCity												VARCHAR(255)	NOT NULL
		,intStateID 											INTEGER 		NOT NULL
		,strZip													VARCHAR(255)	NOT NULL
		,strPhone 				VARCHAR(255) 	NOT NULL
		,strEmail 				VARCHAR(255)	NOT NULL
		,intGenderID 											INTEGER 		NOT NULL
		,intShirtSizeID 										INTEGER 		NOT NULL
		,CONTRAINT TGolfers_PK PRIMARY KEY ( intGolferID)
		
)
CREATE TABLE TSponsors
(
		intSponsorID											INTEGER 		NOT NULL
		,strFirstName											VARCHAR(225)	NOT NULL
		,strLastName											VARCHAR(225)	NOT NULL
		,strAddress												VARCHAR(225)	NOT NULL
		,strCity												VARCHAR(225)	NOT NULL
		,intStateID 											INTEGER 		NOT NULL
		,strZip													VARCHAR(225)	NOT NULL
		,strPhone 												VARCHAR(255) 	NOT NULL
		,strEmail 												VARCHAR(255)	NOT NULL
		,CONTRAINT TSponsors_PK PRIMARY KEY ( intSponsorID)
		
)
CREATE TABLE TPaymentStatuses
(
		intPaymentStatuseID										INTEGER 		NOT NULL
		,strPaymentStatus 										INTEGER 		NOT NULL
		,CONTRAINT TPaymentStatuses_PK PRIMARY KEY ( intPaymentStatuseID)
		
)
-- --------------------------------------------------------------------------------
--	Create relationships. Foreign Keys
-- --------------------------------------------------------------------------------
ALTER TABLE TCorporateSponsors ADD CONTRAINT TCorporateSponsors_TStates_FK1
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

ALTER TABLE TGolfers ADD CONTRAINT TGolfers_TStates_FK1 
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

ALTER TABLE TSponsors ADD CONTRAINT TSponsors_TStates_FK1 
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

ALTER TABLE TEventCorporateSponsorshipTypes ADD CONTRAINT TEventCorporateSponsorshipTypes_TCorporateSponsorshipTypes_FK1
FOREIGN KEY (intCorporateSponsorshipTypeID) REFERENCES TCorporateSponsorshipTypes (TCorporateSponsorshipTypes)

ALTER TABLE TEventCorporateSponsorshipTypes ADD CONTRAINT TEventCorporateSponsorshipTypes_TEvents_FK1
FOREIGN KEY (intEventID) REFERENCES TEvents (intEventID)

ALTER TABLE TEventCorporateSponsorshipTypeCorporateSponsors ADD CONTRAINT TEventCorporateSponsorshipTypeCorporateSponsors_TCorporateSponsorshipTypes_FK1
FOREIGN KEY (intCorporateSponsorshipTypeID) REFERENCES TCorporateSponsorshipTypes (intCorporateSponsorshipTypeID)

ALTER TABLE TEventCorporateSponsorshipTypeCorporateSponsors ADD CONTRAINT TEventCorporateSponsorshipTypeCorporateSponsors_TCorporateSponsors_FK1
FOREIGN KEY (intCorporateSponsorID) REFERENCES TCorporateSponsors (intCorporateSponsorID)

ALTER TABLE TEventGolfers ADD CONTRAINT TEventGolfers_TEvents_FK1
FOREIGN KEY (intEventID) REFERENCES TEvents (intEventID)

ALTER TABLE TEventGolfers ADD CONTRAINT TEventGolfers_TGolfers_FK1
FOREIGN KEY (intGolferID) REFERENCES TGolfers (intGolferID)

ALTER TABLE TEventGolferTeamAndClubs ADD CONTRAINT TEventGolferTeamAndClubs_TEventGolfer_FK1
FOREIGN KEY (intEventGolferID) REFERENCES TEventGolfer (intEventGolferID)

ALTER TABLE TEventGolferTeamAndClubs ADD CONTRAINT TEventGolferTeamAndClubs_TTeamandClubs_FK1
FOREIGN KEY (intTeamAndClubID) REFERENCES TTeamAndClubs (intTeamAndClubID)

ALTER TABLE TTeamAndClubs ADD CONTRAINT TTeamAndClubs_TTypeOfTeams_FK1
FOREIGN KEY (intTypesOfTeamID) REFERENCES TTypesOfTeams (intTypesOfTeamID)

ALTER TABLE TTeamAndClubs ADD CONTRAINT TTeamAndClubs_TLevelofTeams_FK1
FOREIGN KEY (intLevelOfTeamID) REFERENCES TLevelOfTeams (intLevelOfTeamID)

ALTER TABLE TTeamAndClubs ADD CONTRAINT TTeamAndClubs_TGender_FK1
FOREIGN KEY (intGenderID) REFERENCES TGenders (intGenderID)

ALTER TABLE TGolfers ADD CONSTRAINT TGolfers_TGenders_FK1
FOREIGN KEY (intGenderID) REFERENCES TGenders (intGenderID)

ALTER TABLE TEventGolferSponsors ADD CONTRAINT TEventGolferSponsors_EventGolfers_FK1
FOREIGN KEY (intEventGolferID) REFERENCES TEventGolfers (intEventGolferID)

ALTER TABLE TEventGolferSponsors ADD CONTRAINT TEventGolferSponsors_TSponsors_FK1
FOREIGN KEY (intSponsorID) REFERENCES TSponsors (intSponsorID)

ALTER TABLE TEventGolferSponsors ADD CONTRAINT TEventGolferSponsors_TPaymentTypes_FK1
FOREIGN KEY (intPaymentTypeID) REFERENCES TPaymentTypes (intPaymentTypeID)

ALTER TABLE TEventGolferSponsors ADD CONTRAINT TEventGolferSponsors_TPaymentStatuses_FK1
FOREIGN KEY (intPaymentStatuseID) REFERENCES TPaymentStatuses (intPaymentStatuseID)

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
INSERT INTO TEventCorporateSponsorshipTypes (intEventCorporateSponsorshipTypeID, intCorporateSponsorID, intEventID, dblSponsorshipCost, blnSponsorshipAvailable)
VALUES 					(1, 3, 2, 934.12, TRUE)

INSERT INTO TEvents(intEventID, dtmEventYear)
VALUES 					(1, 2012)
						,(2, 2020)
INSERT INTO TGolfers (intGolferID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhone, strEmail, intGenderID, intShirtSizeID) 
VALUES 					 (1, 'Osbourn', 'Paver', '57665 Londonderry Court', 'New York City', 34, '10175', '212-190-6759', 'opaver0@tamu.edu', '1', 4)
						,(2, 'Erich', 'O\'Lunny', '16884 Mockingbird Circle', 'Young America', 25, '55564', '952-228-7456', 'eolunny1@freewebs.com', '1', 3)
						,(3, 'Talyah', 'Northfield', '743 Waywood Junction', 'Silver Spring', 22, '20910', '202-701-8404', 'tnorthfield2@seesaa.net', '2', 5)
						,(4, 'Farly', 'Randell', '9 Huxley Alley', 'Wichita', 18, '67236', '316-417-2249', 'frandell3@dedecms.com', '1', 6)
						,(5, 'Cori', 'Coppo', '0174 Carberry Lane', 'Minneapolis', 25, '55470', '612-184-7051', 'ccoppo4@loc.gov', '1', 5)
						,(6, 'Stormi', 'Devil', '0158 Golf Road', 'Waterbury', 8, '06705', '203-655-6114', 'sdevil5@artisteer.com', '2', 3)
						,(7, 'Dylan', 'Maruska', '025 Pankratz Center', 'Lincoln', 29, '68583', '402-434-6229', 'dmaruska6@studiopress.com', '1', 1)
INSERT INTO TSponsors (intSponsorID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhone, strEmail) 
VALUES 					 (1, 'Mattie', 'Crebo', '216 Novick Street', 'Los Angeles', 6, '90081', '213-106-4905', 'mcrebo0@networksolutions.com')
						,(2, 'Harmonia', 'Giacomasso', '4304 Muir Street', 'Sacramento', 6, '94263', '916-412-1198', 'hgiacomasso1@gnu.org')
						,(3, 'Danie', 'Shovelin', '7 Karstens Point', 'Atlanta', 12, '31119', '770-302-8113', 'dshovelin2@dailymail.co.uk')
						,(4, 'Maegan', 'Brumby', '6 Darwin Parkway', 'San Diego', 6, '92153', '619-973-1306', 'mbrumby3@amazon.co.uk')
						,(5, 'Lynn', 'Lapenna', '4 Elgar Street', 'Huntington', 51, '25726', '304-530-3017', 'llapenna4@unicef.org')
						,(6, 'Vincenty', 'Brinded', '9 Grayhawk Hill', 'Riverside', 6, '92513', '951-391-3854', 'vbrinded5@instagram.com')
						,(7, 'Link', 'Albro', '80 Carpenter Way', 'New York City', 34, '10160', '212-523-7694', 'lalbro6@pbs.org')
						,(8, 'Lexis', 'Kermott', '4 Macpherson Alley', 'Boston', 23, '02298', '617-987-2877', 'lkermott7@spiegel.de')
						,(9, 'Lolly', 'Seaborn', '456 Artisan Crossing', 'Memphis', 45, '38181', '901-713-6162', 'lseaborn8@artisteer.com')
						,(10, 'Deanna', 'Crank', '15751 Raven Way', 'Sacramento', 6, '94207', '916-280-0753', 'dcrank9@de.vu')
INSERT INTO TCorporateSponsors (intCorporateSponsorID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strContactPhone, strContactEmail) 
VALUES 					 (1, 'Ellerey', 'Clashe', '40 Dwight Plaza', 'Lake Worth', 11, '33467', '561-821-3300', 'eclashe0@themeforest.net')
						,(2, 'Donni', 'Miere', '31 Shoshone Plaza', 'Detroit', 24, '48211', '734-759-5157', 'dmiere1@printfriendly.com')
						,(3, 'Madelyn', 'Morrieson', '4 Tennyson Place', 'Fresno', 6, '93786', '559-598-4496', 'mmorrieson2@tinypic.com')
						,(4, 'Cristabel', 'Crofts', '8298 Shoshone Terrace', 'Anchorage', 2, '99599', '907-547-6415', 'ccrofts3@boston.com')
						,(5, 'Rosalind', 'Edinborough', '8 Westport Avenue', 'Washington', 10, '20409', '202-441-3523', 'redinborough4@canalblog.com')
						,(6, 'Jon', 'Hosby', '3 Algoma Road', 'Sacramento', 6, '95813', '916-616-6334', 'jhosby5@naver.com')
						,(7, 'Agnese', 'Yesinin', '66527 Michigan Parkway', 'Albuquerque', 33, '87140', '505-296-5616', 'ayesinin6@mac.com')
						,(8, 'Sigvard', 'Grastye', '623 Anzinger Crossing', 'Amarillo', 46, '79105', '806-546-1745', 'sgrastye7@vistaprint.com')
						,(9, 'Mill', 'Parcells', '0228 Esch Plaza', 'Colorado Springs', 7, '80920', '719-115-5451', 'mparcells8@mediafire.com')
						,(10, 'Tracey', 'Gatus', '261 Hagan Pass', 'Hamilton', 37, '45020', '937-693-5010', 'tgatus9@live.com')
INSERT INTO TEventGolfers (intEventGolferID, intEventID, intGolferID)
VALUES 					 (1, 1, 3)
						,(2, 2, 7)
						,(3, 1, 7)
						,(4, 1, 2)
						,(5, 2, 6)
						,(6, 2, 2)
						,(7, 2, 1)
						,(8, 1, 3)
						,(9, 1, 5)
						,(10, 2, 5)

