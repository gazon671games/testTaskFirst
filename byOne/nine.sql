SELECT        Date, ID_Manag, ID_Product, Sum, Count, count(*) as CNT
FROM            Sales
GROUP BY Date, ID_Manag, ID_Product, Sum, Count
having count(*) > 1