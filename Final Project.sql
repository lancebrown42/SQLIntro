---- --------------------------------------------------------------------------------
---- Name: Lance Brown
---- Class: IT-111
---- Abstract: Final project
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
IF OBJECT_ID ('TJobWorkers') IS NOT NULL DROP TABLE TJobWorkers
IF OBJECT_ID ('TJobMaterials') IS NOT NULL DROP TABLE TJobMaterials
IF OBJECT_ID ('TJobs') IS NOT NULL DROP TABLE TJobs
IF OBJECT_ID ('TCustomers') IS NOT NULL DROP TABLE TCustomers
IF OBJECT_ID ('TStatuses') IS NOT NULL DROP TABLE TStatuses
IF OBJECT_ID ('TMaterials') IS NOT NULL DROP TABLE TMaterials
IF OBJECT_ID ('TVendors') IS NOT NULL DROP TABLE TVendors
IF OBJECT_ID ('TWorkerSkills') IS NOT NULL DROP TABLE TWorkerSkills
IF OBJECT_ID ('TWorkers') IS NOT NULL DROP TABLE TWorkers
IF OBJECT_ID ('TSkills') IS NOT NULL DROP TABLE TSkills
IF OBJECT_ID ('TStates') IS NOT NULL DROP TABLE TStates
IF OBJECT_ID ('VLaborCost') IS NOT NULL DROP VIEW VLaborCost
 


---- Drop Table Statements

---- --------------------------------------------------------------------------------
----	Step 1.1 Create tables 
---- --------------------------------------------------------------------------------
CREATE TABLE TJobs
(
	 intJobID							INTEGER				NOT NULL
	,intCustomerID						INTEGER				NOT NULL
	,intStatusID						INTEGER				NOT NULL
	,dtmStartDate						DATETIME			NOT NULL
	,dtmEndDate							DATETIME			NOT NULL
	,strJobDesc							VARCHAR(2000)		NOT NULL
	,CONSTRAINT TJobs_PK				PRIMARY KEY ( intJobID )
)


CREATE TABLE TCustomers
(
	  intCustomerID						INTEGER				NOT NULL
	 ,strFirstName						VARCHAR(50)			NOT NULL
	 ,strLastName						VARCHAR(50)			NOT NULL
	 ,strAddress						VARCHAR(50)			NOT NULL
	 ,strCity							VARCHAR(50)			NOT NULL
	 ,intStateID						INTEGER 			NOT NULL
	 ,strZip							VARCHAR(50)			NOT NULL
	 ,strPhoneNumber					VARCHAR(50)			NOT NULL
	 ,CONSTRAINT TCustomer_PK			PRIMARY KEY ( intCustomerID )
)


CREATE TABLE TStatuses
(
	 intStatusID						INTEGER				NOT NULL
	,strStatus							VARCHAR(50)			NOT NULL
	,CONSTRAINT TStatuses_PK			PRIMARY KEY ( intStatusID )
)

CREATE TABLE TJobMaterials
(
	 intJobMaterialID					INTEGER				NOT NULL
	,intJobID							INTEGER				NOT NULL
	,intMaterialID						INTEGER				NOT NULL
	,intQuantity						INTEGER				NOT NULL
	,CONSTRAINT TCustomerJobMaterials_PK PRIMARY KEY ( intJobMaterialID )
)

CREATE TABLE TMaterials
(
	 intMaterialID						INTEGER				NOT NULL
	,strDescription						VARCHAR(100)		NOT NULL
	,monCost							MONEY				NOT NULL
	,intVendorID						INTEGER				NOT NULL
	,CONSTRAINT TMaterials_PK			PRIMARY KEY ( intMaterialID )
)

CREATE TABLE TVendors
(
	 intVendorID						INTEGER				NOT NULL
	,strVendorName						VARCHAR(50)			NOT NULL
	,strAddress							VARCHAR(50)			NOT NULL
	,strCity							VARCHAR(50)			NOT NULL
	,intStateID							INTEGER				NOT NULL
	,strZip								VARCHAR(50)			NOT NULL
	,strPhoneNumber						VARCHAR(50)			NOT NULL
	,CONSTRAINT TVendors_PK				PRIMARY KEY ( intVendorID )
)

