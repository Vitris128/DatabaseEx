--2
Select L.tenloai
from May M join Loai L on M.idloai=L.idloai
where M.idMay='p8';

--3
Select tenPM
from Phanmem
where idloai='UNIX';

--4
Select  P.MP, P.tenphong, P.IP
from Phong P join May M on P.MP=M.MP
where M.idloai='UNIX' OR M.idloai='PCWS';

--5
Select P.MP, P.tenphong, P.IP
from Phong P join May M on P.MP=M.MP
where (M.idloai='UNIX' OR M.idloai='PCWS')
AND P.IP='130.120.80'
order by P.MP;

--6
Select count(*)
from Caidat
where idMay='p6';

--7
Select count(*)
from Caidat
where idPM='log1';

--8
Select TENMAY ,IP||'.'||AD
from May
where IDLOAI='TX';

--9
Select IDMAY,COUNT(IDMAY) SOPM
from CAIDAT
group by IDMAY;

--10
Select MP,COUNT(MP) SOMAY 
from MAY 
group by MP;

--11
Select idPM,COUNT(idPM) 
from CAIDAT group by idPM;

--12
Select AVG(GIA) 
from PHANMEM 
where IDLOAI='UNIX';

--13
Select MAX(NGAYMUA) NGAYMUAGANNHAT 
from PHANMEM;

--14
Select COUNT(COUNT(idPM)) 
from CAIDAT 
group by idPM having COUNT(idPM) >=2;

--15
Select L.IDLOAI, L.TENLOAI from LOAI L left join MAY M on L.IDLOAI=M.IDLOAI where M.IDLOAI IS NULL;

Select IDLOAI from LOAI minus Select IDLOAI from MAY;

--16
Select DISTINCT(M.IDLOAI), L.TENLOAI
from MAY M join PHANMEM PM on M.IDLOAI=PM.IDLOAI join Loai L on M.IDLOAI = L.IDLOAI;

Select distinct(idLoai)
from MAY where idLoai in (
  Select idLoai
  from PHANMEM);
--17
Select DISTINCT(M.IDLOAI), L.TENLOAI
from MAY M left join PHANMEM PM on M.IDLOAI=PM.IDLOAI join Loai L on M.IDLOAI = L.IDLOAI
where PM.IDLOAI IS NULL;

Select distinct(idLoai)
from May where idLoai NOT IN (
  Select idLoai
  from PHANMEM);
--18
Select M.TENMAY,M.IP||'.'||AD
from CAIDAT CD join MAY M on CD.IDMAY = M.IDMAY  
where CD.IDPM='log6';

--19
Select M.TENMAY,M.IP||'.'||AD
from CAIDAT CD join PHANMEM PM on CD.IDPM = PM.IDPM join MAY M on CD.IDMAY = M.IDMAY  
where PM.TENPM='Oracle 8';

--20
Select KV.TENKHUVUC
from KHUVUC KV
where KV.IP = (Select IP
from May
group by IP,IDLOAI having IDLOAI='TX' AND COUNT(IDLOAI)=3);

--21
Select DISTINCT(P.TENPHONG)
from PHANMEM PM join CAIDAT CD on PM.IDPM=CD.IDPM join MAY M on CD.IDMAY=M.IDMAY join PHONG P on P.MP = M.MP
where PM.TENPM='Oracle 6';

--22
Select TENPM
from PHANMEM
where NGAYMUA = (
      Select MAX(NGAYMUA)
      from PHANMEM);

--23
Select TENPM
from PHANMEM
where IDLOAI='PCNT' AND GIA > ANY (
    Select GIA
    from PHANMEM
    where IDLOAI='UNIX'
);

--24
Select TENPM
from PHANMEM
where IDLOAI='UNIX' AND GIA >(
    Select MAX(GIA)
    from PHANMEM
    where IDLOAI='PCNT'
);

--25
Select TENMAY
from MAY M JOIN (Select DISTINCT(IDMAY)
                from CAIDAT
                where IDMAY !='p6' AND IDPM = any(
                    Select IDPM
                    from CAIDAT CD
                    where CD.IDMAY='p6')
                order by IDMAY) T 
            ON M.IDMAY = T.IDMAY;

Select M.TENMAY
from MAY M
    INNER JOIN CAIDAT CD ON M.IDMAY=CD.IDMAY
    JOIN (Select IDPM from CAIDAT where IDMAY='p6') T ON T.IDPM=CD.IDPM
where M.IDMAY <>'p6';
--26
Create table BT26 as
    Select *
    from CAIDAT
    where IDPM = ANY(
        Select IDPM
        from CAIDAT CD
        where CD.IDMAY='p6')
    order by IDMAY;

Select IDMAY
from BT26
group by IDMAY having IDMAY !='p6' AND COUNT(IDMAY) = (
    Select COUNT(IDMAY)
    from BT26
    group by IDMAY having IDMAY='p6');
    
    
Select M.TENMAY, M.IDMAY, COUNT(*) 
FROM MAY M  INNER JOIN CAIDAT CD ON M.IDMAY = CD.IDMAY
WHERE IDPM IN (Select IDPM from CAIDAT where IDMAY='p6') AND M.IDMAY<>'p6'
GROUP BY M.TENMAY, M.IDMAY HAVING COUNT(DISTINCT IDPM) >= (SELECT COUNT(*) FROM CAIDAT WHERE IDMAY='p6');
