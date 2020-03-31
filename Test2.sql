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
IF OBJECT_ID ('TCustomers')		IS NOT NULL DROP TABLE TCustomers
IF OBJECT_ID ('TPolicies')		IS NOT NULL DROP TABLE TPolicies
IF OBJECT_ID ('TAgents')		IS NOT NULL DROP TABLE TAgents
IF OBJECT_ID ('TClaims')		IS NOT NULL DROP TABLE TClaims
IF OBJECT_ID ('TTypes')			IS NOT NULL DROP TABLE TTypes
IF OBJECT_ID ('TRank')			IS NOT NULL DROP TABLE TRank
IF OBJECT_ID ('TClaimStatus')	IS NOT NULL DROP TABLE TClaimStatus
IF OBJECT_ID ('TGenders')		IS NOT NULL DROP TABLE TGenders
IF OBJECT_ID ('TMaritalStatus')	IS NOT NULL DROP TABLE TMaritalStatus
IF OBJECT_ID ('TStates')		IS NOT NULL DROP TABLE TStates
IF OBJECT_ID ('TIncomeRange')	IS NOT NULL DROP TABLE TIncomeRange
IF OBJECT_ID ('TRiskAssessment')IS NOT NULL DROP TABLE TRiskAssessment
IF OBJECT_ID ('T')				IS NOT NULL DROP TABLE T

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
	,strMaritalStatus		VARCHAR 		NOT NULL
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
FOREIGN KEY ( intStateID ) REFERENCES TState ( intStateID )

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TGenders_FK1
FOREIGN KEY ( intGenderID ) REFERENCES TGenders ( intGenderID )

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TMaritalStatus_FK1
FOREIGN KEY ( intMaritalStatusID ) REFERENCES TMaritalStatus ( intMaritalStatusID )

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TIncomeRanges_FK1
FOREIGN KEY ( intIncomeRangeID ) REFERENCES TIncomeRanges ( intIncomeRangeID )

ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TRiskAssessments_FK1
FOREIGN KEY ( intRiskAssessmentID ) REFERENCES TRiskAssessments ( intRiskAssessmentID )

ALTER TABLE TAgents ADD CONSTRAINT TAgents_TStates_FK1
FOREIGN KEY ( intStateID ) REFERENCES TState ( intStateID )

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
FOREIGN KEY ( intStatusID ) REFERENCES TClaimStatus ( intStatusID )
---- --------------------------------------------------------------------------------
---- Step 14 - Add data
---- --------------------------------------------------------------------------------
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
INSERT INTO TCustomers (intCustomerID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, intGenderID, intRaceID, dtmDateOfBirth)
VALUES				  (1, 'Had', 'Vedeshkin', '8770 Arapahoe Crossing', 'Madison', 52, '53779', 2, 5, '8/12/1920')
					 ,(2, 'Pearline', 'Beenham', '7 Warbler Road', 'Memphis', 45, '38136', 1, 4, '6/23/2001')
					 ,(3, 'Willie', 'Medforth', '217 Rusk Place', 'Norfolk', 49, '23551', 2, 2, '3/24/1909')
					 ,(4, 'Katti', 'Stribling', '23929 Knutson Drive', 'Peoria', 15, '61605', 1, 3, '11/17/2000')
					 ,(5, 'Roley', 'Maud', '4626 Schmedeman Terrace', 'Saint Paul', 25, '55115', 2, 1, '4/15/1999')
---- --------------------------------------------------------------------------------
---- Step 15 - Joins
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Step 15A - list all customers and their policies
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Step 15B - list all customers with claim in progress with policy and date of claim
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Step 15C - show all male customers with claim against auto
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Step 15D - show all agents and policies sold in a certain month
---- --------------------------------------------------------------------------------

---- --------------------------------------------------------------------------------
---- Step 15E - show all claim specialists with rejected claim
---- --------------------------------------------------------------------------------