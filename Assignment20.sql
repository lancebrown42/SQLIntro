---- --------------------------------------------------------------------------------
---- Name: Lance Brown
---- Class: IT-111
---- Abstract: Assignment 20
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Options
---- --------------------------------------------------------------------------------
USE dbSQL1;     -- Get out of the master database
SET NOCOUNT ON; -- Report only errors

---- --------------------------------------------------------------------------------
----						
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Create drop table
---- --------------------------------------------------------------------------------

---- Drop Table Statements
IF OBJECT_ID ('TEventCorporateSponsorshipTypes') IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypes
IF OBJECT_ID ('TEventCorporateSponsorshipTypeCorporateSponsors') IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypeCorporateSponsors
IF OBJECT_ID ('TCorporateSponsors') IS NOT NULL DROP TABLE TCorporateSponsors
IF OBJECT_ID ('TCorporateSponsorshipTypes') IS NOT NULL DROP TABLE TCorporateSponsorshipTypes
IF OBJECT_ID ('TEventGolferSponsors') IS NOT NULL DROP TABLE TEventGolferSponsors
IF OBJECT_ID ('TEventGolferTeamAndClubs') IS NOT NULL DROP TABLE TEventGolferTeamAndClubs
IF OBJECT_ID ('TTeamAndClubs') IS NOT NULL DROP TABLE TTeamAndClubs
IF OBJECT_ID ('TShirtSizes') IS NOT NULL DROP TABLE TShirtSizes
IF OBJECT_ID ('TTypesOfTeams') IS NOT NULL DROP TABLE TTypesOfTeams
IF OBJECT_ID ('TLevelOfTeams') IS NOT NULL DROP TABLE TLevelOfTeams
IF OBJECT_ID ('TPaymentTypes') IS NOT NULL DROP TABLE TPaymentTypes
IF OBJECT_ID ('TSponsors') IS NOT NULL DROP TABLE TSponsors
IF OBJECT_ID ('TPaymentStatuses') IS NOT NULL DROP TABLE TPaymentStatuses
IF OBJECT_ID ('TEventGolfers') IS NOT NULL DROP TABLE TEventGolfers
IF OBJECT_ID ('TGolfers') IS NOT NULL DROP TABLE TGolfers
IF OBJECT_ID ('TEvents') IS NOT NULL DROP TABLE TEvents
IF OBJECT_ID ('TGenders') IS NOT NULL DROP TABLE TGenders
IF OBJECT_ID ('TStates') IS NOT NULL DROP TABLE TStates


---- --------------------------------------------------------------------------------
----	Create table 
---- --------------------------------------------------------------------------------

