create database bt1;
use bt1;
CREATE TABLE Khuvuc (
    IP VARCHAR(20) PRIMARY KEY NOT NULL,
    tenkhuvuc VARCHAR(20) NOT NULL,
    tang VARCHAR(10)
);
CREATE TABLE Phong (
	MP VARCHAR(5) PRIMARY KEY NOT NULL,
    tenphong VARCHAR(10) NOT NULL,
    somay TINYINT,
    IP VARCHAR(20),
    FOREIGN KEY (IP) REFERENCES khuvuc(IP)
);

CREATE TABLE Loai(
    idLoai VARCHAR(10) PRIMARY KEY,
    tenloai VARCHAR(25) NOT NULL
);

CREATE TABLE May(
    idMay VARCHAR(5) PRIMARY KEY,
    tenmay VARCHAR(10),
    IP VARCHAR(20),
    ad TINYINT,
    idLoai VARCHAR(10),
    MP VARCHAR(5),
    FOREIGN KEY (IP) REFERENCES Khuvuc(IP),
    FOREIGN KEY (IP) REFERENCES khuvuc(IP),
    FOREIGN KEY (idLoai) REFERENCES Loai(idLoai),
    FOREIGN KEY (MP) REFERENCES Phong(MP)
);
CREATE TABLE Phanmem(
    idPM VARCHAR(10) PRIMARY KEY,
    tenPM VARCHAR(20) NOT NULL,
    ngaymua DATE,
    version VARCHAR(5),
    idLoai VARCHAR(10),
    FOREIGN KEY (idLoai) REFERENCES Loai(idLoai),
    gia INT CHECK(gia > 0)
);
CREATE TABLE Caidat(
    id TINYINT,
    idMay VARCHAR(5),
    idPM VARCHAR(10),
    FOREIGN KEY (idMay) REFERENCES May(idMay),
    FOREIGN KEY (idPM) REFERENCES Phanmem(idPM),
    ngaycai DATE DEFAULT '2023-03-13'
);
-- Khu vuc
INSERT INTO Khuvuc VALUES('130.120.84','Brin RDC', null);
INSERT INTO Khuvuc VALUES('130.120.81','Brin', 'tang 1');
INSERT INTO Khuvuc VALUES('130.120.82','Brin', 'tang 2');
INSERT INTO Khuvuc VALUES('130.120.83','', '');

-- Phong
INSERT INTO Phong VALUES('s01','Salle 1',3, '130.120.80');
INSERT INTO Phong VALUES('s02','Salle 2',2, '130.120.80');
INSERT INTO Phong VALUES('s03','Salle 3',2, '130.120.80');
INSERT INTO Phong VALUES('s11','Salle 11',2, '130.120.81');
INSERT INTO Phong VALUES('s12','Salle 12',1, '130.120.81');
INSERT INTO Phong VALUES('s21','Salle 21',2, '130.120.82');
INSERT INTO Phong VALUES('s22','Salle 22',0, '130.120.83');
INSERT INTO Phong VALUES('s23','Salle 23',0, '130.120.83');

--Loai
INSERT INTO Loai VALUES('TX','Terminal X-Window');
INSERT INTO Loai VALUES('UNIX','Système Unix');
INSERT INTO Loai VALUES('PCNT','PC Windows NT');
INSERT INTO Loai VALUES('PCWS','PC Windows');
INSERT INTO Loai VALUES('NC','Network Computer');
INSERT INTO Loai VALUES('BeOS',' ');

-- May
INSERT INTO May VALUES('p1','Poste 1','130.120.80',01,'TX','s01');
INSERT INTO May VALUES('p2','Poste 2','130.120.80',02,'UNIX','s01');
INSERT INTO May VALUES('p3','Poste 3','130.120.80',03,'TX','s01');
INSERT INTO May VALUES('p4','Poste 4','130.120.80',04,'PCWS','s02');
INSERT INTO May VALUES('p5','Poste 5','130.120.80',05,'PCWS','s02');
INSERT INTO May VALUES('p6','Poste 6','130.120.80',06,'UNIX','s03');
INSERT INTO May VALUES('p7','Poste 7','130.120.80',07,'TX','s03');
INSERT INTO May VALUES('p8','Poste 8','130.120.81',01,'UNIX','s11');
INSERT INTO May VALUES('p9','Poste 9','130.120.81',02,'TX','s11');
INSERT INTO May VALUES('p10','Poste 10','130.120.81',03,'UNIX','s12');
INSERT INTO May VALUES('p11','Poste 11','130.120.82',01,'PCNT','s21');
INSERT INTO May VALUES('p12','Poste 12','130.120.82',02,'PCWS','s21');

