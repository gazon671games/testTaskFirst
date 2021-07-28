/*  
1. ������� ���������� � ������� ������� ����� ��������
2. ������� ���-�� ������ �� 20 ����
3. ������� ������� ����� ������� � ������� ������;
4. ������� ������� ���������� � ����� ����� ������ ��� ������� � ������� ���;
5. ������� ��������� � �����, ������� ������� 22 �������
6. ������� ��� ������, � ������� � �������� ������� ������; � ���� �� ���� 1750
7. ����� ������ ID ������� � ������������ ��������� ��������� ����������
9. ������� ��� ���������� �� ������� �������;
10. ������� ���������� ������������� �������� � ���� �������� �� ������� , ������� ���
���������� ���������� ������ 1.
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
         Sales ON Products.ID = Sales.ID_Product WHERE Products.Name='������'

--4.
SELECT   Products.Name, Managers.Fio, sum(Sales.Count)
FROM     Sales INNER JOIN
         Products ON Sales.ID_Product = Products.ID INNER JOIN
         Managers ON Sales.ID_Manag = Managers.ID WHERE Products.Name='���'
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
WHERE    Products.Cost > 1750 AND Products.Name LIKE '%������%'

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