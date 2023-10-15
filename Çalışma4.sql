--18-ON DELETE CASCADE:kademeli silme işlemini otomatikleştirir
CREATE TABLE talebeler
(
id int primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);--parent

CREATE TABLE notlar( 
talebe_id int,
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id) ON DELETE CASCADE	
);--child

INSERT INTO talebeler VALUES(122, 'Kerem Can', 'Fatma',75);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Veli Han', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Tan', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Ahmet Ran', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO talebeler VALUES(128, 'Mustafa Bak', 'Ali', 99);
INSERT INTO talebeler VALUES(129, 'Mehmet Bak', 'Alihan', 89);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);
INSERT INTO notlar VALUES ('127', 'Matematik',90);
INSERT INTO notlar VALUES (null, 'tarih',90);

SELECT * FROM talebeler;
SELECT * FROM notlar;

--notlar tablosundan id:123 olan kaydı silelim.
DELETE FROM notlar WHERE talebe_id=123;

--talebeler tablosundan id:126 olan kaydı silelim.
--parenttan referanslı kayıt silmek için aşamalı(cascade)
--silme yapmalıydık
--on delete cascade öz önce notlar tablosundan ref. siler
--sonra parenttan ref. kaldırılan kaydı siler.

DELETE FROM talebeler WHERE id=126;

DELETE FROM talebeler;--notlar tablosundan da sadece ref. olan kayıtları siler