CREATE TABLE TEventCorporateSponsorshipTypes
(
		intEventCorporateSponsorshipTypeID						INTEGER 		NOT NULL
		,intCorporateSponsorshipTypeID 							INTEGER 		NOT NULL
		,intEventID 											INTEGER 		NOT NULL
		,dblSponsorshipCost										DECIMAL		 	NOT NULL
		,blnSponsorshipAvailable 								BIT				NOT NULL
		,CONSTRAINT TEventCorporateSponsorshipTypes_PK PRIMARY KEY (intEventCorporateSponsorshipTypeID)
)
CREATE TABLE TEventCorporateSponsorshipTypeCorporateSponsors
(
		intEventCorporateSponsorshipTypeCorporateSponsorID		INTEGER 		NOT NULL
		,intCorporateSponsorshipTypeID 							INTEGER 		NOT NULL
		,intCorporateSponsorID 									INTEGER 		NOT NULL
		,CONSTRAINT TEventCorporateSponsorshipTypeCorporateSponsors_PK PRIMARY KEY ( intEventCorporateSponsorshipTypeCorporateSponsorID)
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
		,CONSTRAINT TCorporateSponsors_PK PRIMARY KEY ( intCorporateSponsorID)
)
CREATE TABLE TEvents
(
		intEventID												INTEGER 		NOT NULL
		,dtmEventYear 											DATETIME 		NOT NULL
		,CONSTRAINT TEvents_PK PRIMARY KEY ( intEventID)
		
)
CREATE TABLE TCorporateSponsorshipTypes
(
		intCorporateSponsorshipTypeID							INTEGER 		NOT NULL
		,strCorporateSponsorshipType 							VARCHAR(255) 	NOT NULL
		,CONSTRAINT TCorporateSponsorshipTypes_PK PRIMARY KEY ( intCorporateSponsorshipTypeID)
		
)
CREATE TABLE TEventGolfers
(
		intEventGolferID										INTEGER 		NOT NULL
		,intEventID 											INTEGER 		NOT NULL
		,intGolferID 											INTEGER 		NOT NULL
		,CONSTRAINT TEventGolfers_PK PRIMARY KEY ( intEventGolferID)
		
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
		,CONSTRAINT TEventGolferSponsors_PK PRIMARY KEY ( intEventGolferSponsorID)
		
)
CREATE TABLE TEventGolferTeamAndClubs
(
		intEventGolferTeamAndClubID								INTEGER 		NOT NULL
		,intEventGolferID 										INTEGER 		NOT NULL
		,intTeamAndClubID 										INTEGER 		NOT NULL
		,CONSTRAINT TEventGolferTeamAndClubs_PK PRIMARY KEY ( intEventGolferTeamAndClubID)
		
)
CREATE TABLE TTeamAndClubs
(
		intTeamAndClubID										INTEGER 		NOT NULL
		,intTypesOfTeamID 										INTEGER 		NOT NULL
		,intLevelOfTeamID 										INTEGER 		NOT NULL
		,intGenderID 											INTEGER 		NOT NULL
		,CONSTRAINT TTeamAndClubs_PK PRIMARY KEY ( intTeamAndClubID)
		
)
CREATE TABLE TGenders
(
		intGenderID												INTEGER 		NOT NULL
		,strGender 												VARCHAR(255) 	NOT NULL
		,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID)
		
)
CREATE TABLE TStates
(
		intStateID												INTEGER 		NOT NULL
		,strStateAbbrv											VARCHAR(255)	NOT NULL
		,strStateLong											VARCHAR(255)	NOT NULL
		,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID)
		
)
CREATE TABLE TShirtSizes
(
		intShirtSizeID											INTEGER 		NOT NULL
		,strShirtSize 											VARCHAR(255) 	NOT NULL
		,CONSTRAINT TShirtSizes_PK PRIMARY KEY ( intShirtSizeID)
		
)
CREATE TABLE TTypesOfTeams
(
		intTypesOfTeamID										INTEGER 		NOT NULL
		,strType												VARCHAR(255)	NOT NULL
		,CONSTRAINT TTypesOfTeams_PK PRIMARY KEY ( intTypesOfTeamID)
		
)
CREATE TABLE TLevelOfTeams
(
		intLevelOfTeamID										INTEGER 		NOT NULL
		,strLevel												VARCHAR(255)	NOT NULL
		,CONSTRAINT TLevelOfTeams_PK PRIMARY KEY ( intLevelOfTeamID)
		
)
CREATE TABLE TPaymentTypes
(
		intPaymentTypeID										INTEGER 		NOT NULL
		,strPaymentType 										VARCHAR(255)	NOT NULL
		,CONSTRAINT TPaymentTypes_PK PRIMARY KEY ( intPaymentTypeID)
		
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
		,CONSTRAINT TGolfers_PK PRIMARY KEY ( intGolferID)
		
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
		,CONSTRAINT TSponsors_PK PRIMARY KEY ( intSponsorID)
		
)
CREATE TABLE TPaymentStatuses
(
		intPaymentStatuseID										INTEGER 		NOT NULL
		,strPaymentStatus 										VARCHAR(255)	NOT NULL
		,CONSTRAINT TPaymentStatuses_PK PRIMARY KEY ( intPaymentStatuseID)
		
)
-- --------------------------------------------------------------------------------
--	Create relationships. Foreign Keys
-- --------------------------------------------------------------------------------
ALTER TABLE TCorporateSponsors ADD CONSTRAINT TCorporateSponsors_TStates_FK1
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

