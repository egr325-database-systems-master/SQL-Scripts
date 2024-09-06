use zion_bookstore;
-- get all the columns of interest
SELECT S.CustID, C.State, S.BookID, B.Title, S.Quantity, S.UnitPrice * S.Quantity
FROM Sale S 
INNER JOIN Customer C ON C.ID = S.CustID 
INNER JOIN Book B ON B.ID = S.BookID