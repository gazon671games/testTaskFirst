SELECT        AVG(Count)
FROM            Products INNER JOIN
                         Sales ON Products.ID = Sales.ID_Product WHERE Products.Name='Фанера'