SELECT C.State, S.BookID, B.Title, SUM(S.Quantity) AS Quantity, SUM(S.UnitPrice * S.Quantity) AS TotalSales
FROM 
	Sale S 
	INNER JOIN Customer C ON C.ID = S.CustID 
	INNER JOIN Book B ON B.ID = S.BookID
WHERE 
	(C.State = 'CO' OR C.State = 'OK') AND 
    MONTH(S.Date) = 2 AND YEAR(S.Date) = 2020 AND
	-- limit books to those having only one author
    B.ID IN (
		SELECT BookID FROM BookAuthor GROUP BY BookID HAVING COUNT(*) = 1 -- limit to books by a single author
    )
GROUP BY C.State, S.BookID
ORDER BY TotalSales DESC