-- Phanmem
INSERT INTO Phanmem VALUES('log1','Oracle 6','1995-05-13','6.2','UNIX',3000);
INSERT INTO Phanmem VALUES('log2','Oracle 8','1999-09-15','8i','UNIX',5600);
INSERT INTO Phanmem VALUES('log3','SQL Server','1998-04-12','7','PCNT',2700);
INSERT INTO Phanmem VALUES('log4','Front Page','1997-06-03','5','PCWS',500);
INSERT INTO Phanmem VALUES('log5','WinDev','1997-05-12','5','PCWS',750);
INSERT INTO Phanmem VALUES('log6','SQL*Net','2000-01-01','2.0','UNIX',500);
INSERT INTO Phanmem VALUES('log7','I* I* S*','2002-04-12','2','PCNT',810);
INSERT INTO Phanmem VALUES('log8','DreamWeaver','2003-09-21','2.0','BeOS',1400);

--caidat
INSERT INTO Caidat VALUES('p2','log1',1,'2003-05-15');
INSERT INTO Caidat VALUES('p2','log2',2,'2003-09-17');
INSERT INTO Caidat VALUES('p4','log5',3,'2003-01-01');
INSERT INTO Caidat VALUES('p6','log6',4,'2003-05-20');
INSERT INTO Caidat VALUES('p6','log1',5,'2003-05-20');
INSERT INTO Caidat VALUES('p8','log2',6,'2003-05-19');
INSERT INTO Caidat VALUES('p8','log6',7,'2003-05-20');
INSERT INTO Caidat VALUES('p11','log3',8,'2003-04-20');
INSERT INTO Caidat VALUES('p12','log4',9,'2003-04-20');
INSERT INTO Caidat VALUES('p11','log7',10,'2003-04-20');
INSERT INTO Caidat VALUES('p7','log7',11,'2003-04-01');

--Update
UPDATE Khuvuc SET tang='0' WHERE IP='130.120.80';
UPDATE Khuvuc SET tang='1' WHERE IP='130.120.81';
UPDATE Khuvuc SET tang='2' WHERE IP='130.120.82';

UPDATE Phanmem SET gia=0.9*gia WHERE idLoai = 'PCNT';


ALTER TABLE May ADD nbLog SMALLINT;
ALTER TABLE Phanmem ADD nbInstall SMALLINT;
UPDATE May SET nbLog = '0' WHERE idMay = 'p1' OR idMay =  'p3' OR idMay =  'p5' OR  idMay = 'p9' OR idMay =  'p10';
update May set nbLog = '1' where idMay = 'p4' or idMay = 'p7' or idMay = 'p12';
update May set nbLog = '2' where idMay = 'p2' or idMay = 'p6' or idMay = 'p8' or idMay = 'p11';
update phanmem set nbInstall = '2' where idPM = 'log1' or idPM = 'log2' or idPM = 'log6' or idPM = 'log7';
update phanmem set nbInstall = '1' where idPM = 'log3' or idPM = 'log4' or idPM = 'log5';

create table PhanmemUNIX(
	idPM VARCHAR(10) not null,
    tenPM VARCHAR(20) not null,
    ngaymua DATE,
    version VARCHAR(5)
);
alter table phanmemunix add primary key (idPM);
alter table phanmemunix add gia int;
alter table phanmemunix modify version varchar(20);
alter table phanmemunix add unique (tenPM);
insert into phanmemunix(idPM, tenPM, ngaymua, version, gia) 
		select idPM, tenPM, ngaymua, version, gia from phanmem;
alter table phanmemunix drop column version;
set foreign_key_checks=0;
delete from phanmem where gia > 5000;
set foreign_key_checks=1;

set foreign_key_checks=0;
delete from phanmemunix where gia > 5000;
set foreign_key_checks=1;

set foreign_key_checks=0;
drop table phanmem;
drop table phanmemunix;

alter table phanmem drop column nbInstall;
alter table may drop column nbLog;