ALTER TABLE TGolfers ADD CONSTRAINT TGolfers_TStates_FK1 
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

ALTER TABLE TSponsors ADD CONSTRAINT TSponsors_TStates_FK1 
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

ALTER TABLE TEventCorporateSponsorshipTypes ADD CONSTRAINT TEventCorporateSponsorshipTypes_TCorporateSponsorshipTypes_FK1
FOREIGN KEY (intCorporateSponsorshipTypeID) REFERENCES TCorporateSponsorshipTypes (intCorporateSponsorshipTypeID)

ALTER TABLE TEventCorporateSponsorshipTypes ADD CONSTRAINT TEventCorporateSponsorshipTypes_TEvents_FK1
FOREIGN KEY (intEventID) REFERENCES TEvents (intEventID)

ALTER TABLE TEventCorporateSponsorshipTypeCorporateSponsors ADD CONSTRAINT TEventCorporateSponsorshipTypeCorporateSponsors_TCorporateSponsorshipTypes_FK1
FOREIGN KEY (intCorporateSponsorshipTypeID) REFERENCES TCorporateSponsorshipTypes (intCorporateSponsorshipTypeID)

ALTER TABLE TEventCorporateSponsorshipTypeCorporateSponsors ADD CONSTRAINT TEventCorporateSponsorshipTypeCorporateSponsors_TCorporateSponsors_FK1
FOREIGN KEY (intCorporateSponsorID) REFERENCES TCorporateSponsors (intCorporateSponsorID)

ALTER TABLE TEventGolfers ADD CONSTRAINT TEventGolfers_TEvents_FK1
FOREIGN KEY (intEventID) REFERENCES TEvents (intEventID)

ALTER TABLE TEventGolfers ADD CONSTRAINT TEventGolfers_TGolfers_FK1
FOREIGN KEY (intGolferID) REFERENCES TGolfers (intGolferID)

ALTER TABLE TEventGolferTeamAndClubs ADD CONSTRAINT TEventGolferTeamAndClubs_TEventGolfer_FK1
FOREIGN KEY (intEventGolferID) REFERENCES TEventGolfers (intEventGolferID)

ALTER TABLE TEventGolferTeamAndClubs ADD CONSTRAINT TEventGolferTeamAndClubs_TTeamandClubs_FK1
FOREIGN KEY (intTeamAndClubID) REFERENCES TTeamAndClubs (intTeamAndClubID)

ALTER TABLE TTeamAndClubs ADD CONSTRAINT TTeamAndClubs_TTypeOfTeams_FK1
FOREIGN KEY (intTypesOfTeamID) REFERENCES TTypesOfTeams (intTypesOfTeamID)

ALTER TABLE TTeamAndClubs ADD CONSTRAINT TTeamAndClubs_TLevelofTeams_FK1
FOREIGN KEY (intLevelOfTeamID) REFERENCES TLevelOfTeams (intLevelOfTeamID)

ALTER TABLE TTeamAndClubs ADD CONSTRAINT TTeamAndClubs_TGender_FK1
FOREIGN KEY (intGenderID) REFERENCES TGenders (intGenderID)

ALTER TABLE TGolfers ADD CONSTRAINT TGolfers_TGenders_FK1
FOREIGN KEY (intGenderID) REFERENCES TGenders (intGenderID)

ALTER TABLE TEventGolferSponsors ADD CONSTRAINT TEventGolferSponsors_EventGolfers_FK1
FOREIGN KEY (intEventGolferID) REFERENCES TEventGolfers (intEventGolferID)

ALTER TABLE TEventGolferSponsors ADD CONSTRAINT TEventGolferSponsors_TSponsors_FK1
FOREIGN KEY (intSponsorID) REFERENCES TSponsors (intSponsorID)

