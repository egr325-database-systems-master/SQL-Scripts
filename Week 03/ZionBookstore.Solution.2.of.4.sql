SELECT C.State, S.BookID, SUM(S.Quantity) AS Quantity, SUM(S.UnitPrice * S.Quantity) AS TotalSales
FROM 
	Sale S 
	INNER JOIN Customer C ON C.ID = S.CustID 
	INNER JOIN Book B ON B.ID = S.BookID
-- group by combination of state and book ID to determine best sellers by state
GROUP BY C.State, S.BookID
ORDER BY TotalSales DESC -- list the highest sales first