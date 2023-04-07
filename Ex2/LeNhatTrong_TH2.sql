--Cau 2
select *
from khoahoc;
Select *
from chuongtrinh;
Select * from loailop;
Select * from lop;
Select * from hocvien;
Select * from phieuthu;
Select * from monhoc;
Select * from diem;
--Cau 3
Select * from hocvien where gioitinh=1;
--Cau 4
Select * from hocvien where diachi like '%Cần Th�%';
--Cau 5
Select L.*
from LOP L join KHOAHOC K ON L.MAKH =K.MAKH
where TENKH ='Khóa 1';
--Cau 6
Select h.mahv,h.tenhv
from HOCVIEN H join PHIEUTHU P on H.MAHV=P.MAHV
               join lOP L on P.MALOP=L.MALOP
               join KHOAHOC K ON L.MAKH = K.MAKH
where TENKH ='Khóa 1';
--Cau 7
Select * from hocvien where tenhv like '%Ŀỗ%';
--Cau 8
Select * from hocvien where extract(year from ngaysinh)=2000;
--Cau 9
Select * from hocvien where extract(year from ngaysinh)=2001 AND extract(month from ngaysinh)=12;
--Cau 10
Select * from hocvien where ngaysinh between '1998-01-01' and '2000-12-31';
--Cau 11
Select h.*
from HOCVIEN H join PHIEUTHU P on H.MAHV=P.MAHV
               join lOP L on P.MALOP=L.MALOP
               join LOAILOP LL on LL.MALOAI=L.MALOAI
where TENLOP='Lớp 1' AND tenloai='Tiếng Anh căn bản';
--Cau 12
Select *
from  CHUONGTRINH CT join LOAILOP LL on CT.MACT=LL.MACT
                     join LOP L on L.MALOAI = LL.MALOAI
where TENCT='Tiếng Anh Tổng Quát';
--Cau 13
Select PT.*
from LOAILOP LL join LOP L on LL.MALOAI=L.MALOAI
                join PHIEUTHU PT on PT.MALOP=L.MALOP
where TENLOP='Lớp 3' AND TENLOAI='Tiếng Anh A1';
--Cau 14
Select hv.tenhv, mh.tenmh, d.diem
from HOCVIEN HV join DIEM D on HV.MAHV=D.MAHV
                join MONHOC MH on MH.MAMH=D.MAMH
                join LOP L on L.MALOP=D.MALOP
                join KHOAHOC KH on KH.MAKH=L.MAKH
where TENKH='Khóa 1';
--Cau 15
Select count (*) TongSo
from hocvien;
--Cau 16
Select count (*) TongSo
from HOCVIEN H join PHIEUTHU P on H.MAHV=P.MAHV
               join lOP L on P.MALOP=L.MALOP
               join LOAILOP LL on LL.MALOAI=L.MALOAI
where TENLOP='Lớp 1' AND tenloai='Tiếng Anh căn bản';
--Cau 17
Select sum (THANHTIEN) TongSoTien
from LOAILOP LL join LOP L on LL.MALOAI=L.MALOAI
                join PHIEUTHU PT on PT.MALOP=L.MALOP
where TENLOP='Lớp 3' AND TENLOAI='Tiếng Anh A1';
--Cau 18
Select SUM (THANHTIEN) TongSoTien
from PHIEUTHU PT join LOP L on PT.MALOP=L.MALOP
                join KHOAHOC KH on KH.MAKH=L.MAKH
where TENKH='Khóa 1';
--Cau 19
Select avg (D.DIEM)
from HOCVIEN HV join DIEM D on HV.MAHV=D.MAHV
                join LOP L on L.MALOP=D.MALOP
                join LOAILOP LL on LL.MALOAI=L.MALOAI
where HV.TENHV='Ŀỗ Gia Bảo' AND HV.NGAYSINH='2001-12-02' AND TENLOP='Lớp 1' AND tenloai='Tiếng Anh căn bản'; 
--Cau 20
Select max (DIEM)
from DIEM;