ALTER TABLE TEventGolferSponsors ADD CONSTRAINT TEventGolferSponsors_TPaymentTypes_FK1
FOREIGN KEY (intPaymentTypeID) REFERENCES TPaymentTypes (intPaymentTypeID)

ALTER TABLE TEventGolferSponsors ADD CONSTRAINT TEventGolferSponsors_TPaymentStatuses_FK1
FOREIGN KEY (intPaymentStatuseID) REFERENCES TPaymentStatuses (intPaymentStatuseID)

-- --------------------------------------------------------------------------------
--	Add Sample Data - INSERTS
-- --------------------------------------------------------------------------------
INSERT INTO TStates( intStateID, strStateAbbrv, strStateLong)
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

INSERT INTO TEvents(intEventID, dtmEventYear)
VALUES 					(1, '2012')
						,(2, '2020')
INSERT INTO TGolfers (intGolferID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhone, strEmail, intGenderID, intShirtSizeID) 
VALUES 					 (1, 'Osbourn', 'Paver', '57665 Londonderry Court', 'New York City', 34, '10175', '212-190-6759', 'opaver0@tamu.edu', 1, 4)
						,(2, 'Erich', 'OLunny', '16884 Mockingbird Circle', 'Young America', 25, '55564', '952-228-7456', 'eolunny1@freewebs.com', 1, 3)
						,(3, 'Talyah', 'Northfield', '743 Waywood Junction', 'Silver Spring', 22, '20910', '202-701-8404', 'tnorthfield2@seesaa.net', 2, 5)
						,(4, 'Farly', 'Randell', '9 Huxley Alley', 'Wichita', 18, '67236', '316-417-2249', 'frandell3@dedecms.com', 1, 6)
						,(5, 'Cori', 'Coppo', '0174 Carberry Lane', 'Minneapolis', 25, '55470', '612-184-7051', 'ccoppo4@loc.gov', 1, 5)
						,(6, 'Stormi', 'Devil', '0158 Golf Road', 'Waterbury', 8, '06705', '203-655-6114', 'sdevil5@artisteer.com', 2, 3)
						,(7, 'Dylan', 'Maruska', '025 Pankratz Center', 'Lincoln', 29, '68583', '402-434-6229', 'dmaruska6@studiopress.com', 1, 1)
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
						,(8, 1, 4)
						,(9, 1, 5)
						,(10, 2, 5)
INSERT INTO TCorporateSponsorshipTypes(intCorporateSponsorshipTypeID, strCorporateSponsorshipType)
VALUES					(1, 'Charitable')
						,(2, 'Marketing')
						,(3, 'Merchandising')
INSERT INTO TShirtSizes(intShirtSizeID, strShirtSize)
VALUES 					(1, 'XS')
						,(2, 'S')
						,(3, 'M')
						,(4, 'L')
						,(5, 'XL')
						,(6, 'XXL')

INSERT INTO TTypesOfTeams(intTypesOfTeamID, strType)
VALUES 					(1, 'Football')
						,(2, 'Crew')
						,(3, 'Theater')
						,(4, 'Unaffiliated')

INSERT INTO TLevelOfTeams(intLevelOfTeamID, strLevel)
VALUES 					(1, 'Freshman')
						,(2, 'JV')
						,(3, 'Varsity')
						,(4, 'Club')

INSERT INTO TPaymentStatuses(intPaymentStatuseID, strPaymentStatus)
VALUES 					(1, 'Pending')
						,(2, 'Paid')
						,(3, 'Unpaid')
INSERT INTO TPaymentTypes(intPaymentTypeID, strPaymentType)
VALUES 					(1, 'Cash')
						,(2, 'Credit')
						,(3, 'Check')
INSERT INTO TTeamAndClubs(intTeamAndClubID, intTypesOfTeamID, intLevelOfTeamID, intGenderID)
VALUES					 (1, 1, 3, 2)
						,(2, 1, 2, 1)
						,(3, 1, 2, 2)
						,(4, 1, 4, 2)
						,(5, 3, 4, 2)
						,(6, 2, 4, 1)
						,(7, 1, 2, 2)
						,(8, 3, 3, 1)
						,(9, 1, 1, 2)
						,(10, 3, 1, 1)
						,(11, 3, 1, 1)
						,(12, 3, 3, 1)
