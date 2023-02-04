-- Завдання 2
CREATE DATABASE MyJoinsDB;

-- Завдання 3
USE MyJoinsDB;

CREATE TABLE Employees
  (Empl_ID int NOT NULL,
   FName nvarchar(15) NOT NULL,
   LName nvarchar(15) NOT NULL,
   phone  nvarchar(15) NOT NULL
   );
   
CREATE TABLE Positions
  (Empl_ID int NOT NULL ,   
   salary int NOT NULL,
   title varchar(60) NOT NULL
   );
   
CREATE TABLE Personal
  (Empl_ID int NOT NULL,
  Fam_status varchar(25) NOT NULL,
  Bthday date NOT NULL,
  Address nvarchar(45) NOT NULL
  );
  
  ALTER TABLE Employees
  ADD CONSTRAINT Employe_ID PRIMARY KEY (Empl_ID);
  
   ALTER TABLE Positions
  ADD CONSTRAINT Posit_ID PRIMARY KEY (Empl_ID);
  
   ALTER TABLE Personal
  ADD CONSTRAINT Pers_ID PRIMARY KEY (Empl_ID);
  
INSERT Employees
(Empl_ID, FName, LName, phone )
VALUES
(1, 'Петро', 'Петренко','0931112233'),
(2, 'Самійло', 'Дереча', '0965478956'),
(3, 'Марічка', 'Плис', '0963332211'),
(4, 'Ганна', 'Щеглова', '0936988774'),
(5, 'Вікентій', 'Рудик', '0981225265');

INSERT Positions 
(Empl_ID,  title, salary)
VALUES
(1, 'Директор', 50000),
(2, 'Менеджер', 30000 ),
(3, 'Менеджер', 28000),
(4, 'Робочий 1', 10000),
(5, 'Робочий 2', 10000);

INSERT Personal
(Empl_ID, Fam_status, Bthday, Address)
VALUES
(1, 'в шлюбі', '1976-10-01', 'вул. Молодіжна, 3'),
(2, 'в шлюбі', '1986-11-21', 'вул. Квітнева, 5, кв. 2'),
(3, 'не в шлюбі', '1989-02-28', 'вул. Сонячна, 45, кв. 34'),
(4, 'в шлюбі', '1992-12-14', 'вул. Лісова, 7'),
(5, 'в шлюбі', '1989-02-23', 'вул. Героїв Небесної сотні, 124, кв. 77');

select * from Employees;
select * from Positions;
select * from Personal;

-- Завдання 4
SELECT Employees.Empl_ID, Employees.phone, Personal.Address 
FROM Employees
INNER JOIN Personal 
ON Employees.Empl_ID = Personal.Empl_ID;

SELECT Employees.Empl_ID, Employees.phone, Personal.Fam_status
FROM Personal
INNER JOIN Employees 
ON Employees.Empl_ID = Personal.Empl_ID
WHERE Personal.Fam_status = 'не в шлюбі';

SELECT Positions.title, Employees.phone, Personal.Bthday
FROM Positions
INNER JOIN Employees 
ON Employees.Empl_ID = Positions.Empl_ID
INNER JOIN Personal 
ON Personal.Empl_ID = Positions.Empl_ID
WHERE Positions.title = 'Менеджер';