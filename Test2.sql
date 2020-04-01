---- --------------------------------------------------------------------------------
---- Name: Lance Brown
---- Class: IT-111
---- Abstract: Test 2
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Options
---- --------------------------------------------------------------------------------
USE dbSQL1;     -- Get out of the master database
SET NOCOUNT ON; -- Report only errors

---- --------------------------------------------------------------------------------
---- Step 13 - Drop tables
---- --------------------------------------------------------------------------------
IF OBJECT_ID ('TClaims')		IS NOT NULL DROP TABLE TClaims
IF OBJECT_ID ('TClaimStatus')	IS NOT NULL DROP TABLE TClaimStatus
IF OBJECT_ID ('TPolicies')		IS NOT NULL DROP TABLE TPolicies
IF OBJECT_ID ('TAgents')		IS NOT NULL DROP TABLE TAgents
IF OBJECT_ID ('TRanks')			IS NOT NULL DROP TABLE TRanks
IF OBJECT_ID ('TTypes')			IS NOT NULL DROP TABLE TTypes
IF OBJECT_ID ('TCustomers')		IS NOT NULL DROP TABLE TCustomers
IF OBJECT_ID ('TRiskAssessments')IS NOT NULL DROP TABLE TRiskAssessments
IF OBJECT_ID ('TIncomeRanges')	IS NOT NULL DROP TABLE TIncomeRanges
IF OBJECT_ID ('TMaritalStatus')	IS NOT NULL DROP TABLE TMaritalStatus
IF OBJECT_ID ('TStates')		IS NOT NULL DROP TABLE TStates
IF OBJECT_ID ('TGenders')		IS NOT NULL DROP TABLE TGenders


---- --------------------------------------------------------------------------------
---- Step 9, 10 & 11 - Create Database, add foreign keys and normalize
---- --------------------------------------------------------------------------------
CREATE TABLE TCustomers
(
	intCustomerID			INTEGER			NOT NULL
	,strFirstName			VARCHAR(255)	NOT NULL
	,strLastName			VARCHAR(255)	NOT NULL
	,strAddress				VARCHAR(255)	NOT NULL
	,strCity				VARCHAR(255)	NOT NULL
	,intStateID				INTEGER			NOT NULL
	,strZip					VARCHAR(255)	NOT NULL
	,strPhone				VARCHAR(255)	NOT NULL
	,strEmail				VARCHAR(255)	NOT NULL
	,strSSN					VARCHAR(255)	NOT NULL
	,dtmDOB					DATETIME		NOT NULL
	,intGenderID			INTEGER 		NOT NULL
	,intMaritalStatusID 	INTEGER 		NOT NULL
	,intIncomeRangeID		INTEGER 		NOT NULL
	,intRiskAssessmentID	INTEGER 		NOT NULL
	,CONSTRAINT TCustomers_PK PRIMARY KEY ( intCustomerID )
)

CREATE TABLE TPolicies
(
	intPolicyID				INTEGER 		NOT NULL
	,strPolicyNumber		VARCHAR(255)	NOT NULL
	,intTypeID				INTEGER 		NOT NULL
	,intCustomerID 			INTEGER 		NOT NULL
	,intAgentID 			INTEGER 		NOT NULL
	,dtmPurchaseDate		DATETIME		NOT NULL
	,dblDeductible			DECIMAL			NOT NULL
	,dblValue				DECIMAL			NOT NULL
	,dblPremium				DECIMAL 		NOT NULL
	,CONSTRAINT TPolicies_PK PRIMARY KEY ( intPolicyID )
)
CREATE TABLE TAgents
(
	intAgentID				INTEGER 		NOT NULL
	,strFirstName			VARCHAR(255)	NOT NULL
	,strLastName			VARCHAR(255)	NOT NULL
	,strAddress				VARCHAR(255)	NOT NULL
	,strCity				VARCHAR(255)	NOT NULL
	,intStateID 			INTEGER 		NOT NULL
	,strZip					VARCHAR(255)	NOT NULL
	,dtmHireDate			DATETIME 		NOT NULL
	,intRankID 				INTEGER 		NOT NULL
	,CONSTRAINT TAgents_PK PRIMARY KEY ( intAgentID )
)

CREATE TABLE TClaims
(
	intClaimID 				INTEGER 		NOT NULL
	,dtmClaimDate			DATETIME 		NOT NULL
	,intPolicyID 			INTEGER 		NOT NULL
	,intClaimStatusID 		INTEGER 		NOT NULL
	,dblAmount				DECIMAL			NOT NULL
	,strReason 				VARCHAR(255)	NOT NULL
	,strSpecialistName		VARCHAR(255)	NOT NULL
	,CONSTRAINT TClaims_PK PRIMARY KEY ( intClaimID )
)