CREATE TABLE TJobWorkers
(
	 intJobWorkerID						INTEGER				NOT NULL
	,intJobID							INTEGER				NOT NULL
	,intWorkerID						INTEGER				NOT NULL
	,intHoursWorked						INTEGER				NOT NULL
	,CONSTRAINT TCustomerJobWorkers_PK	PRIMARY KEY ( intJobWorkerID )
)

CREATE TABLE TWorkers
(
	 intWorkerID						INTEGER				NOT NULL
	 ,strFirstName						VARCHAR(50)			NOT NULL
	 ,strLastName						VARCHAR(50)			NOT NULL
	 ,strAddress						VARCHAR(50)			NOT NULL
	 ,strCity							VARCHAR(50)			NOT NULL
	 ,intStateID						INTEGER				NOT NULL
	 ,strZip							VARCHAR(50)			NOT NULL
	 ,strPhoneNumber					VARCHAR(50)			NOT NULL
	 ,dtmHireDate						DATETIME			NOT NULL
	 ,monHourlyRate						MONEY				NOT NULL
	 ,CONSTRAINT TWorkers_PK			PRIMARY KEY ( intWorkerID )
)

CREATE TABLE TWorkerSkills
(
	 intWorkerSkillID					INTEGER				NOT NULL
	,intWorkerID						INTEGER				NOT NULL
	,intSkillID							INTEGER				NOT NULL
	,CONSTRAINT	TWorkerSkills_PK		PRIMARY KEY ( intWorkerSkillID )
)

CREATE TABLE TSkills
(
	 intSkillID							INTEGER				NOT NULL
	,strSkill							VARCHAR(50)			NOT NULL
	,strDescription						VARCHAR(100)		NOT NULL
	,CONSTRAINT TSkills_PK				PRIMARY KEY ( intSkillID )
)
CREATE TABLE TStates
(
	intStateID							INTEGER 		NOT NULL
	,strStateAbbrv						VARCHAR(255)	NOT NULL
	,strStateLong						VARCHAR(255)	NOT NULL
	,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID)
		
)
-- --------------------------------------------------------------------------------
-- Step #1.2: Identify and Create Foreign Keys
-- --------------------------------------------------------------------------------
--
-- #	Child										Parent							Column(s)
-- -	-----										------							---------
-- 1	TJobs	     								  TCustomers					  intCustomerID   --
-- 2	TJobs	     							      TStatuses                       intStatusID --
-- 3	TJobMaterials								  TJobs                           intJobID --       
-- 4	TJobMaterials					              TMaterials                      intMaterialID --      
-- 5	TMaterials	 				                  TVendors                        intVendorID --        
-- 6	TJobWorkers	 							      TJobs                           intJobID --           
-- 7	TJobWorkers	 							      TWorkers                        intWorkerID --        
-- 8	TWorkerSkills								  TWorkers        				  intWorkerID --    
-- 9	TWorkerSkills					              TSkills                         intSkillID --
--10	TCustomers									  TStates 						  intStateID --
--11	TVendors									  TStates 						  intStateID --
--12	TWorkers									  TStates 						  intStateID --         

