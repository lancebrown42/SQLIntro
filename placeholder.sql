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

CREATE TABLE TCorporateSponsorshipTypes
(
		intCorporateSponsorshipTypeID							INTEGER 		NOT NULL
		,intCorporateSponsorshipTypeID 							INTEGER 		NOT NULL
		,CONTRAINT TCorporateSponsorshipTypes_PK PRIMARY KEY ( intCorporateSponsorshipTypeID)
		
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


CREATE TABLE TPaymentStatuses
(
		intPaymentStatuseID										INTEGER 		NOT NULL
		,strPaymentStatus 										INTEGER 		NOT NULL
		,CONTRAINT TPaymentStatuses_PK PRIMARY KEY ( intPaymentStatuseID)
		
)
1xs
2s
3m
4l
5xl
6xxl