CREATE TABLE TTypes
(
	intTypeID				INTEGER 		NOT NULL
	,strType				VARCHAR(255)	NOT NULL
	,CONSTRAINT TTypes_PK PRIMARY KEY ( intTypeID )
)

CREATE TABLE TRanks
(
	intRankID				INTEGER 		NOT NULL
	,strRank				VARCHAR(255)	NOT NULL
	,CONSTRAINT TRanks_PK PRIMARY KEY ( intRankID )
)

CREATE TABLE TClaimStatus
(
	intClaimStatusID		INTEGER 		NOT NULL
	,strClaimStatus				VARCHAR(255)	NOT NULL
	,CONSTRAINT TClaimStatus_PK PRIMARY KEY ( intClaimStatusID )
)

CREATE TABLE TGenders
(
	intGenderID				INTEGER 		NOT NULL
	,strGender				VARCHAR(255)	NOT NULL
	,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID )
)

CREATE TABLE TMaritalStatus
(
	intMaritalStatusID		INTEGER 		NOT NULL
	,strMaritalStatus		VARCHAR(255) 		NOT NULL
	,CONSTRAINT TMaritalStatus_PK PRIMARY KEY ( intMaritalStatusID )
)

CREATE TABLE TStates
(
	intStateID				INTEGER 		NOT NULL
	,strStateAbbrev 		VARCHAR(255) 	NOT NULL
	,strStateLong 			VARCHAR(255) 	NOT NULL
	,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID )
)

CREATE TABLE TIncomeRanges
(
	intIncomeRangeID 		INTEGER 		NOT NULL
	,strIncomeRange 		VARCHAR(255) 	NOT NULL
	,CONSTRAINT TIncomeRanges_PK PRIMARY KEY ( intIncomeRangeID )
)

CREATE TABLE TRiskAssessments
(
	intRiskAssessmentID 	INTEGER 		NOT NULL
	,strRisk 				VARCHAR(255) 	NOT NULL
	,CONSTRAINT TRiskAssessments_PK PRIMARY KEY ( intRiskAssessmentID )
)

---- --------------------------------------------------------------------------------
---- Step 12 - Create referential integrity with alter statements
---- --------------------------------------------------------------------------------
ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TStates_FK1
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TGenders_FK1
FOREIGN KEY ( intGenderID ) REFERENCES TGenders ( intGenderID )

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TMaritalStatus_FK1
FOREIGN KEY ( intMaritalStatusID ) REFERENCES TMaritalStatus ( intMaritalStatusID )

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TIncomeRanges_FK1
FOREIGN KEY ( intIncomeRangeID ) REFERENCES TIncomeRanges ( intIncomeRangeID )

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TRiskAssessments_FK1
FOREIGN KEY ( intRiskAssessmentID ) REFERENCES TRiskAssessments ( intRiskAssessmentID )

ALTER TABLE TAgents ADD CONSTRAINT TAgents_TStates_FK1
FOREIGN KEY ( intStateID ) REFERENCES TStates ( intStateID )

ALTER TABLE TAgents ADD CONSTRAINT TAgents_TRanks_FK1
FOREIGN KEY ( intRankID ) REFERENCES TRanks ( intRankID )

ALTER TABLE TPolicies ADD CONSTRAINT TPolicies_TTypes_FK1
FOREIGN KEY ( intTypeID ) REFERENCES TTypes ( intTypeID )

ALTER TABLE TPolicies ADD CONSTRAINT TPolicies_TCustomers_FK1
FOREIGN KEY ( intCustomerID ) REFERENCES TCustomers ( intCustomerID )

ALTER TABLE TPolicies ADD CONSTRAINT TPolicies_TAgent_FK1
FOREIGN KEY ( intAgentID ) REFERENCES TAgents ( intAgentID )

ALTER TABLE TClaims ADD CONSTRAINT TClaims_TPolicies_FK1
FOREIGN KEY ( intPolicyID ) REFERENCES TPolicies ( intPolicyID )

ALTER TABLE TClaims ADD CONSTRAINT TClaims_TClaimStatus_FK1
FOREIGN KEY ( intClaimStatusID ) REFERENCES TClaimStatus ( intClaimStatusID )
---- --------------------------------------------------------------------------------
---- Step 14 - Add data
---- --------------------------------------------------------------------------------
INSERT into TStates( intStateID, strStateAbbrev, strStateLong)
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
						
INSERT INTO TTypes (intTypeID, strType)
VALUES					 (1, 'Auto')
						,(2, 'Boat')
						,(3, 'Motorcycle')
						,(4, 'Home')
						,(5, 'Renters')

INSERT INTO TRanks (intRankID, strRank)
VALUES 					 (1, 'Junior Sales Agent')
						,(2, 'Sale Agent')
						,(3, 'Senior Sales Agent')

