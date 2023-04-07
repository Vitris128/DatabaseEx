--15
Select COUNT(*) SoLuong
  from TACPHAM;
  
--16
Select tp.nt,tua, count(*) soluong
  from sach s join tacpham tp on s.nt=tp.nt
  GROUP BY tp.nt, tua having count(*)>=2
  order by tp.nt;

--17
Select tacgia, count(*)
  from tacpham
  GROUP BY tacgia
  order by tacgia;
  

--18
Select nt, count(*) soluong
  from sach
  GROUP BY nt
  order by nt;

--19
Select nd, extract(year from ngaymuon) nam, count(*)
  from muon
  GROUP BY nd, extract(year from ngaymuon)
  order by nd;

--20
Select tua, count(*)
  from tacpham tp join sach s on tp.nt=s.nt
  group by TP.TUA having count(*) >=3;
  
--21
Select tp.tua, count(*) soluong
  from tacpham tp join sach s on tp.nt=s.nt
  GROUP BY tp.tua having count(*)=(select max(count(*)) from sach group by nt);

--22
Select nxb,count(*) soluong
  from sach
  GROUP BY nxb having count(*) = (select max(count(*)) from sach group by nxb);
  
--23
Select count(*) soluong
  from(Select tacgia, count(*)
  from tacpham
  GROUP BY tacgia having count(*)>=2);
  
--24
Select tua, count(*)
  from muon m join sach s on m.ns=s.ns join tacpham tp on s.nt=tp.nt 
  GROUP BY tua having count(*)=(Select  max(count(*))
                from muon m join sach s on m.ns=s.ns join tacpham tp on s.nt=tp.nt 
                GROUP BY tua);

--25
Select tua, count(*)
  from muon m join sach s on m.ns=s.ns join tacpham tp on s.nt=tp.nt 
  GROUP BY tua having count(*)=(Select  min(count(*))
                from muon m join sach s on m.ns=s.ns join tacpham tp on s.nt=tp.nt 
                GROUP BY tua);
                
--26
--create table c26 as
  Select ho,ten,count(*) solanmuon
  from docgia dg join muon m on dg.nd=m.nd join sach s on m.ns=s.ns join tacpham tp on s.nt=tp.nt 
  GROUP BY ho, ten, tp.nt;
--
--Create table c26_clone as
--Select ho,ten,sum(solanmuon) tong
--  from c26
--  group by ho,ten;
-- drop table c26;
Select ho,ten,tong
  from c26_clone
  where tong = (select max(tong) from c26_clone);

--27
Select ho,ten,solanmuon
  from c26
  where solanmuon=(select min(solanmuon)
  from c26);
  
--28
Select tp.tua,tp.nt
  from tacpham tp join sach s on tp.nt=s.nt left join muon m on s.ns=m.ns
  where ngaymuon is NULL;
  
--29
Select tua from tacpham
  where tua not in(Select tp.tua
                  from tacpham tp join sach s on tp.nt=s.nt left join muon m on s.ns=m.ns
                  where ngaymuon is NULL);
  
--30
Select ho,ten
  from docgia dg left join muon m on dg.nd=m.nd
  where ngaymuon is null;

--31
Select nxb
  from sach s left join muon m on s.ns=m.ns
  where ngaymuon is null;