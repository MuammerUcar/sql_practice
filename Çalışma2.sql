--1-Database oluşturma DDL
CREATE TABLE calisma2(
id int,
first_name varchar(20),
last_name varchar(50),
father_name varchar(20),
mother_name varchar(20),
birth_day date,
phone_number int
);

INSERT INTO calisma2 VALUES (01);

INSERT INTO calisma2 VALUES ('MUAMMER');

UPDATE calisma2(first_name) VALUES(MUAMMER,NİHAL)

UPDATE calisma2
SET first_name=REPLACE(first_name,'MUAMMER','NİHAL')	

UPDATE calisma2 
SET first_name='MUAMMER'
WHERE id=1;

UPDATE calisma2
SET father_name='UÇAR'
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

SELECT *FROM calisma2;