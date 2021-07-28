SELECT        Products.ID, MAX(Managers.Salary) AS Expr1
FROM            Sales INNER JOIN
                         Managers ON Sales.ID_Manag = Managers.ID INNER JOIN
                         Products ON Sales.ID_Product = Products.ID
GROUP BY Products.ID