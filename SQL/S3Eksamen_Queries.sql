--select agent.id, agent.username,  from agent
--join person on agent.id = person.id

SELECT	
	p.id, 
	p.name, 
	p.nationality, 
	p.cpr, 
	ag.username, 
	ISNULL(ad.areacode, 0) as areacode, 
	ISNULL(ad.street, '') as street, 
	ISNULL(ap.height, 0) as height, 
	ISNULL(ap.eyecolor, '') as eyecolor, 
	ISNULL(ap.haircolor, '') as haircolor, 
	ISNULL(im.data, 0x00) as data
FROM person as p
	JOIN agent as ag ON ag.id = p.id
	JOIN address as ad ON ad.id = p.id
	JOIN appearence as ap ON ap.id = p.id
	JOIN image as im ON im.id = p.id
WHERE p.id = 1


SELECT 
	p.id, 
	p.name, 
	p.nationality, 
	p.cpr, 
	inf.username, 
	inf.currency, 
	inf.paymenttype, 
	inf.tags, 
	ISNULL(ad.areacode, 0) as areacode, 
	ISNULL(ad.street, '') as street, 
	ISNULL(ap.height, 0) as height, 
	ISNULL(ap.eyecolor, '') as eyecolor, 
	ISNULL(ap.haircolor, '') as haircolor, 
	ISNULL(im.data, 0x00) as data
FROM person as p
	JOIN informer as inf ON inf.id = p.id
	JOIN address as ad ON ad.id = p.id
	JOIN appearence as ap ON ap.id = p.id
	JOIN image as im ON im.id = p.id
WHERE p.id = 1

SELECT 
	p.id, 
	p.name, 
	p.nationality, 
	p.cpr, 
	obs.tags, 
	ISNULL(ad.areacode, 0) as areacode, 
	ISNULL(ad.street, '') as street, 
	ISNULL(ap.height, 0) as height, 
	ISNULL(ap.eyecolor, '') as eyecolor, 
	ISNULL(ap.haircolor, '') as haircolor, 
	ISNULL(im.data, 0x00) as data
FROM person as p
	JOIN observed as obs ON obs.id = p.id
	JOIN address as ad ON ad.id = p.id
	JOIN appearence as ap ON ap.id = p.id
	JOIN image as im ON im.id = p.id
WHERE p.id = 1