INSERT INTO TEventGolferTeamAndClubs (intEventGolferTeamAndClubID, intEventGolferID, intTeamAndClubID)
VALUES					(1, 6, 5)
						,(2, 6, 4)
						,(3, 1, 8)
						,(4, 7, 5)
						,(5, 9, 7)
						,(6, 4, 8)
						,(7, 1, 3)
						,(8, 7, 7)
						,(9, 4, 3)
						,(10, 7, 4)		
INSERT INTO TEventGolferSponsors (intEventGolferSponsorID, intEventGolferID, intSponsorID, dtmPledgeDate, dblPledgePerHole, intPaymentTypeID, intPaymentStatuseID)
VALUES					 (1, 5, 4, '7/27/2016', 70.58, 1, 2)
						,(2, 4, 2, '7/10/2012', 191.54, 1, 1)
						,(3, 1, 10, '3/2/2020', 299.63, 3, 3)
						,(4, 2, 8, '3/14/2013', 73.17, 3, 3)
						,(5, 3, 1, '11/19/2015', 180.73, 3, 3)
						,(6, 2, 1, '7/5/2012', 355.53, 1, 1)
						,(7, 7, 7, '1/28/2016', 262.13, 3, 1)
						,(8, 5, 3, '3/7/2019', 91.61, 2, 3)
						,(9, 7, 2, '9/13/2018', 34.42, 2, 2)
						,(10, 5, 3, '3/5/2019', 7.76, 3, 1)
INSERT INTO TEventCorporateSponsorshipTypes (intEventCorporateSponsorshipTypeID, intCorporateSponsorshipTypeID, intEventID, dblSponsorshipCost, blnSponsorshipAvailable)
VALUES					 (1, 3, 2, 456.49, 1)
						,(2, 3, 2, 614.83, 1)
						,(3, 2, 1, 515.66, 2)
						,(4, 1, 1, 816.05, 2)
						,(5, 3, 2, 440.17, 1)
						,(6, 3, 2, 439.08, 1)
INSERT INTO TEventCorporateSponsorshipTypeCorporateSponsors (intEventCorporateSponsorshipTypeCorporateSponsorID, intCorporateSponsorshipTypeID, intCorporateSponsorID)
VALUES					(1, 3, 7)
						,(2, 2, 4)
						,(3, 1, 1)
						
---- --------------------------------------------------------------------------------
---- 1)	Show all golfers for the most current event while showing those golfers that played in a previous event who is not golfing in the current event. 			
---- --------------------------------------------------------------------------------
SELECT 
	TG.strFirstName as FirstName
	,TG.strLastName as LastName
	,TE.dtmEventYear as 'Year'
FROM
	TGolfers as TG
		JOIN TEventGolfers as TEG
			ON TG.intGolferID = TEG.intGolferID
		JOIN TEvents as TE
			ON TEG.intEventID = TE.intEventID
WHERE TE.dtmEventYear IN (SELECT dtmEventYear FROM TEvents WHERE intEventID = 2)
						OR TG.intGolferID NOT IN (SELECT TG.intGolferID from TGolfers as TG JOIN TEventGolfers as TEG ON TG.intGolferID = TEG.intGolferID JOIN TEvents as TE on TE.intEventID = TEG.intEventID WHERE TE.intEventID = 2)
ORDER BY
	TE.dtmEventYear
---- --------------------------------------------------------------------------------
---- 2)	Show all golfers for the most current event and the donations they received between two dates (even if they did not receive a donation during this period).   NOTE:  Use...Between!				
---- --------------------------------------------------------------------------------
SELECT
	TG.strFirstName as FirstName
	,TG.strLastName as LastName
	,SUM(TEGS.dblPledgePerHole * 18) as Donations