INSERT INTO TClaimStatus (intClaimStatusID, strClaimStatus)
VALUES 					 (1, 'submitted')
						,(2, 'in process')
						,(3, 'paid')
						,(4, 'rejected')

INSERT INTO TMaritalStatus (intMaritalStatusID, strMaritalStatus)
VALUES 					 (1, 'Single')
						,(2, 'Married')
						,(3, 'Divorced')

INSERT INTO TIncomeRanges (intIncomeRangeID, strIncomeRange)
VALUES 					 (1, '0-$20,000')
						,(2, '$20,001 - $50,000')
						,(3, '$50,001 - $100,000')
						,(4, '$100,000+')

INSERT INTO TRiskAssessments (intRiskAssessmentID, strRisk)
VALUES 					 (1, 'Low')
						,(2, 'Average')
						,(3, 'High')

INSERT INTO TGenders( intGenderID, strGender)
VALUES 					(1, 'Female')
						,(2, 'Male')
						,(3, 'Other')
INSERT INTO TCustomers (intCustomerID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhone, strEmail, strSSN, dtmDOB, intGenderID, intMaritalStatusID, intIncomeRangeID, intRiskAssessmentID) 
VALUES 					 (1, 'Juan', 'Wordsley', '56 Roxbury Place', 'Salem', 39, '97306', '503-155-0863', 'jwordsley0@ow.ly', '390-28-3469', '12/10/1974', 2, 3, 1, 1)
						,(2, 'Murry', 'Steel', '003 Sauthoff Circle', 'Los Angeles', 6, '90055', '213-122-7857', 'msteel1@columbia.edu', '617-43-4774', '11/25/1929', 2, 3, 2, 1)
						,(3, 'Homerus', 'Reditt', '05 Karstens Terrace', 'Bakersfield', 6, '93399', '661-875-5731', 'hreditt2@timesonline.co.uk', '835-48-9108', '1/25/1969', 2, 2, 4, 2)
						,(4, 'Rudolph', 'Berthe', '2631 Arrowood Point', 'Lafayette', 16, '47905', '765-520-7951', 'rberthe3@google.co.jp', '364-42-5794', '12/28/1913', 2, 1, 4, 2)
						,(5, 'Justine', 'Alders', '300 Leroy Street', 'Philadelphia', 40, '19136', '215-511-9490', 'jalders4@imdb.com', '704-79-2332', '10/30/1972', 1, 1, 3, 3)

INSERT INTO TAgents (intAgentID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, dtmHireDate, intRankID) 
VALUES 					 (1, 'Holly', 'Lockney', '92644 Scott Court', 'Newton', 23, '02162', '6/21/2015', 3)
						,(2, 'Marie-ann', 'Haukey', '9485 Buhler Point', 'Saint Louis', 27, '63104', '2/9/2016', 3)
						,(3, 'Sianna', 'McCaighey', '09 Duke Drive', 'Savannah', 12, '31410', '5/24/2016', 3)
						,(4, 'Baily', 'Grunnill', '65 Lien Terrace', 'Minneapolis', 25, '55417', '8/9/2015', 2)
						,(5, 'Merrile', 'Pickvance', '7 Bellgrove Street', 'Berkeley', 6, '94712', '6/19/2010', 3)
						
INSERT INTO TPolicies (intPolicyID, strPolicyNumber, intTypeID, intCustomerID, intAgentID, dtmPurchaseDate, dblDeductible, dblValue, dblPremium) 
VALUES 					 (1, '3691833330', 1, 1, 4, '7/18/2004', 132.69, 463512.41,799.03)
						,(2, '4803931186', 4, 4, 1, '1/25/2012', 366.76, 933455.30, 259.04)
						,(3, '0827314558', 3, 2, 3,'2/27/2003', 859.61, 209023.86, 155.58)
						,(4, '6965733535', 5, 3, 1, '7/18/2007', 699.01, 875964.82, 280.76)
						,(5, '7249599925', 4, 1, 4, '10/15/2002', 570.44, 764912.31, 106.05)


INSERT INTO TClaims (intClaimID, dtmClaimDate, intPolicyID, intClaimStatusID, dblAmount, strReason, strSpecialistName) 
VALUES 					 (1, '11/6/2019', 3, 4, 952.08, 'pede venenatis non sodales sed tincidunt eu felis fusce', 'Derrick Feake')
						,(2, '1/2/2002', 5, 2, 713.94, 'in quis justo maecenas rhoncus aliquam lacus morbi', 'Cherye Croyser')
						,(3, '3/25/2018', 4, 3, 37.68, 'amet sapien dignissim vestibulum vestibulum ante ipsum', 'James Josey')
						,(4, '9/4/2016', 3, 4, 353.93, 'quis augue luctus tincidunt nulla mollis molestie', 'Clayborn Maffezzoli')
						,(5, '4/29/2012', 1, 2, 148.42, 'nunc viverra dapibus nulla suscipit ligula', 'Dalia Skep')