--1
ALTER TABLE TJobs ADD CONSTRAINT TJobs_TCustomers_FK
FOREIGN KEY (intCustomerID) REFERENCES TCustomers (intCustomerID)
--2
ALTER TABLE TJobs ADD CONSTRAINT TJobs_TStatuses_FK
FOREIGN KEY (intStatusID) REFERENCES TStatuses(intStatusID)
--3
ALTER TABLE TJobMaterials ADD CONSTRAINT TJobMaterials_TJobs_FK
FOREIGN KEY (intJobID) REFERENCES TJobs(intJobID) ON DELETE CASCADE
--4
ALTER TABLE TJobMaterials ADD CONSTRAINT TJobMaterials_TMaterials_FK
FOREIGN KEY (intMaterialID) REFERENCES TMaterials(intMaterialID)
--5
ALTER TABLE TMaterials ADD CONSTRAINT TMaterials_TVendors_FK
FOREIGN KEY (intVendorID) REFERENCES TVendors(intVendorID)
--6
ALTER TABLE TJobWorkers ADD CONSTRAINT TJobWorkers_TJobs_FK
FOREIGN KEY (intJobID) REFERENCES TJobs(intJobID) ON DELETE CASCADE
--7
ALTER TABLE TJobWorkers ADD CONSTRAINT TJobWorkers_TWorkers_FK
FOREIGN KEY (intWorkerID) REFERENCES TWorkers(intWorkerID)
--8
ALTER TABLE TWorkerSkills ADD CONSTRAINT TWorkerSkills_TWorkers_FK
FOREIGN KEY (intWorkerID) REFERENCES TWorkers(intWorkerID)
--9
ALTER TABLE TWorkerSkills ADD CONSTRAINT TWorkerSkills_TSkills_FK
FOREIGN KEY (intSkillID) REFERENCES TSkills(intSkillID)
--10
ALTER TABLE TCustomers ADD CONSTRAINT TCustomers_TStates_FK
FOREIGN KEY (intStateID) REFERENCES TStates(intStateID)
--11
ALTER TABLE TVendors ADD CONSTRAINT TVendors_TStates_FK
FOREIGN KEY (intStateID) REFERENCES TStates(intStateID)
--12
ALTER TABLE TWorkers ADD CONSTRAINT TWorkers_TStates_FK
FOREIGN KEY (intStateID) REFERENCES TStates(intStateID)


-- --------------------------------------------------------------------------------
-- Step #2: Add Data
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


INSERT INTO TCustomers (intCustomerID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhoneNumber)
VALUES	 (1, 'Corrie', 'Haugh', '64708 Main Street', 'Toledo', 37, '43666', '419-158-5201')
		,(2, 'Holly', 'Drewes', '6694 Marcy Parkway', 'Lafayette', 16, '47905', '765-877-6858')
		,(3, 'Dorolice', 'Browncey', '4 Main Street', 'Cincinnati', 37, '45203', '513-438-6342')
		,(4, 'Derril', 'Biasio', '47328 Jackson Point', 'Indianapolis', 16, '46247', '317-194-0637')
		,(5, 'Aloysius', 'Decent', '50 Main Street', 'Toledo', 37, '43615', '419-194-3943')

INSERT INTO TStatuses (intStatusID, strStatus)
VALUES	(1, 'open') 
		,(2, 'in process')
		,(3, 'closed')

