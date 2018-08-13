connect to cs421

--frist query: list planID and for each planID count how many member have that plan

select planID, count(*) as numberOfMember \
from participateIn \
group by planID 


--second query: count how many patients visit for each provider and sort providers in descending order 
select p.providerID, p.firstName, p.lastName, p.specialty, p.experience, p.averageMemberCost, count(*) as count \
from provider p, services s \
where p.providerID = s.providerID \
group by p.providerID, p.firstName, p.lastName, p.specialty, p.experience, p.averageMemberCost \
order by count desc


--third query: find member who hasn't submit any claims 
select m.* \
from members m \
where m.memberID not in ( \
select s.memberID \
from submits s)


--fourth query: list member id who belongTo state 'AL' and also visited location '5'
select memberID \
from belongsTo b \
where b.state = 'AL' \
intersect \
select memberID \
from visits v \
where v.locationID = 5

-- list member who visited more than two different locations
select m.* \
from members m \
where m.memberID in (select v.memberID \
from visits v \
group by v.memberId \
having count(*) > 2)