---- Step 15 - Joins
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Step 15A - list all customers and their policies
---- --------------------------------------------------------------------------------
SELECT
	TC.strFirstName as 'First Name'
	,TC.strLastName as 'Last Name'
	,TP.strPolicyNumber as 'Policy Number'
	,TT.strType as 'Policy Type'
	,TP.dtmPurchaseDate as 'Purchase Date'
	,TP.dblDeductible as 'Deductible'
	,TP.dblValue as 'Policy Value'
	,TP.dblPremium as 'Premium'
	,TA.strFirstName as 'Agent First Name'
	,TA.strLastName as 'Agent Last Name'


FROM TCustomers as TC
	JOIN TPolicies as TP
		ON TC.intCustomerID = TP.intCustomerID
	JOIN TTypes as TT
		ON TP.intTypeID = TT.intTypeID
	JOIN TAgents as TA
		ON TP.intAgentID = TA.intAgentID
---- --------------------------------------------------------------------------------
---- Step 15B - list all customers with claim in progress with policy and date of claim
---- --------------------------------------------------------------------------------
SELECT
	TC.strFirstName as 'First Name'
	,TC.strLastName as 'Last Name'
	,TCl.dtmClaimDate as 'Claim date'
	,TP.strPolicyNumber as 'Policy Number'
	,TT.strType as 'Policy Type'
	,TP.dtmPurchaseDate as 'Purchase Date'
	,TP.dblDeductible as 'Deductible'
	,TP.dblValue as 'Policy Value'
	,TP.dblPremium as 'Premium'
	,TA.strFirstName as 'Agent First Name'
	,TA.strLastName as 'Agent Last Name'

FROM TCustomers as TC
	JOIN TPolicies as TP
		ON TC.intCustomerID = TP.intCustomerID
	JOIN TTypes as TT
		ON TP.intTypeID = TT.intTypeID
	JOIN TAgents as TA
		ON TP.intAgentID = TA.intAgentID
	JOIN TClaims as TCl
		ON TP.intPolicyID = TCl.intPolicyID
WHERE TCl.intClaimStatusID = 2

---- --------------------------------------------------------------------------------
---- Step 15C - show all male customers with claim against auto
---- --------------------------------------------------------------------------------
SELECT
	TC.strFirstName as 'First Name'
	,TC.strLastName as 'Last Name'
	,TCl.dtmClaimDate as 'Claim date'
	,TP.strPolicyNumber as 'Policy Number'
	,TT.strType as 'Policy Type'
	,TP.dtmPurchaseDate as 'Purchase Date'
	,TP.dblDeductible as 'Deductible'
	,TP.dblValue as 'Policy Value'
	,TP.dblPremium as 'Premium'
	,TA.strFirstName as 'Agent First Name'
	,TA.strLastName as 'Agent Last Name'

FROM TCustomers as TC
	JOIN TPolicies as TP
		ON TC.intCustomerID = TP.intCustomerID
	JOIN TTypes as TT
		ON TP.intTypeID = TT.intTypeID
	JOIN TAgents as TA
		ON TP.intAgentID = TA.intAgentID
	JOIN TClaims as TCl
		ON TP.intPolicyID = TCl.intPolicyID
WHERE	TC.intGenderID = 2
	AND TP.intTypeID = 1
---- --------------------------------------------------------------------------------
---- Step 15D - show all agents and policies sold in a certain month
---- --------------------------------------------------------------------------------
SELECT
	TA.strFirstName as 'First Name'
	,TA.strLastName as 'Last Name'
	,TP.strPolicyNumber as 'Policy'
	,TP.dblValue as 'Cost'
	,TP.dtmPurchaseDate as 'Date sold'
	,TC.strFirstName as 'Customer first'
	,TC.strLastName as 'Customer Last'
FROM TPolicies as TP
	JOIN TAgents as TA
		ON TP.intAgentID = TA.intAgentID
	JOIN TCustomers as TC
		ON TP.intCustomerID = TC.intCustomerID
WHERE
	MONTH(TP.dtmPurchaseDate) = 7
---- --------------------------------------------------------------------------------
---- Step 15E - show all claim specialists with rejected claim
---- --------------------------------------------------------------------------------
SELECT
	TCl.strSpecialistName
	,TCl.dtmClaimDate
	,TP.strPolicyNumber
	,TP.dtmPurchaseDate
	,TT.strType
	,TC.strFirstName
	,TC.strLastName

FROM TClaims as TCl
	JOIN TPolicies as TP
		ON TCl.intPolicyID = TP.intPolicyID
	JOIN TTypes as TT
		ON TT.intTypeID = TP.intTypeID
	JOIN TCustomers as TC
		ON TC.intCustomerID = TP.intCustomerID
WHERE
	TCl.intClaimStatusID = 4