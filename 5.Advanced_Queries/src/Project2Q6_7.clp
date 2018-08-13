connect to cs421




--Insert result of a query : inserting members medical history of 2014 into dentalMedicalHistory table
INSERT INTO dentalMedicalHistory ( \
    SELECT c.memberID, c.date, c.procedureCode, c.cost \
    FROM claims c \
    WHERE date >='2014-01-01' AND date <= '2014-12-30')



--update plans of members who are older than 65 to medicare(planID 6)
UPDATE members \
SET planID = 6 \
WHERE age > 65 \


--calculate and update the cost of a provider
UPDATE provider \
set averageMemberCost = (SELECT avg(c.cost) \
                FROM claims c \
                WHERE c.providerID = provider.providerID \
                GROUP BY c.providerID)


--calculate and update the cost of a dentaloffice 
UPDATE dentalOffice \
set totalAverageMemberCost = (SELECT sum(averageMemberCost) \
                FROM provider p, worksAt w \
                WHERE p.providerID = w.providerID AND w.locationID = dentalOffice.locationID \
                GROUP BY w.locationID)



drop view counts
drop view avgMemberCost

--create a view that display the average cost of a general dentist, then query and select the      dentists that have cost higher than the average

CREATE VIEW avgMemberCost (avgCost) \
    AS SELECT avg(averageMemberCost) AS avgCost \
        FROM provider p \
        Where specialty = 'General'

select * from avgMemberCost

SELECT p.providerID, p.averageMemberCost \
    FROM avgMemberCost a, provider P \
    WHERE  p.averageMemberCost > a.avgCost




--create view that display the count of each procedureCodes, then query and select the most frequently done procedure

CREATE VIEW counts (procedureCode, counts) \
    AS SELECT c.procedureCode, count(c.procedureCode) as counts \
    FROM claims c \
    GROUP BY c.procedureCode


SELECT procedureCode, counts \
    FROM counts c \
	WHERE counts = (SELECT max(counts) from counts)
  


















