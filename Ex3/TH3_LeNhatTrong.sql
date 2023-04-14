-- CAU 1
Select * 
    from TACPHAM;
Select * 
    from DOCGIA;
Select * 
    from SACH;
Select * 
    from MUON;

-- CAU 2
        -- https://dbdiagram.io/d/6425a92a5758ac5f172582a8

-- CAU 3
Select NT, tua 
    from TACPHAM 
    where tacgia='Guy de Maupassant';
-- CAU 4
Select *
    from DOCGIA 
    where dchi='32 rue des Alouettes, 75003 Paris';
-- CAU 5
Select nxb
    from TACPHAM TP join SACH S on TP.NT=S.NT
    where TP.tua like '%Fleur%';
-- CAU 6
Select tua
    from TACPHAM
    where tua like 'Le%';
-- CAU 7
Select ho,ten
    from DOCGIA DG join MUON M on DG.ND=M.ND
    where ngaymuon>='9-15-2007' AND ngaymuon<='9-20-2007';
-- CAU 8
Select nxb
    from SACH S join TACPHAM TP on S.NT=TP.NT
    where TP.tua like '%Germinal%';
-- CAU 9
Select ho,ten
    from DOCGIA DG join MUON M on DG.ND=M.ND join SACH S on S.NS=M.NS join TACPHAM TP on TP.NT=S.NT
    where TP.tua='Po?e';
-- CAU 10
Select ho,ten
    from DOCGIA DG join MUON M on DG.ND=M.ND join SACH S on S.NS=M.NS join TACPHAM TP on TP.NT=S.NT
    where TP.tua='Les Fleurs du mal';
-- CAU 11
Select TP.tua,DG.ho,DG.ten
    from TACPHAM TP join SACH S on TP.NT=S.NT join MUON M on S.NS=M.NS join DOCGIA DG on DG.ND=M.ND
    where M.ngaytra>M.hantra;
-- CAU 12
Select TP.tua,DG.ho,DG.ten
    from TACPHAM TP join SACH S on TP.NT=S.NT join MUON M on S.NS=M.NS join DOCGIA DG on DG.ND=M.ND
    where M.ngaytra<=M.hantra;
-- CAU 13
Select ho,ten
    from DOCGIA DG join MUON M on DG.ND=M.ND join SACH S on S.NS=M.NS join TACPHAM TP on TP.NT=S.NT
    where TP.tacgia='Victor Hugo';
-- CAU 14
Select ho,ten,tua
    from DOCGIA DG join MUON M on DG.ND=M.ND join SACH S on S.NS=M.NS join TACPHAM TP on TP.NT=S.NT
    where extract(year from M.ngaymuon)=2007;
-- CAU 15
Select COUNT(NT)
    from TACPHAM;
-- CAU 16
Select TP.tua,count(*) SoLuong
    from TACPHAM TP join SACH S on TP.NT=S.NT
    group by TP.tua
    having count(*)>=2;
-- CAU 17

-- CAU 18

-- CAU 19

-- CAU 20

-- CAU 21

-- CAU 22

-- CAU 23

-- CAU 24

-- CAU 25


-- CAU 26


-- CAU 27


-- CAU 28


-- CAU 29


-- CAU 30


-- CAU 31