FROM
	TGolfers as TG
		JOIN TEventGolfers as TEG
			ON TG.intGolferID = TEG.intGolferID
		JOIN TEvents as TE
			ON TEG.intEventID = TE.intEventID
		JOIN TEventGolferSponsors as TEGS
			ON TEG.intEventGolferID = TEGS.intEventGolferID
WHERE TEGS.dtmPledgeDate BETWEEN '01/01/2017' AND '04/20/2020'
		AND TE.intEventID = 2
GROUP BY
	TG.strFirstName, TG.strLastName
ORDER BY TG.strLastName
---- --------------------------------------------------------------------------------
---- 3)	Show total pledged/donated per golfer for the current event.  For those playing that do not have pledges, show their total as zero.  (Note:…all you need to do is make this an outer join).  		
---- --------------------------------------------------------------------------------
SELECT
	TG.strLastName + ', ' + TG.strFirstName as Name
	,SUM(ISNULL(TEGS.dblPledgePerHole * 18, '0'))
FROM TGolfers as TG
	LEFT JOIN TEventGolfers as TEG
		ON TG.intGolferID = TEG.intGolferID
	LEFT JOIN TEvents as TE
		on TE.intEventID = TEG.intEventID
	FULL JOIN TEventGolferSponsors as TEGS
		ON TEG.intEventGolferID = TEGS.intEventGolferID
WHERE TE.intEventID = 2
GROUP BY
	TG.strLastName
	,TG.strFirstName

ORDER BY
	TG.strLastName
---- --------------------------------------------------------------------------------
---- 4)	Show ONLY golfers who played in previous events that are not playing in the current event. 		
---- --------------------------------------------------------------------------------
SELECT 
	TG.strLastName + ', ' + TG.strFirstName as Name
	,Year(TE.dtmEventYear) as 'Year'
FROM
	TGolfers as TG
		JOIN TEventGolfers as TEG
			ON TG.intGolferID = TEG.intGolferID
		JOIN TEvents as TE
			ON TEG.intEventID = TE.intEventID
WHERE TE.dtmEventYear NOT IN (SELECT dtmEventYear FROM TEvents WHERE intEventID = 2)
ORDER BY
	TE.dtmEventYear
---- --------------------------------------------------------------------------------
---- 5)	Show ONLY sponsors who donated $100 or more in previous events that have not donated for the current event.  Show the golfer(s), the event, and representative sport/club that each of these sponsors donated in the past. 				
---- --------------------------------------------------------------------------------
SELECT
	TG.strLastName + ', ' + TG.strFirstName as Name
	,Year(TE.dtmEventYear) as 'Year'
	,SUM(TEGS.dblPledgePerHole * 18) as Donation
FROM TEventGolferSponsors as TEGS
	LEFT JOIN TEventGolfers as TEG
		ON TEGS.intEventGolferID = TEG.intEventGolferID
	LEFT JOIN TEvents as TE
		ON TEG.intEventID = TE.intEventID
	FULL JOIN TGolfers as TG
		ON TEG.intGolferID = TG.intGolferID
WHERE TEGS.dblPledgePerHole NOT IN (SELECT TEventGolferSponsors.dblPledgePerHole FROM TEventGolferSponsors JOIN TEventGolfers on TEventGolferSponsors.intEventGolferID = TEventGolfers.intEventGolferID JOIN TEvents on TEventGolfers.intEventID = TEvents.intEventID WHERE TEvents.intEventID = 2)
GROUP BY TG.strLastName, TG.strFirstName, TE.dtmEventYear
---- --------------------------------------------------------------------------------
---- 6)	Show corporate sponsors that have purchased a corporate sponsorship in the past but have not in the current event.  Show the event(s) and the type(s) of sponsorships purchased per sponsor.  			
---- --------------------------------------------------------------------------------
SELECT	
		TCS.intCorporateSponsorID as CorporateID
		,Year(TE.dtmEventYear) as 'Year'
		,TCST.strCorporateSponsorshipType as Type