INSERT INTO TJobs (intJobID, intCustomerID, intStatusID, dtmStartDate, dtmEndDate, strJobDesc)
VALUES 	(1, 1, 1, '2013-09-21 01:13:52', '2015-11-30 11:02:07', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.')
		,(2, 1, 3, '2015-09-05 09:49:04', '2015-11-20 18:00:35', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.')
		,(3, 1, 2, '2011-07-09 21:39:06', '2014-03-22 17:24:02', 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.')
		,(4, 2, 3, '2012-02-09 21:10:28', '2018-03-29 23:12:46', 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.')
		,(5, 4, 3, '2016-07-24 15:41:53', '2018-04-22 09:37:03', 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.')
		,(6, 5, 1, '2018-06-26 12:42:26', '2019-08-10 05:48:39', 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.')
		,(7, 2, 2, '2011-10-02 16:21:25', '2015-10-06 04:59:55', 'Suspendisse potenti. Nullam porttitor lacus at turpis.')
		,(8, 1, 3, '2011-11-11 07:40:13', '2011-11-12 19:30:42', 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.')
		,(9, 5, 1, '2016-02-24 04:06:08', '2018-12-12 11:53:03', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.')
		,(10, 1, 3, '2019-02-07 19:18:20', '2020-03-08 11:10:02', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.')




INSERT INTO TVendors (intVendorID, strVendorName, strAddress, strCity, intStateID, strZip, strPhoneNumber)
VALUES	 (1, 'Volkman, Macejkovic and Yundt', '41 Bartillon Circle', 'Louisville', 19, '40256', '502-376-2826')
		,(2, 'Kris-Conroy', '6 Rowland Pass', 'Cincinnati', 37, '45228', '513-844-8362')
		,(3, 'Borer-Kiehn', '6 Westend Court', 'Dayton', 37, '45403', '937-956-0037')

INSERT INTO TMaterials (intMaterialID, strDescription, monCost, intVendorID)
VALUES	 (1, 'consequat', '$30.89', 3)
		,(2, 'habitasse felis', '$24.03', 1)
		,(3, 'nulla', '$17.73', 3)
		,(4, 'varius ut blandit non interdum', '$4.60', 2)
		,(5, 'inden', '$17.50', 1)
		,(6, 'unobtanium', '$999', 2)

INSERT INTO TJobMaterials (intJobMaterialID, intJobID, intMaterialID, intQuantity)
VALUES	 (1, 5, 2, 73)
		,(2, 10, 1, 35)
		,(3, 7, 1, 54)
		,(4, 7, 1, 89)
		,(5, 6, 2, 23)
		,(6, 9, 4, 52)
		,(7, 10, 5, 28)
		,(8, 3, 1, 14)
		,(9, 8, 3, 76)
		,(10, 9, 2, 11)
		,(11, 1, 2, 59)
		,(12, 3, 4, 82)
		,(13, 5, 5, 21)
		,(14, 10, 3, 52)
		,(15, 7, 3, 44)
		,(16, 7, 4, 28)
		,(17, 2, 3, 38)
		,(18, 8, 5, 72)
		,(19, 1, 4, 69)
		,(20, 10, 1, 28)
		,(21, 4, 4, 82)
		,(22, 4, 5, 38)
		,(23, 5, 3, 46)
		,(24, 8, 1, 71)
		,(25, 9, 2, 64)
		,(26, 4, 3, 5)
		,(27, 4, 1, 9)
		,(28, 8, 3, 66)
		,(29, 8, 3, 51)
		,(30, 2, 1, 27)

INSERT INTO TWorkers (intWorkerID, strFirstName, strLastName, strAddress, strCity, intStateID, strZip, strPhoneNumber, dtmHireDate, monHourlyRate)
VALUES	 (1, 'Willyt', 'Taggert', '59 Anderson Plaza', 'Canton', 37, '44710', '330-940-9805', '2014-02-15 17:07:29', '$27.86')
		,(2, 'Kalina', 'Cluatt', '19660 Grayhawk Point', 'Lafayette', 16, '47905', '765-620-7744', '2013-07-21 12:19:08', '$31.37')
		,(3, 'Felizio', 'Haughan', '46649 Fieldstone Junction', 'Fort Wayne', 16, '46852', '260-480-2013', '2014-06-05 03:35:03', '$27.97')
		,(4, 'Lidia', 'Santorini', '32 Sage Crossing', 'Anderson', 16, '46015', '765-487-5073', '2011-01-09 23:49:52', '$41.95')
		,(5, 'Huey', 'Limon', '7652 American Hill', 'Louisville', 19, '40205', '502-888-3330', '2014-04-18 08:21:55', '$29.98')
		,(6, 'Juliann', 'Milvarnie', '85 Pawling Avenue', 'Canton', 37, '44760', '330-204-3105', '2012-09-21 06:12:00', '$48.96')
		,(7, 'Pauly', 'Bellamy', '33112 Ramsey Circle', 'Indianapolis', 16, '46266', '317-226-0272', '2013-09-11 13:28:38', '$68.84')
		,(8, 'Miran', 'Louis', '3394 Ludington Point', 'Columbus', 37, '43204', '614-696-1838', '2014-12-09 07:52:20', '$26.11')
		,(9, 'Morley', 'Caughan', '0 Fallview Road', 'Indianapolis', 16, '46247', '317-964-7663', '2010-07-05 22:05:53', '$37.72')
		,(10, 'Renaud', 'Lumsdall', '24284 Veith Avenue', 'Canton', 37, '44720', '330-184-2750', '2010-04-08 00:04:30', '$65.05')

INSERT INTO TJobWorkers (intJobWorkerID, intJobID, intWorkerID, intHoursWorked)
VALUES	 (1, 4, 9, 59)
		,(2, 10, 5, 29)
		,(3, 4, 4, 52)
		,(4, 2, 8, 55)
		,(5, 8, 10, 46)
		,(6, 2, 8, 43)
		,(7, 7, 8, 73)
		,(8, 3, 1, 19)
		,(9, 7, 4, 31)
		,(10, 5, 4, 45)
		,(11, 4, 4, 27)
		,(12, 3, 10, 27)
		,(13, 7, 10, 49)
		,(14, 10, 2, 72)
		,(15, 2, 5, 67)
		,(16, 2, 5, 78)
		,(17, 3, 4, 49)
		,(18, 8, 4, 57)
		,(19, 9, 3, 33)
		,(20, 1, 1, 70)
		,(21, 2, 2, 55)
		,(22, 8, 6, 43)
		,(23, 8, 3, 76)
		,(24, 4, 4, 80)
		,(25, 8, 7, 15)
		,(26, 1, 9, 23)
		,(27, 1, 3, 56)
		,(28, 4, 8, 66)
		,(29, 3, 3, 74)
		,(30, 7, 3, 20)


INSERT INTO TSkills (intSkillID, strSkill, strDescription)
VALUES	 (1, 'nullam sit', 'In hac habitasse platea dictumst.')
		,(2, 'enim', 'Nunc rhoncus dui vel sem.')
		,(3, 'eget orci', 'Morbi non quam nec dui luctus rutrum.')
		,(4, 'magnis dis', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst.')
		,(5, 'cubilia', 'Integer a nibh. In quis justo.')

INSERT INTO TWorkerSkills (intWorkerSkillID, intWorkerID, intSkillID)
VALUES	 (1, 9, 1)
		,(2, 1, 2)
		,(3, 2, 5)
		,(4, 1, 5)
		,(5, 9, 5)
		,(6, 3, 3)
		,(7, 9, 1)
		,(8, 9, 5)
		,(9, 8, 3)
		,(10, 5, 3)
		,(11, 5, 1)
		,(12, 10, 1)
		,(13, 8, 1)
		,(14, 10, 1)
		,(15, 3, 1)
		,(16, 1, 5)
		,(17, 9, 5)
		,(18, 3, 2)
		,(19, 4, 4)
		,(20, 10, 4)
		,(21, 1, 1)
		,(22, 5, 3)
		,(23, 3, 4)
		,(24, 8, 2)
		,(25, 4, 5)
		,(26, 8, 3)
		,(27, 1, 1)
		,(28, 9, 3)
		,(29, 1, 4)
		,(30, 2, 5)



-- --------------------------------------------------------------------------------
-- Step #3: Updates and deletes
-- --------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------
-- Step #3.1. Create SQL to update the address for a specific customer. Include a select statement before and after the update. 
-- --------------------------------------------------------------------------------
SELECT * FROM TCustomers
UPDATE TCustomers
SET strAddress = '396 Street Drive'
WHERE intCustomerID = 4
SELECT * FROM TCustomers

-- --------------------------------------------------------------------------------
-- Step #3.2. Create SQL to increase the hourly rate by $2 for each worker that has been an employee for at least 1 year. Include a select before and after the update. Make sure that you have data so that some rows are updated and others are not. 
-- --------------------------------------------------------------------------------
SELECT * FROM TWorkers
UPDATE TWorkers
SET monHourlyRate += 2
WHERE dtmHireDate > 2019-04-25
SELECT * FROM TWorkers
-- --------------------------------------------------------------------------------
-- Step #3.3. Create SQL to delete a specific job that has associated work hours and materials assigned to it. Include a select before and after the statement(s). 
-- --------------------------------------------------------------------------------
SELECT * FROM TJobs
DELETE TJobs
WHERE TJobs.intJobID = ANY(
	SELECT TJ.intJobID
	FROM TJobs as TJ
		JOIN TJobWorkers as TJW
		on TJ.intJobID = TJW.intJobID
		JOIN TJobMaterials as TJM 
		on TJ.intJobID = TJM.intJobID
	GROUP BY TJ.intjobID, TJM.intMaterialID
	HAVING SUM(TJW.intHoursWorked) < 200 AND TJM.intMaterialID = 2
	
	)
SELECT * FROM TJobs
-- --------------------------------------------------------------------------------
-- Step #4.	Queries
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Step #4.1	Write a query to list all jobs that are in process. Include the Job ID and Description, Customer ID and name, and the start date. Order by the Job ID. 
-- --------------------------------------------------------------------------------
SELECT 
	TJ.intJobID as 'Job ID'
	,TJ.strJobDesc as 'Description'
	,TC.intCustomerID as 'Customer ID'
	,TC.strLastName + ', ' + TC.strFirstName as 'Customer Name'
	,TJ.dtmStartDate as 'Start Date'
FROM TJobs as TJ
	JOIN TStatuses as TS
		on TJ.intStatusID = TS.intStatusID
	JOIN TCustomers as TC
		on TJ.intCustomerID = TC.intCustomerID
WHERE TS.strStatus = 'in process'
ORDER BY TJ.intJobID
-- --------------------------------------------------------------------------------
-- Step #4.2	 Write a query to list all complete jobs for a specific customer and the materials used on each job. Include the quantity, unit cost, and total cost for each material on each job. Order by Job ID and material ID. Note: Select a customer that has at least 3 complete jobs and at least 1 open job and 1 in process job. At least one of the complete jobs should have multiple materials. If needed, go back to your inserts and add data. 
-- --------------------------------------------------------------------------------
SELECT 
	TC.intCustomerID as Customer
	,TJ.intJobID as Job
	,TM.strDescription as Material
	,TM.monCost as Cost
	,TJM.intQuantity as Quantity
	,TM.monCost * TJM.intQuantity as Total
FROM TCustomers as TC
	JOIN TJobs as TJ 
		on TC.intCustomerID = TJ.intCustomerID
	JOIN TJobMaterials as TJM
		on TJ.intJobID = TJM.intJobID
	JOIN TMaterials as TM
		on TJM.intMaterialID = TM.intMaterialID
WHERE TC.intCustomerID = 1 and TJ.intStatusID = 3
ORDER BY TJ.intJobID, TM.intMaterialID
-- --------------------------------------------------------------------------------
-- Step #4.3	 This step should use the same customer as in step 4.2. Write a query to list the total cost for all materials for each completed job for the customer. Use the data returned in step 4.2 to validate your results. 
-- --------------------------------------------------------------------------------
SELECT
	TC.intCustomerID as Customer
	,TJ.intJobID as Job
	,SUM(TM.monCost * TJM.intQuantity) as Total
FROM TCustomers as TC
	JOIN TJobs as TJ 
		on TC.intCustomerID = TJ.intCustomerID
	JOIN TJobMaterials as TJM
		on TJ.intJobID = TJM.intJobID
	JOIN TMaterials as TM
		on TJM.intMaterialID = TM.intMaterialID
WHERE TC.intCustomerID = 1 and TJ.intStatusID = 3
GROUP BY TC.intCustomerID, TJ.intJobID
ORDER BY TJ.intJobID
-- --------------------------------------------------------------------------------
-- Step #4.4	 Write a query to list all jobs that have work entered for them. Include the job ID, job description, and job status description. List the total hours worked for each job with the lowest, highest, and average hourly rate. Make sure that your data includes at least one job that does not have hours logged. This job should not be included in the query. Order by highest to lowest average hourly rate. 
-- --------------------------------------------------------------------------------
SELECT 
	TJ.intJobID as JobID
	,TJ.strJobDesc as Description
	,TS.strStatus as Status
	,SUM(TJW.intHoursWorked) as TotalHours
	,MIN(TW.monHourlyRate) as Lowest
	,MAX(TW.monHourlyRate) as Highest
	,AVG(TW.monHourlyRate) as Average
	
FROM TJobs as TJ
	JOIN TStatuses as TS
		on TJ.intStatusID = TS.intStatusID
	JOIN TJobWorkers as TJW
		on TJ.intJobID = TJW.intJobID
	JOIN TWorkers as TW
		on TJW.intWorkerID = TW.intWorkerID
WHERE TJW.intHoursWorked > 0
GROUP BY TJ.intJobID, TJ.strJobDesc, TS.strStatus
ORDER BY AVG(TW.monHourlyRate) DESC
-- --------------------------------------------------------------------------------
-- Step #4.5	 Write a query that lists all materials that have not been used on any jobs. Include Material ID and Description. Order by Material ID. 
-- --------------------------------------------------------------------------------
SELECT 
	TM.intMaterialID as MaterialID
	,TM.strDescription as Description

FROM TMaterials as TM
	LEFT JOIN TJobMaterials as TJM
		on TM.intMaterialID = TJM.intMaterialID
WHERE TJM.intMaterialID IS NULL
-- --------------------------------------------------------------------------------
-- Step #4.6	 Create a query that lists all workers that worked greater than 20 hours for all jobs that they worked on. Include the Worker ID and name, number of hours worked, and number of jobs that they worked on. Order by Worker ID. 
-- --------------------------------------------------------------------------------
SELECT 
	TW.intWorkerID as WorkerID
	,TW.strLastName + ', ' + TW.strFirstName as Name
	,SUM(TJW.intHoursWorked) as HoursWorked
	,COUNT(TJW.intJobID) as TotalJobs

FROM TWorkers as TW
	JOIN TJobWorkers as TJW
		on TW.intWorkerID = TJW.intWorkerID
GROUP BY TW.intWorkerID, TW.strLastName, TW.strFirstName
HAVING SUM(TJW.intHoursWorked) > 20
ORDER BY TW.intWorkerID


-- --------------------------------------------------------------------------------
-- Step #4.7	 Create a view that includes the labor costs associated with each job. Include Customer ID and Name. 
-- --------------------------------------------------------------------------------
-- ###################################################################################
----I know you said we didn't have to, but might as well....
---###################################################################################
--CREATE VIEW VLaborCost AS
--	SELECT 
--		TJ.intJobID as intJobID
--		,(SUM(TW.monHourlyRate) * SUM(TJW.intHoursWorked)) as monLabor
--	FROM TJobs as TJ
--		JOIN TJobWorkers as TJW
--			on TJ.intJobID = TJW.intJobID
--		JOIN TWorkers as TW
--			on TJW.intWorkerID = TW.intWorkerID
--	GROUP BY TJ.intJobID;
--SELECT * FROM VLaborCost
-- --------------------------------------------------------------------------------
-- Step #4.8	 Use the View from 4.8 to create a query that includes the total labor cost for each customer. Order by Customer ID. 
-- --------------------------------------------------------------------------------
--SELECT
--	TC.intCustomerID as CustomerID
--	,TC.strLastName + ', ' + TC.strFirstName as Name
--	,SUM(VLC.monLabor) as LaborCost
--FROM TCustomers as TC
--	JOIN TJobs as TJ
--		on TC.intCustomerID = TJ.intCustomerID
--	JOIN VLaborCost as VLC
--		on TJ.intJobID = VLC.intJobID
--GROUP BY TC.intCustomerID, TC.strLastName, TC.strFirstName
--ORDER BY TC.intCustomerID

-- --------------------------------------------------------------------------------
-- Step #4.9 Write a query that lists all customers who are located on 'Main Street'. Include the customer Id and full address. Order by Customer ID. Make sure that you have at least three customers on 'Main Street' each with different house numbers. Make sure that you also have customers that are not on 'Main Street'. 
-- --------------------------------------------------------------------------------
SELECT 
	intCustomerID as CustomerID
	,strAddress as Address
FROM TCustomers
WHERE strAddress LIKE '%Main Street%'
ORDER BY intCustomerID
-- --------------------------------------------------------------------------------
-- Step #4.10 Write a query to list completed jobs that started and ended in the same month. List Job, Job Status, Start Date and End Date. 
-- --------------------------------------------------------------------------------
SELECT
	TJ.intJobID
	,TS.strStatus
	,TJ.dtmStartDate
	,TJ.dtmEndDate
FROM TJobs as TJ
	JOIN TStatuses as TS
		on TJ.intStatusID = TS.intStatusID
WHERE MONTH(TJ.dtmStartDate) = MONTH(TJ.dtmEndDate) --AND YEAR(TJ.dtmStartDate) = YEAR(TJ.dtmEndDate) --Commented because I'm not sure if you intend this to be the case.
-- --------------------------------------------------------------------------------
-- Step #4.11 Create a query to list workers that worked on three or more jobs for the same customer. 
-- --------------------------------------------------------------------------------
SELECT 
	TW.intWorkerID as Worker
	,TC.intCustomerID as Customer
	,COUNT(TC.intCustomerID) as Jobs
	
FROM TWorkers as TW
	JOIN TJobWorkers as TJW
		on TW.intWorkerID = TJW.intWorkerID
	JOIN TJobs as TJ
		on TJW.intJobID = TJ.intJobID
	JOIN TCustomers as TC
		on TJ.intCustomerID = TC.intCustomerID
GROUP BY TW.intWorkerID, TC.intCustomerID
HAVING COUNT(TC.intCustomerID) >= 3
-- --------------------------------------------------------------------------------
-- Step #4.12 Create a query to list all workers and their total # of skills. Make sure that you have workers that have multiple skills and that you have at least 1 worker with no skills. The worker with no skills should be included with a total number of skills = 0. Order by Worker ID. 
-- --------------------------------------------------------------------------------
SELECT 
	TW.intWorkerID
	,COUNT(TWS.intSkillID) as Skills
FROM TWorkers as TW
	LEFT JOIN TWorkerSkills as TWS
		on TW.intWorkerID = TWS.intWorkerID
GROUP BY TW.intWorkerID
-- --------------------------------------------------------------------------------
-- Step #4.13 Write a query to list the total Charge to the customer for each job. Calculate the total charge to the customer as the total cost of materials + total Labor costs + 30% Profit. 
-- --------------------------------------------------------------------------------
SELECT 
	TC.intCustomerID as Customer
	,TJ.intJobID as Job
	,CAST(ROUND((SUM(TW.monHourlyRate) * SUM(TJW.intHoursWorked) + SUM(TM.monCost * TJM.intQuantity)) * 1.3, 2) as MONEY) as TotalCharge
FROM TCustomers as TC
	JOIN TJobs as TJ
		on TC.intCustomerID = TJ.intCustomerID
	JOIN TJobMaterials as TJM
		on TJ.intJobID = TJM.intJobID
	JOIN TMaterials as TM
		on TJM.intMaterialID = TM.intMaterialID
	JOIN TJobWorkers as TJW
		on TJ.intJobID = TJW.intJobID
	JOIN TWorkers as TW
		on TJW.intWorkerID = TW.intWorkerID
GROUP BY TC.intCustomerID, TJ.intJobID


-- --------------------------------------------------------------------------------
-- Step #4.14 Write a query that totals what is owed to each vendor for a particular job. 
-- --------------------------------------------------------------------------------
SELECT 
	TJ.intJobID as Job
	,TV.intVendorID as Vendor
	,SUM(TJM.intQuantity) * SUM(TM.monCost) as Due
FROM  TJobs as TJ
	JOIN TJobMaterials as TJM
		on TJ.intJobID = TJM.intJobID
	JOIN TMaterials as TM
		on TJM.intMaterialID = TM.intMaterialID
	JOIN TVendors as TV
		on TM.intVendorID = TV.intVendorID
GROUP BY TV.intVendorID, TJ.intJobID
ORDER BY TJ.intJobID




