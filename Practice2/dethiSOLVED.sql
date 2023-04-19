------A
CREATE TABLE HANG_HOA_TRANG(
    MA_HANG char (2) NOT NULL,
    TEN_HANG varchar2 (15) NULL,
    MAU varchar2 (5) NULL,
    TR_LUONG int NULL
);
INSERT INTO HANG_HOA_TRANG 
SELECT * FROM HANG_HOA
WHERE HANG_HOA.MAU = 'trang';


-------B
SELECT *
FROM DU_AN
WHERE TH_PHO = 'can tho' OR TH_PHO = 'da nang' OR TH_PHO = 'ha noi';

-----C
SELECT TEN_DU_AN
FROM CUNG_UNG CU
JOIN DU_AN DA on CU.MA_DU_AN = DA.MA_DU_AN
JOIN HANG_HOA HH ON HH.MA_HANG = CU.MA_HANG
JOIN NHA_CCAP NCC ON NCC.MA_NCC = CU.MA_NCC
WHERE NCC.TEN_NCC = 'tan my' AND HH.MAU = 'xam';


-----D
SELECT TEN_DU_AN,COUNT(*)
FROM CUNG_UNG CU JOIN DU_AN DA ON CU.MA_DU_AN = DA.MA_DU_AN
GROUP BY TEN_DU_AN HAVING COUNT(*) >=2
ORDER BY TEN_DU_AN

------E
SELECT MA_DU_AN,TEN_DU_AN
FROM DU_AN
WHERE MA_DU_AN NOT IN (
SELECT DISTINCT CU.MA_DU_AN
FROM CUNG_UNG CU 
JOIN DU_AN DA ON DA.MA_DU_AN = CU.MA_DU_AN
JOIN HANG_HOA HH ON HH.MA_HANG=CU.MA_HANG
WHERE HH.MAU !='trang'
);

------ALSO E
select ma_du_an, ten_du_an
from du_an
where ma_du_an not in (
    select ma_du_an
    from cung_ung c
    where ma_hang in(
        select ma_hang
        from hang_hoa
        where mau != 'trang'
    )
);

------F
SELECT MA_DU_AN, COUNT(DISTINCT MA_HANG)
FROM CUNG_UNG
GROUP BY MA_DU_AN HAVING COUNT(DISTINCT MA_HANG) = (
SELECT COUNT(*)
FROM HANG_HOA
);


-----ALSO F
select ma_du_an ,count(distinct ma_hang)
from cung_ung
group by ma_du_an having count (distinct ma_hang) = (
    select count(distinct ma_hang)
    from hang_hoa
);