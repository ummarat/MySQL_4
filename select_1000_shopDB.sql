SELECT
	customers.LName AS CustLName, 
	customers.FName AS CustFName,
	customers.MName AS CustMName,
	employees.LName AS EmpLName, 
	employees.FName AS EmpFName,
	employees.MName AS EmpMName
FROM orders
INNER JOIN customers
ON orders.CustomerNo = customers.CustomerNo
INNER JOIN employees
ON orders.EmployeeID = employees.EmployeeID
INNER JOIN orderdetails
ON orders.OrderID = orderdetails.OrderID
WHERE TotalPrice>1000
GROUP BY CustLName, CustFName, CustMName, EmpLName, EmpFName, EmpMName;
