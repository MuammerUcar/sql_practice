CREATE TABLE calisanlar(
id char(5) PRIMARY KEY,--NOT NULL,UMIQUE,bu sütun başka tablo ile ilişkilendirilirken kullanılacak
isim varchar(50) UNIQUE,
maas int NOT NULL,
ise_baslama date
);--referenced table/parent

CREATE TABLE adresler(
adres_id char(5),--NULL olur, DUPLICATE olur
sokak varchar(30),
cadde varchar(30),
sehir varchar(20),
FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
);--child



INSERT INTO calisanlar VALUES('10002', 'Donatello' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10003', null, 5000, '2018-04-14');--isim:NOT NULL yok+
INSERT INTO calisanlar VALUES('10004', 'Donatello', 5000, '2018-04-14');--isim UNIQUE 
INSERT INTO calisanlar VALUES('10005', 'Michelangelo', 5000, '2018-04-14');--+
INSERT INTO calisanlar VALUES('10006', 'Leonardo', null, '2019-04-12');--maas:NOT NULL
INSERT INTO calisanlar VALUES('10007', 'Raphael', '', '2018-04-14');--maas:integer
INSERT INTO calisanlar VALUES('', 'April', 2000, '2018-04-14');--'' NULL değildir
INSERT INTO calisanlar VALUES('', 'Ms.April', 2000, '2018-04-14');--id:PK(unique)
INSERT INTO calisanlar VALUES('10002', 'Splinter' ,12000, '2018-04-14');--id:10002 zaten var
INSERT INTO calisanlar VALUES( null, 'Fred' ,12000, '2018-04-14');--id:PK:NOT NULL
INSERT INTO calisanlar VALUES('10008', 'Barnie' ,10000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'Wilma' ,11000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Betty' ,12000, '2018-04-14');

INSERT INTO adresler VALUES('10003','Ninja Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Kaya Sok', '50.Cad.','Ankara');--FK: duplicate kabul eder
INSERT INTO adresler VALUES('10002','Taş Sok', '30.Cad.','Konya');

INSERT INTO adresler VALUES('10012','Taş Sok', '30.Cad.','Konya');--calisanlarda 10012 yok


INSERT INTO adresler VALUES(NULL,'Taş Sok', '23.Cad.','Konya');
INSERT INTO adresler VALUES(NULL,'Taş Sok', '33.Cad.','Bursa');


SELECT * FROM calisanlar;
SELECT * FROM adresler;

--calisanlar tablosundan ismi 'Donatello' olanların tüm bilgilerini listeleyelim

SELECT * 
FROM calisanlar
WHERE isim='Donatello'

--calisanlar tablosundan maaşı 5000den fazla olanların tüm bilgilerini listeleyelim

SELECT *
FROM calisanlar
WHERE maas>5000

--calisanlar tablosundan maaşı 5000den fazla olanların isim ve maaslarını listeleyelim

SELECT isim,maas
FROM calisanlar
WHERE maas>5000

--adresler tablosundan sehiri 'Konya' ve 
--adres_id si 10002 olan kaydın tüm verileri getirelim

SELECT *
FROM adresler
WHERE sehir='Konya' AND adres_id='10002'

UPDATE adresler
SET sehir='Konya'
WHERE sehir='KONYA'

--sehiri 'Konya' veya 'Bursa' olan adreslerin cadde ve sehir bilgilerini getirelim.
SELECT cadde,sehir
FROM adresler
WHERE sehir='Konya' OR sehir='Bursa'

--15-DELETE FROM .. WHERE .. komutu:tablodan koşulu sağlayan kayıtları siler--DML,


CREATE TABLE ogrenciler1
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler1 VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO ogrenciler1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler1 VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO ogrenciler1 VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO ogrenciler1 VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO ogrenciler1 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler1 VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO ogrenciler1 VALUES(129, 'Mehmet Bak', 'Alihan', 89);

SELECT * FROM ogrenciler1;


--id=123 olan kaydı silelim.
DELETE FROM ogrenciler1 WHERE id=123
--ismi Kemal Tan olan kaydı silelim
DELETE FROM ogrenciler1 WHERE isim='Kemal Tan'
--ismi Ahmet Ran veya Veli Han olan kayıtları silelim
DELETE FROM ogrenciler1 WHERE isim='Ahmet Ran' OR isim='Veli Han'

--16-a-Tablodaki tüm kayıtları silme:DELETE FROM .. :koşul belitmezsek tablodaki tüm kayıtlar silinir,tablo boş durur

SELECT * FROM students;
--students tablosundaki tüm kayıtları silelim
DELETE FROM ogrenciler1

--16-b-Tablodaki tüm kayıtları silme:TRUNCATE TABLE ..

SELECT * FROM doctors;
DELETE FROM doctors
--doctors tablosundaki tüm kayıtları silelim. 
TRUNCATE TABLE doctors

--17-parent-child ilişkisi olan tablolarda silme işlemi
SELECT * FROM calisanlar;--parent
SELECT * FROM adresler;--child

--calisanlar tablosundaki tüm kayıtları silelim.
DELETE FROM calisanlar;--bazı kayıtlar adresler tablosunda referans alındığından silmez.
DELETE FROM calisanlar WHERE id='10002';--bazı kayıtlar adresler tablosunda referans alındığından silmez.


DELETE FROM adresler WHERE adres_id='10002'--referans alınan kayıt silindi, ilişki koparıldı
DELETE FROM calisanlar WHERE id='10002';--ilişki koparıldığı için, artık ref alınmadığı için siler

DELETE FROM adresler;--tüm ilişki koparıldı
DELETE FROM calisanlar;--artık hiçbir kayıt ref alınmıyor.


