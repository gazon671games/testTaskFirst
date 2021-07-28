SELECT        Managers.Fio, Products.Name
FROM            Sales INNER JOIN
                         Managers ON Sales.ID_Manag = Managers.ID INNER JOIN
                         Products ON Sales.ID_Product = Products.ID
WHERE        (Sales.Date = '2021-08-22')