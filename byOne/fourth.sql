SELECT         Products.Name, Managers.Fio, sum(Sales.Count)
FROM            Sales INNER JOIN
                         Products ON Sales.ID_Product = Products.ID INNER JOIN
                         Managers ON Sales.ID_Manag = Managers.ID WHERE Products.Name='ОСБ'
GROUP BY Products.Name,Managers.Fio