CREATE DATABASE Друзья_человека;
USE Друзья_человека;



CREATE TABLE Животные (
    id INT AUTO_INCREMENT PRIMARY KEY,
    вид VARCHAR(50)
);

CREATE TABLE Домашние_животные (
    id INT AUTO_INCREMENT PRIMARY KEY,
    животное_id INT,
    имя VARCHAR(50),
    команды TEXT,
    дата_рождения DATE,
    FOREIGN KEY (животное_id) REFERENCES Животные(id)
);

CREATE TABLE Вьючные_животные (
    id INT AUTO_INCREMENT PRIMARY KEY,
    животное_id INT,
    имя VARCHAR(50),
    команды TEXT,
    дата_рождения DATE,
    FOREIGN KEY (животное_id) REFERENCES Животные(id)
);

INSERT INTO Животные (вид) VALUES ('Собака'), ('Кошка'), ('Хомяк'), ('Лошадь'), ('Верблюд'), ('Осёл');

INSERT INTO Домашние_животные (животное_id, имя, команды, дата_рождения)
VALUES 
(1, 'Бобик', 'сидеть, лежать', '2022-06-15'),
(2, 'Мурка', 'ко мне, прыг', '2021-05-10'),
(3, 'Флэш', 'беги, стой', '2023-01-20');

INSERT INTO Вьючные_животные (животное_id, имя, команды, дата_рождения)
VALUES 
(4, 'Гром', 'вперёд, стой', '2020-08-30'),
(5, 'Султан', 'вперёд, назад', '2019-09-18'),
(6, 'Иа', 'груз, стой', '2021-12-01');

DELETE FROM Вьючные_животные WHERE животное_id = 5;

CREATE TABLE Лошади_и_Ослики AS
SELECT * FROM Вьючные_животные WHERE животное_id IN (4, 6);

CREATE TABLE Молодые_животные AS
SELECT *, TIMESTAMPDIFF(MONTH, дата_рождения, CURDATE()) AS возраст_в_месяцах
FROM (SELECT * FROM Домашние_животные UNION SELECT * FROM Лошади_и_Ослики) AS temp
WHERE TIMESTAMPDIFF(YEAR, дата_рождения, CURDATE()) BETWEEN 1 AND 3;

CREATE TABLE Все_животные AS
SELECT * FROM Домашние_животные 
UNION 
SELECT * FROM Лошади_и_Ослики;
