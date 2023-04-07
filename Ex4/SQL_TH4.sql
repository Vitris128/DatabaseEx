--Cau 22
Select CT.ten_ctr,ct.diachi_ctr
from thamgia TG join cgtrinh CT on TG.stt_ctr=CT.stt_ctr
where hoten_cn = 'nguyen hong van'
and 'dec-18-1994' between TG.ngay_tgia and TG.ngay_tgia+TG.so_ngay;

--Cau 23
Select TK.HOTEN_KTS
from CGTRINH CT join THIETKE TK on CT.STT_CTR=TK.STT_CTR
where CT.TEN_THAU='phong dich vu so xd'
intersect
Select TK.HOTEN_KTS
from CGTRINH CT join THIETKE TK on CT.STT_CTR=TK.STT_CTR
where CT.TEN_THAU='cty xd so 6';

--Cau 24
select TG.HOTEN_CN
from CGTRINH CT join THAMGIA TG on CT.STT_CTR=TG.STT_CTR
where CT.TINH_THANH='can tho'
      and TG.HOTEN_CN  NOT IN
    (select TG.HOTEN_CN
    from CGTRINH CT join THAMGIA TG on CT.STT_CTR=TG.STT_CTR
where CT.TINH_THANH='vinh long');

--Cau 25
Select CT.TEN_THAU
from CGTRINH CT
where CT.KINH_PHI > all
                    (Select max(CT.KINH_PHI)
                    from CGTRINH CT
                    where CT.TEN_THAU='phong dich vu so xd');

--Cau 26
Select TK.HOTEN_KTS, TK.THU_LAO
from THIETKE TK
where TK.THU_LAO < any
(Select  AVG(TK.THU_LAO)
from THIETKE TK);

--Cau 27

Select TG.HOTEN_CN, SUM(TG.SO_NGAY)
from THAMGIA TG GROUP BY TG.HOTEN_CN having sum(TG.SO_NGAY) >
(Select sum(TG.SO_NGAY)
from THAMGIA TG
where TG.HOTEN_CN='nguyen hong van')
order by TG.HOTEN_CN;

--Cau 28
Select TG.HOTEN_CN, count(distinct TG.STT_CTR)
from THAMGIA TG 
group by TG.HOTEN_CN having count(distinct TG.STT_CTR)= 
    (Select count(*)
    from CGTRINH CT);
    
--Cau 29
Select distinct CTA.TEN_THAU, CTB.TEN_THAU
from CGTRINH CTA join CGTRINH CTB on CTA.TINH_THANH=CTB.TINH_THANH
where CTA.TEN_THAU > CTB.TEN_THAU;

--Cau 30
Select  TGA.HOTEN_CN,TGB.HOTEN_CN 
from THAMGIA TGA join THAMGIA TGB on TGA.STT_CTR=TGB.STT_CTR
where TGA.HOTEN_CN>TGB.HOTEN_CN
group by TGA.HOTEN_CN,TGB.HOTEN_CN having count(*) > 1;

--Cau 31
Select distinct TKA.HOTEN_KTS, TKB.HOTEN_KTS 
from THIETKE TKA join THIETKE TKB on TKA.STT_CTR=TKB.STT_CTR
where TKA.HOTEN_KTS > TKB.HOTEN_KTS;

--Cau 32
Select TG.HOTEN_CN, count(*)
from THAMGIA TG join CGTRINH CT on TG.STT_CTR = CT.STT_CTR
where CT.TINH_THANH = 'ha noi'
group by (TG.HOTEN_CN) having count(*) = 
(Select count(*)
from CGTRINH
where CGTRINH.TINH_THANH='ha noi');
