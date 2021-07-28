SELECT        Products.Name, Products.Cost
FROM            Sales INNER JOIN
                         Managers ON Sales.ID_Manag = Managers.ID INNER JOIN
                         Products ON Sales.ID_Product = Products.ID
WHERE Products.Cost > 1750 AND Products.Name LIKE '%Фанера%'