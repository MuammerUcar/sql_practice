--1-Database oluşturma DDL
CREATE TABLE calisma2(
id SERIAL,
first_name varchar(20),
last_name varchar(50),
father_name varchar(20),
mother_name varchar(20),
birth_day date,
phone_number int UNIQUE
);

INSERT INTO calisma2 VALUES (01);

INSERT INTO calisma2(first_name) VALUES ('MUAMMER');

UPDATE calisma2
SET first_name='NİHAL'
WHERE first_name='MUAMMER'

SELECT * FROM calisma2

INSERT INTO calisma2(first_name,phone_number) VALUES('MUAMMER',0505111111)
INSERT INTO calisma2(last_name,phone_number) VALUES('UÇAR',5051111112)
UPDATE calisma2
SET first_name=REPLACE(first_name,'MUAMMER','NİHAL')	

UPDATE calisma2 
SET first_name='MUAMMER'
WHERE id='1';

UPDATE calisma2
SET last_name='UÇAR'
WHERE first_name='MUAMMER'

UPDATE calisma2
SET father_name='HAKKI'
WHERE first_name='MUAMMER' AND last_name='UÇAR'

UPDATE calisma2
SET mother_name='MACİDE'
WHERE first_name='MUAMMER' OR last_name='UÇAR'

UPDATE calisma2
SET birth_day='10-12-1977'
WHERE id=1;

UPDATE calisma2
SET phone_number=0545111111
WHERE birth_day='1977-12-10'

-- id’si 01 olan çalışanın ismini 'Veli Yıldırım' ve 
--sehirini 'Bursa' olarak güncelleyiniz.

UPDATE calisma2
SET first_name='Veli Yıldırım',sehir='Bursa'
WHERE id='1'

ALTER TABLE calisma2
DROP COLUMN phone_number

DROP TABLE calisma2

SELECT * FROM calisma2

ALTER TABLE calisma2
ADD COLUMN sehir varchar

--4-mevcut olan bir tablodan yeni bir tablo oluşturma

CREATE TABLE calisma3 AS SELECT id,first_name,last_name FROM calisma2

SELECT * FROM calisma3;

UPDATE calisma3
SET idfirst_name='Ahsen',last_name='Uçar'
WHERE id,first_name,last_name

INSERT INTO calisma3 VALUES(0,'Ahsen','Uçar');

ALTER TABLE calisma3
DROP row

CREATE TABLE grades AS SELECT name,grade FROM students;

SELECT * FROM grades;

CREATE TABLE calisma4 AS SELECT first_name FROM calisma3

SELECT * FROM  calisma4

ALTER TABLE calisma4
ADD COLUMN last_name varchar(50)

UPDATE calisma4
SET last_name='Uçar'
WHERE first_name='Ahsen'



ALTER TABLE calisma4
ADD COLUMN sehir varchar

INSERT INTO calisma4(sehir) VALUES ('Hatay')

UPDATE calisma4
SET Sehir='HATAY'
WHERE last_name='Uçar'

UPDATE calisma4 SET first_name='Muammer',last_name='Uçar'
WHERE Sehir='Hatay'

UPDATE calisma4
SET Sehir='HATAY'
WHERE Sehir='Hatay'

--ismi Kemal Tan olan kaydı silelim
DELETE FROM calisma4 WHERE first_name='Ahsen';

SELECT first_name FROM calisma4
SELECT last_name FROM calisma4
SELECT * FROM calisma4