insert into SinhVien (masv,hotensv,makhoa,namsinh,quequan) values (01,'Phuc Vinh','MAT',1998,'Quang Tri')
insert into SinhVien (masv,hotensv,makhoa,namsinh,quequan) values (02,'Khanh Toan','PHY',1997,'Quang Binh')
insert into SinhVien (masv,hotensv,makhoa,namsinh,quequan) values (03,'Gia Han','BIO',1998,'T-T-Hue')
insert into SinhVien (masv,hotensv,makhoa,namsinh,quequan) values (4,'Le Khanh','MAT',1998,'Quang Binh')
insert into SinhVien (masv,hotensv,makhoa,namsinh,quequan) values (5,'Khanh Van','PHY',1997,'Quang Tri')
insert into SinhVien (masv,hotensv,makhoa,namsinh,quequan) values (6,'Huy Hoang','BIO',1998,'T-T-Hue')


insert into GiangVien (magv,hotengv,luong,makhoa) values (01,'Le Van Tan',15.00,'MAT')
insert into GiangVien (magv,hotengv,luong,makhoa) values (02,'Nguyen Van Minh',12.00,'PHY')
insert into GiangVien (magv,hotengv,luong,makhoa) values (03,'Tran Bich Ngoc',12.00,'BIO')

insert into Khoa (makhoa,tenkhoa,dienthoai) values ('MAT','Toan hoc','0543978658')
insert into Khoa (makhoa,tenkhoa,dienthoai) values ('PHY','Vat ly','0543264895')
insert into Khoa (makhoa,tenkhoa,dienthoai) values ('BIO','Sinh hoc','0543689124')

insert into HuongDan (masv,madt,magv,ketqua) values (1,'HH',01,9.1)
insert into HuongDan (masv,madt,magv,ketqua) values (2,'CH',02,9.3)
insert into HuongDan (masv,madt,magv,ketqua) values (3,'PL',03,8.8)
insert into HuongDan (masv,madt,magv,ketqua) values (4,'HH',01,8.9)
insert into HuongDan (masv,madt,magv,ketqua) values (5,'HH',01,9.5)
insert into HuongDan (masv,madt,magv,ketqua) values (6,'PL',03,9.1)

insert into DeTai (madt,tendt,kinhphi,noithuctap) values ('HH','Hinh hoc Topo',15000,'DHSP Hue')
insert into DeTai (madt,tendt,kinhphi,noithuctap) values ('CH','Dao dong dieu hoa',10000,'DHSP Hue')
insert into DeTai (madt,tendt,kinhphi,noithuctap) values ('PL','Thuc vat 1 la mam',15000,'DHSP Hue')
insert into DeTai (madt,tendt,kinhphi,noithuctap) values ('SH','Dai so tuyen tinh',18000,'DHSP Hue')
go
 
select * from Khoa
select * from HuongDan
select * from SinhVien
delete SinhVien where masv >0

-- hien thi ma so va ten de tai do giang vien Tran Bich Ngoc huong dan
select DeTai.madt, DeTai.tendt from DeTai, HuongDan, GiangVien
where GiangVien.hotengv = 'Tran Bich Ngoc' and HuongDan.madt = DeTai.madt and GiangVien.magv = HuongDan.magv

-- de tai nao ko co sin vien nao thuc tap

/*SELECT madt FROM HuongDan Group by madt; SELECT *FROM DeTai WHERE madt  NOT IN ('HH', 'CH','PL');*/
select DeTai.tendt from DeTai 
where not exists (select * from HuongDan where HuongDan.madt = DeTai.madt)


-- Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.

SELECT GiangVien.magv, GiangVien.hotengv
FROM GiangVien 
INNER JOIN HuongDan 
ON GiangVien.magv = HuongDan.magv 
GROUP BY GiangVien.magv, GiangVien.hotengv
HAVING Count(*) >= 3

-- Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất

SELECT TOP 1 madt, tendt FROM DeTai order by kinhphi desc

--Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
SELECT DeTai.madt, DeTai.tendt FROM DeTai INNER JOIN HuongDan 
ON DeTai.madt = HuongDan.madt
GROUP BY DeTai.madt, DeTai.tendt
HAVING COUNT(HuongDan.masv) >= 2

--
