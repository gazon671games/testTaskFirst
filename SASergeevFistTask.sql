/*  
1. Вывести менеджеров у которых имеется номер телефона
2. Вывести кол-во продаж за 20 июня
3. Вывести среднюю сумму продажи с товаром Фанера;
4. Вывести фамилии менеджеров и общую сумму продаж для каждого с товаром ОСБ;
5. Вывести менеджера и товар, который продали 22 августа
6. Вывести все товары, у которых в названии имеется Фанера; и цена не ниже 1750
7. Найти список ID товаров с максимальной суммарной зарплатой сотрудника
9. Удалить все повторения из таблицы Продажа;
10. Вывести количество повторяющихся значений и сами значения из таблицы , Продажа где
количество повторений больше 1.
*/  

-- 1.
SELECT *
FROM    Managers WHERE Phone IS NOT NULL;

--2.
SELECT  sum(Count)
FROM    Sales WHERE Date = '2021.07.20'

--3.
SELECT   AVG(Count)
FROM     Products INNER JOIN
         Sales ON Products.ID = Sales.ID_Product WHERE Products.Name='Фанера'

--4.
SELECT   Products.Name, Managers.Fio, sum(Sales.Count)
FROM     Sales INNER JOIN
         Products ON Sales.ID_Product = Products.ID INNER JOIN
         Managers ON Sales.ID_Manag = Managers.ID WHERE Products.Name='ОСБ'
GROUP BY Products.Name,Managers.Fio

--5.
SELECT   Managers.Fio, Products.Name
FROM     Sales INNER JOIN
         Managers ON Sales.ID_Manag = Managers.ID INNER JOIN
         Products ON Sales.ID_Product = Products.ID
WHERE   (Sales.Date = '2021-08-22')

--6.
SELECT   Products.Name, Products.Cost
FROM     Sales INNER JOIN
         Managers ON Sales.ID_Manag = Managers.ID INNER JOIN
         Products ON Sales.ID_Product = Products.ID
WHERE    Products.Cost > 1750 AND Products.Name LIKE '%Фанера%'

--7.
SELECT   Products.ID, MAX(Managers.Salary) AS Expr1
FROM     Sales INNER JOIN
         Managers ON Sales.ID_Manag = Managers.ID INNER JOIN
         Products ON Sales.ID_Product = Products.ID
GROUP BY Products.ID

--9.
Delete FROM Sales
Where id not in
(
	select min(id) as MinRowID
	FROM Sales
	group by Date, ID_Manag, ID_Product, Sum, Count
)

--10.
SELECT  Date, ID_Manag, ID_Product, Sum, Count, count(*) as CNT
FROM    Sales
GROUP BY Date, ID_Manag, ID_Product, Sum, Count
having count(*) > 1