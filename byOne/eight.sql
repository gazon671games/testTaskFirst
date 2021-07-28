Delete FROM Sales
Where id not in
(
	select min(id) as MinRowID
	FROM Sales
	group by Date, ID_Manag, ID_Product, Sum, Count
)