CREATE TABLE CUNG_UNG (
	MA_NCC char (2) NOT NULL,
	MA_HANG char (2) NOT NULL,
	MA_DU_AN char (2) NOT NULL,
	SO_LUONG int NULL
);

CREATE TABLE DU_AN (
	MA_DU_AN char (2) NOT NULL,
	TEN_DU_AN varchar2 (15) NULL,
	TH_PHO varchar2 (20) NULL
);


CREATE TABLE HANG_HOA (
MA_HANG char (2) NOT NULL,
TEN_HANG varchar2 (15) NULL,
MAU varchar2 (5) NULL,
TR_LUONG int NULL
);

CREATE TABLE NHA_CCAP (
	MA_NCC char (2) NOT NULL,
	TEN_NCC varchar2 (15) NULL,
	VON int NULL,
	TH_PHO varchar2 (15) NULL
);

ALTER TABLE CUNG_UNG ADD
CONSTRAINT PK_CUNG_UNG PRIMARY KEY
(MA_NCC, MA_HANG, MA_DU_AN);

ALTER TABLE DU_AN ADD
CONSTRAINT PK_DU_AN PRIMARY KEY
(MA_DU_AN) ;

ALTER TABLE CUNG_UNG ADD
CONSTRAINT FK_CUNG_UNG_HANG_HOA FOREIGN KEY
(MA_HANG) REFERENCES HANG_HOA ( MA_HANG );

ALTER TABLE NHA_CCAP ADD
CONSTRAINT PK_NHA_CCAP PRIMARY KEY (MA_NCC);

ALTER TABLE HANG_HOA ADD
CONSTRAINT PK_HANG_HOA PRIMARY KEY
(MA_HANG);

ALTER TABLE CUNG_UNG ADD
CONSTRAINT FK_CUNG_UNG_DU_AN FOREIGN KEY
(MA_DU_AN ) REFERENCES DU_AN ( MA_DU_AN);


ALTER TABLE CUNG_UNG ADD
CONSTRAINT FK_CUNG_UNG_NHA_CCAP FOREIGN KEY
(MA_NCC ) REFERENCES NHA_CCAP (MA_NCC);

insert into du_an values ('j1', 'tan phu', 'can tho');
insert into du_an values ('j2', 'tan an', 'da nang');
insert into du_an values ('j3', 'tan thanh', 'ha noi');
insert into du_an values ('j4', 'tan longn long', 'ha noi');
insert into du_an values ('j5', 'tan long', 'tp ho chi minh');
insert into du_an values ('j6', 'tan my', 'bien hoa');
insert into du_an values ('j7', 'tan my', 'tp ho chi minh');

insert into hang_hoa values ('p1','son bach tuyet', 'trang',5);
insert into hang_hoa values ('p2','son bach tuyet', 'do',5);
insert into hang_hoa values ('p3','xi mang hoang t', 'trang',50);
insert into hang_hoa values ('p4','xi mang ha tien', 'xam',50);
insert into hang_hoa values ('p5','gach men', 'trang',10);
insert into hang_hoa values ('p6','gach men', 'xanh',10);
insert into hang_hoa values ('p7','chao ga', 'trang',200);

insert into nha_ccap values ('s1','tan phu',20,'tp ho chi minh');
insert into nha_ccap values ('s2','tan an',10,'can tho');
insert into nha_ccap values ('s3','tan thanh',30,'can tho');
insert into nha_ccap values ('s4','tan long',20,'tp ho chi minh');
insert into nha_ccap values ('s5','tan my',30,'ha noi');

insert into cung_ung values ('s1','p1','j1',200);
insert into cung_ung values ('s1','p1','j4',700);
insert into cung_ung values ('s2','p3','j1',400);
insert into cung_ung values ('s2','p3','j2',200);
insert into cung_ung values ('s2','p3','j3',200);
insert into cung_ung values ('s2','p3','j4',500);
insert into cung_ung values ('s2','p3','j5',600);
insert into cung_ung values ('s2','p3','j6',400);
insert into cung_ung values ('s2','p3','j7',800);
insert into cung_ung values ('s2','p5','j2',100);
insert into cung_ung values ('s3','p3','j1',200);
insert into cung_ung values ('s3','p4','j2',500);
insert into cung_ung values ('s4','p2','j5',1200);
insert into cung_ung values ('s4','p6','j3',300);
insert into cung_ung values ('s4','p6','j7',300);
insert into cung_ung values ('s5','p1','j4',1000);
insert into cung_ung values ('s5','p2','j2',200);
insert into cung_ung values ('s5','p2','j4',100);
insert into cung_ung values ('s5','p3','j4',1200);
insert into cung_ung values ('s5','p4','j4',800);
insert into cung_ung values ('s5','p5','j4',400);
insert into cung_ung values ('s5','p5','j5',500);
insert into cung_ung values ('s5','p5','j7',100);
insert into cung_ung values ('s5','p6','j2',200);
insert into cung_ung values ('s5','p6','j4',500);
insert into cung_ung values ('s2','p7','j4',500);
insert into cung_ung values ('s5','p7','j1',500);