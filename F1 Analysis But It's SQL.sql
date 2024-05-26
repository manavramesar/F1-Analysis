SELECT *
FROM results;

SELECT *
FROM drivers;

-- Drivers With The Most Wins -- 
SELECT 
	concat(a.forename, " ",a.surname) as name,	
    SUM(b.positionText)
FROM drivers a
JOIN results b ON a.driverId = b.driverId
WHERE positionText = 1
GROUP BY a.driverId, name
ORDER BY 2 DESC
LIMIT 10;

-- Most Wins At Specific Tracks--

SELECT 
    COUNT(b.raceId) AS wins, 
    CONCAT(a.forename, ' ', a.surname) AS name,
    c.name AS track_name
FROM drivers a
JOIN results b ON a.driverId = b.driverId
JOIN races c ON c.raceId = b.raceId
WHERE b.positionText = '1'
GROUP BY CONCAT(a.forename, ' ', a.surname), c.name
HAVING wins >= 4
ORDER BY wins DESC;