FROM TCorporateSponsors as TCS
	LEFT JOIN TEventCorporateSponsorshipTypeCorporateSponsors as TECSTCS
		on TCS.intCorporateSponsorID = TECSTCS.intCorporateSponsorID
	FULL JOIN TCorporateSponsorshipTypes as TCST
		on TECSTCS.intCorporateSponsorshipTypeID = TCST.intCorporateSponsorshipTypeID
	LEFT JOIN TEventCorporateSponsorshipTypes as TECST
		on TCST.intCorporateSponsorshipTypeID = TECST.intCorporateSponsorshipTypeID
	FULL JOIN TEvents as TE
		on TECST.intEventID = TE.intEventID
WHERE TCS.intCorporateSponsorID NOT IN (SELECT TCS.intCorporateSponsorID FROM TCorporateSponsors as TCS
								LEFT JOIN TEventCorporateSponsorshipTypeCorporateSponsors as TECSTCS
									on TCS.intCorporateSponsorID = TECSTCS.intCorporateSponsorID
								FULL JOIN TCorporateSponsorshipTypes as TCST
									on TECSTCS.intCorporateSponsorshipTypeID = TCST.intCorporateSponsorshipTypeID
								LEFT JOIN TEventCorporateSponsorshipTypes as TECST
									on TCST.intCorporateSponsorshipTypeID = TECST.intCorporateSponsorshipTypeID
								FULL JOIN TEvents as TE
									on TECST.intEventID = TE.intEventID
								WHERE TE.intEventID = 2)
		AND TCST.strCorporateSponsorshipType != 'NULL'

---- --------------------------------------------------------------------------------
---- 7)	Show corporate sponsors that have purchased more than 1 corporate sponsorships where the combined total was over $500.00 in the past but has not purchased a sponsorship in the current event.  Show the event(s), the type(s) of sponsorships purchased, and the price for each per sponsor.  			
---- --------------------------------------------------------------------------------
SELECT	
		TCS.intCorporateSponsorID as CorporateID
		,Year(TE.dtmEventYear) as 'Year'
		,SUM(TECST.dblSponsorshipCost) as Sponsorship
		,TCST.strCorporateSponsorshipType as Type

FROM TCorporateSponsors as TCS
	LEFT JOIN TEventCorporateSponsorshipTypeCorporateSponsors as TECSTCS
		on TCS.intCorporateSponsorID = TECSTCS.intCorporateSponsorID
	FULL JOIN TCorporateSponsorshipTypes as TCST
		on TECSTCS.intCorporateSponsorshipTypeID = TCST.intCorporateSponsorshipTypeID
	LEFT JOIN TEventCorporateSponsorshipTypes as TECST
		on TCST.intCorporateSponsorshipTypeID = TECST.intCorporateSponsorshipTypeID
	FULL JOIN TEvents as TE
		on TECST.intEventID = TE.intEventID
WHERE TCS.intCorporateSponsorID NOT IN (SELECT TCS.intCorporateSponsorID FROM TCorporateSponsors as TCS
								LEFT JOIN TEventCorporateSponsorshipTypeCorporateSponsors as TECSTCS
									on TCS.intCorporateSponsorID = TECSTCS.intCorporateSponsorID
								FULL JOIN TCorporateSponsorshipTypes as TCST
									on TECSTCS.intCorporateSponsorshipTypeID = TCST.intCorporateSponsorshipTypeID
								LEFT JOIN TEventCorporateSponsorshipTypes as TECST
									on TCST.intCorporateSponsorshipTypeID = TECST.intCorporateSponsorshipTypeID
								FULL JOIN TEvents as TE
									on TECST.intEventID = TE.intEventID
								WHERE TE.intEventID = 2)
GROUP BY TCS.intCorporateSponsorID, TE.dtmEventYear, TECST.dblSponsorshipCost, TCST.strCorporateSponsorshipType
HAVING TECST.dblSponsorshipCost > 500

