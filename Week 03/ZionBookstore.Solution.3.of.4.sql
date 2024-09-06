SELECT C.State, S.BookID, B.Title, SUM(S.Quantity) AS Quantity, SUM(S.UnitPrice * S.Quantity) AS TotalSales
FROM 
	Sale S 
	INNER JOIN Customer C ON C.ID = S.CustID 
	INNER JOIN Book B ON B.ID = S.BookID
-- limit sales to states of Colorado and Oklahoma in February 2020
WHERE 
-- (C.State = 'CO' OR C.State = 'OK') AND
	C.State IN ('CO','OK') AND  -- alternate clause to avoid OR 
MONTH(S.Date) = 2 AND YEAR(S.Date) = 2020
GROUP BY C.State, S.BookID, B.Title
ORDER BY TotalSales DESC