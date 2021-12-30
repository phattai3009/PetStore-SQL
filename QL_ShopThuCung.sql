CREATE DATABASE QL_STC
GO
USE QL_STC
GO

-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------TẠO TABLE-----------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE NHANVIEN(
	MANV VARCHAR(20) NOT NULL,
	MACV VARCHAR(20) NOT NULL,
	HOTEN NVARCHAR(50),
	GIOITINH NVARCHAR(10),
	NGAYSINH DATE,
	DIACHI NVARCHAR(200),
	SDT VARCHAR(15) NOT NULL UNIQUE,
	LUONG MONEY,
	CMND VARCHAR(15) NOT NULL UNIQUE,
	NGAYVL DATE,
	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)
)

CREATE TABLE TAIKHOAN(	
	MANV VARCHAR(20),
	TENTK VARCHAR(50) NOT NULL,
	MATKHAU VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TAIKHOAN PRIMARY KEY (TENTK, MANV)
)

CREATE TABLE LOAI( 
	MALOAI VARCHAR(20) NOT NULL,
	TENLOAI NVARCHAR(50),
	CONSTRAINT PK_LOAI PRIMARY KEY (MALOAI)
)

CREATE TABLE GIONG(
	MALOAI VARCHAR(20),
	MAGIONG VARCHAR(20) NOT NULL,
	TENGIONG NVARCHAR(50),
	MOTA NVARCHAR(500),
	CONSTRAINT PK_GIONG PRIMARY KEY (MAGIONG)
)

CREATE TABLE THUCUNG
(
	MATC VARCHAR(20) NOT NULL,
	MALOAI VARCHAR(20),
	MAGIONG VARCHAR (20),
	DONGIA MONEY,
	TONKHO INT,
	CONSTRAINT PK_THUCUNG PRIMARY KEY (MATC)
)

CREATE TABLE HOADON(
	MAHD INT,
	MANV VARCHAR(20),
	NGAYLAP DATETIME,
	MAKH VARCHAR(20),
	TONGTIEN MONEY,
	CONSTRAINT PK_HOADON PRIMARY KEY (MAHD)
)

CREATE TABLE CTHOADON(
	MAHD INT,
	MATC VARCHAR(20),
	SOLUONG INT,
	THANHTIEN MONEY,
)

CREATE TABLE KHACHHANG(
	MAKH VARCHAR (20) NOT NULL,
	HOTEN NVARCHAR(50),
	GIOITINH NVARCHAR(10),
	SDT VARCHAR(15) NOT NULL UNIQUE,
	DIACHI NVARCHAR(200),
	NGAYDK DATE,
	DOANHSO MONEY
	CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
)

-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------TẠO RÀNG BUỘC KHOÁ NGOẠI--------------------------------------
-------------------------------------------------------------------------------------------------------------------

ALTER TABLE TAIKHOAN ADD CONSTRAINT FK_TAIKHOAN_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV)

ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV)
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)

ALTER TABLE CTHOADON ADD CONSTRAINT FK_CTHOADON_HOADON FOREIGN KEY (MAHD) REFERENCES HOADON (MAHD)
ALTER TABLE CTHOADON ADD CONSTRAINT FK_CTHOADON_THUCUNG FOREIGN KEY (MATC) REFERENCES THUCUNG(MATC)

ALTER TABLE THUCUNG ADD CONSTRAINT FK_THUCUNG_GIONG FOREIGN KEY (MAGIONG) REFERENCES GIONG (MAGIONG)
ALTER TABLE THUCUNG ADD CONSTRAINT FK_THUCUNG_LOAI FOREIGN KEY (MALOAI) REFERENCES LOAI (MALOAI)

ALTER TABLE GIONG ADD CONSTRAINT FK_GIONG_MALOAI FOREIGN KEY (MALOAI) REFERENCES LOAI(MALOAI)

-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------DỮ LIỆU MẪU---------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

INSERT INTO LOAI VALUES
('DOG', N'Chó'),
('CAT', N'Mèo')

INSERT INTO GIONG VALUES
('DOG','HUSKY', N'Chó Husky', N'Chó Husky là một giống chó tuyết có nguồn gốc từ Sibir, Nga.
Husky có vẻ đẹp quyến rũ, thân hình dũng mãnh, sức khỏe dẻo dai phi thường.
Là giống chó hiền lành, rất tình cảm, hay tò mò, ưa vận động, rất thích người 
và đặc biệt thân thiện với trẻ em. 
Ở Việt Nam, chó Husky rất được yêu thích và được săn đón bởi đông đảo những người yêu chó.'),

('DOG', 'CORGI', N'Chó Corgi', N'Chó Corgi là một giống chó nhỏ, chân ngắn nhưng 
thân dài, đuôi cụt và một đôi tai lớn.
Corgi có vẻ ngoài đáng yêu, cặp mông hình trái tim tạo nên nét quyến rũ và đã 
tạo nên cơn sốt ngắm mông Corgi.  
Là giống chó rất thông minh, biết vâng lời, có bản năng bảo vệ, rất tận tâm 
với chủ và thân thiện với trẻ em. 
Chúng rất điềm tĩnh, trung thành và đáng yêu, song rất cảnh giác trước người lạ.'),

('DOG', 'GOLDEN', N'Chó Golden Retriever', N'Chó Golden Retriever là một giống 
chó săn thượng hạng đến từ Scotland.
Golden có bộ lông vàng mượt khá sang trọng, khuôn mặt thường xuyên cười vui vẻ, 
tuy nhiên, lúc buồn lại tỏ vẻ đáng thương rõ ràng.
Là giống chó rất thông minh, dễ huấn luyện, luôn biết cách làm hài lòng chủ nhân 
và thích vui chơi cùng mọi người.
Golden rất điềm tĩnh, hiền lành và tình cảm, lại rất nhanh nhẹn và năng động.'),

('CAT', 'BRITISHSH', N'Mèo Anh lông ngắn', N'Mèo Anh lông ngắn là một giống mèo 
cảnh có nguồn gốc từ Anh.
Chúng sở hữu một thân hình vô cùng mập mạp đáng yêu, nổi bật với khuôn mặt tròn 
và bộ lông màu xám xanh cổ điển và một cái đuôi to.
Tính cách của chúng tuy khá lười biếng tuy nhiên lại phù hợp với những người bận 
rộn không có quá nhiều thời gian và không đòi hỏi chủ nhân của chúng phải chải 
chuốt vệ sinh thường xuyên.'),

('CAT', 'BRITISHLH', N'Mèo Nga lông dài', N'Mèo Nga lông dài thực chất có nguồn 
gốc là giống mèo Angora Turkish, có xuất xứ từ Thổ Nhĩ Kỳ.
Mèo Nga sở hữu bộ lông dài trắng muốt như tuyết tuyệt đẹp, tuy nhiên không xù, 
thân hình nhỏ gọn, thanh thoát và quý phái.
Tính tình thông minh, linh hoạt, quấn chủ và hiền lành, mèo Nga được xem như 
loại mèo toàn diện nhất.')

INSERT INTO THUCUNG VALUES
('TC001', 'DOG', 'HUSKY', 5000000, 100),
('TC002', 'DOG', 'CORGI', 7000000, 100),
('TC003', 'DOG', 'GOLDEN', 9000000, 100),
('TC004', 'CAT', 'BRITISHSH', 10000000, 100),
('TC005', 'CAT', 'BRITISHLH', 4000000, 100)

SET DATEFORMAT DMY;
Insert into NHANVIEN Values
('NV001','CHCH',N'Đinh Phát Tài',N'Nam','30/09/2001',N'Long An','0359975249',30000000,'301770325','01/01/2021'),
('NV002','NVBH',N'Lê Nguyễn Đại Đức Tâm',N'Nam','1/1/2001',N'Long An','0987678901',5000000,'305840781','01/01/2021'),
('NV003','NVBH',N'Võ Thi Nở',N'Nữ','28/2/2001',N'Pháp','0987689012',4500000,'291150900','01/01/2021')

Insert into TAIKHOAN Values
('NV001','NV001','phattai'),
('NV002','NV002','ductam'),
('NV003','NV003','thino')

SET DATEFORMAT DMY;
INSERT INTO KHACHHANG VALUES
('KH001',N'Nguyễn Văn A',N'Nam','0987612345',N'Củ Chi','01/02/2021',NULL),
('KH002',N'Nguyễn Văn B',N'Nữ','0987623456',N'Mỹ Tho','01/03/2021',NULL),
('KH003',N'Nguyễn Thị C',N'Nữ','0987634567',N'Pháp','01/03/2021',NULL),
('KH004',N'Nguyễn Văn D',N'Nam','0916395633',N'TP HCM','01/04/2021',NULL),
('KH005',N'Nguyễn Văn E',N'Nam','0355440999',N'Long An','01/05/2021',NULL),
('KH006',N'Nguyễn Thị F',N'Nữ','0344112881',N'Hà Nội','01/05/2021',NULL),
('KH007',N'Trần Hoàng Long',N'Nam','0913564799',N'TP HCM','01/06/2021',NULL),
('KH008',N'Nguyễn Tiến Sĩ',N'Nam','0983856719',N'Long An','01/07/2021',NULL),
('KH009',N'Đinh Thanh Minh',N'Nữ','0952362856',N'TP HCM','01/08/2021',NULL),
('KH0010',N'Nguyễn Hoàng Yến',N'Nữ','0975955429',N'TP HCM','01/09/2021',NULL),
('KH0011',N'Nguyễn Thuý Kiều',N'Nữ','0975932429',N'Long An','01/11/2021',NULL),
('KH0012',N'Trần Hoàng Bảo Trâm',N'Nữ','0988323841',N'Long An','01/10/2021',NULL),
('KH0013',N'Trần Phương Anh',N'Nữ','0959652004',N'TP HCM','01/08/2021',NULL),
('KH0014',N'Nguyễn Thị Như Quỳnh',N'Nữ','0955001220',N'Long An','01/07/2021',NULL),
('KH0015',N'Lê Hoàng Minh Tâm',N'Nam','0958833512',N'TP HCM','01/06/2021',NULL)

SET DATEFORMAT DMY;
INSERT INTO HOADON VALUES
(1, 'NV002', '01/01/2021', 'KH001',NULL),
(2, 'NV002', '14/03/2021', 'KH002',NULL),
(3, 'NV002', '23/06/2021', 'KH003',NULL),
(4, 'NV002', '16/09/2021', 'KH004',NULL),
(5, 'NV003', '01/12/2021', 'KH005',NULL),
(6, 'NV002', '10/12/2021', 'KH006',NULL),
(7, 'NV002', '12/01/2021', 'KH007',NULL),
(8, 'NV002', '25/12/2021', 'KH008',NULL),
(9, 'NV002', '18/09/2021', 'KH008',NULL),
(10, 'NV003', '19/08/2021', 'KH0010',NULL)

INSERT INTO CTHOADON VALUES
(1, 'TC003', 1,NULL),
(1, 'TC002', 1,NULL),
(1, 'TC001', 1,NULL),
(2, 'TC004', 1,NULL),
(2, 'TC003', 1,NULL),
(2, 'TC002', 1,NULL),
(3, 'TC001', 1,NULL),
(3, 'TC005', 1,NULL),
(4, 'TC003', 1,NULL),
(5, 'TC002', 1,NULL),
(5, 'TC001', 1,NULL),
(5, 'TC003', 1,NULL),
(6, 'TC003', 1,NULL),
(7, 'TC003', 1,NULL),
(8, 'TC003', 1,NULL),
(9, 'TC003', 1,NULL),
(9, 'TC002', 1,NULL),
(9, 'TC001', 1,NULL),
(10, 'TC002', 1,NULL),
(10, 'TC003', 1,NULL),
(10, 'TC004', 5,NULL)

-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------Ràng buộc toàn vẹn--------------------------------------------
-------------------------------------------------------------------------------------------------------------------

ALTER TABLE NHANVIEN
ADD CONSTRAINT chk_manv CHECK(MANV LIKE 'NV%')
alter table NHANVIEN
ADD CONSTRAINT chk_luong CHECK(LUONG>=0)

ALTER TABLE KHACHHANG
ADD CONSTRAINT chk_makh CHECK(MAKH LIKE 'KH%')
ALTER TABLE KHACHHANG
ADD CONSTRAINT chk_doanhso CHECK(DOANHSO>=0)

ALTER TABLE HOADON
ADD CONSTRAINT chk_tongtien CHECK(TONGTIEN>=0)

ALTER TABLE THUCUNG
ADD CONSTRAINT chk_matc CHECK(MATC LIKE 'TC%')
ALTER TABLE THUCUNG
ADD CONSTRAINT chk_dongia CHECK(DONGIA>=0)
ALTER TABLE THUCUNG
ADD CONSTRAINT chk_soluong CHECK(TONKHO>=0)

ALTER TABLE CTHOADON
ADD CONSTRAINT chk_thanhtien CHECK(THANHTIEN>=0)

-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------UPDATE DỮ LIỆU------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

UPDATE CTHOADON
SET THANHTIEN=(SELECT CTHOADON.SOLUONG*THUCUNG.DONGIA FROM THUCUNG WHERE MATC =CTHOADON.MATC )
--KIỂM TRA
SELECT * FROM CTHOADON

UPDATE HOADON
SET TONGTIEN = (SELECT SUM(THANHTIEN) FROM CTHOADON WHERE MAHD=HOADON.MAHD)
--KIỂM TRA
SELECT * FROM HOADON

UPDATE KHACHHANG
SET DOANHSO = (SELECT SUM(TONGTIEN) FROM HOADON WHERE MAKH= KHACHHANG.MAKH )
--KIỂM TRA
SELECT * FROM KHACHHANG

-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------MỘT SỐ CÂU TRUY VẤN-------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--1.Đếm số lượng thú cưng có trong cửa hàng.
SELECT SUM(TONKHO) AS  N'TỔNG SỐ LƯỢNG'
FROM THUCUNG
--2.In ra danh sách các Thú Cưng có Giống là "DOG" và có giá từ 5.000.000 đến 9.000.000.
SELECT*
FROM THUCUNG
WHERE DONGIA BETWEEN 5000000 AND 9000000 AND MALOAI = 'DOG'
--3.Tìm Thú Cưng BRITISHLH có giá dưới 5.000.000.
SELECT MATC, MAGIONG, DONGIA
FROM THUCUNG
WHERE MAGIONG = 'BRITISHLH' AND DONGIA <= 5000000
--4.In ra (HOTEN,MACV,CHULUONG) của nhân viên "Đinh Phát Tài"
SELECT HOTEN, MACV, LUONG
FROM NHANVIEN
WHERE HOTEN = N'Đinh Phát Tài'
--5.Tìm Khách hàng có số điện thoại "0987612345" và in ra màn hình.
SELECT *
FROM KHACHHANG
WHERE SDT = '0987612345'
--6.In ra danh sách các hoá đơn có ngày lập "1/12/2021".
SET DATEFORMAT DMY;
SELECT *
FROM HOADON
WHERE NGAYLAP = '1/12/2021'
--7.In ra danh sách TOP10 khách hàng có thành tiền mua tại shop nhiều nhất.(sắp xếp theo kiểu xếp hạng).
SELECT DISTINCT TOP 10 A.MAKH, A.HOTEN, THANHTIEN 
FROM KHACHHANG A, HOADON B, CTHOADON C
WHERE A.MAKH = B.MAKH AND B.MAHD = C.MAHD
ORDER BY THANHTIEN DESC
--8.Tính tổng tiền hoá đơn có mã "HD002" và in ra màn hình.
SELECT THANHTIEN as N'TỔNG TIỀN'
FROM CTHOADON
WHERE MAHD = 'HD0021'
--9.In ra (MAHD,MAKH,NGAYLAP,THANHTIEN) trong tháng 12/2021, sắp xếp theo ngày (tăng dần) và THANHTIEN của chi tiết hóa đơn (giảm dần).
SELECT A.MAHD, A.MAKH, A.NGAYLAP, B.THANHTIEN
FROM HOADON A, CTHOADON B
WHERE A.MAHD=B.MAHD AND MONTH(NGAYLAP) = 12 AND YEAR(NGAYLAP) = 2021
ORDER BY NGAYLAP ASC, THANHTIEN DESC

-------------------------------------------------------------------------------------------------------------------
------------------------------------------------------TRIGGER------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--1/Viết trigger thực hiện việc cập nhật THANHTIEN trên bảng CTHOADON
CREATE TRIGGER CapNhapThanhTien
on CTHOADON
for insert,delete,update
as
	update CTHOADON
	set THANHTIEN=(select CTHOADON.SOLUONG*THUCUNG.DONGIA from THUCUNG where MATC =CTHOADON.MATC )
	where MAHD=(select MAHD from inserted) or MAHD=(select MAHD from deleted)
go

--TEST
insert into CTHOADON values(1, 'TC004', 10,NULL)
select * from CTHOADON
--
delete from CTHOADON
where MAHD=1 and MATC='TC004'
select * from CTHOADON

--2/Viết trigger thực hiện việc cập nhật TONGTIEN trên bảng HOADON
create trigger CapNhapTongTien
on CTHOADON
for insert,delete
as
	update HOADON
	set TONGTIEN = (select sum(THANHTIEN) from CTHOADON where MAHD=HOADON.MAHD)
	where MAHD = (select MAHD from inserted) or MAHD=(select MAHD from deleted)
go

--TEST
insert into CTHOADON values(1, 'TC004', 1,NULL)
select * from HOADON
select * from CTHOADON
--
delete from CTHOADON
where MAHD=1 and MATC='TC004'
select * from HOADON
select * from CTHOADON

--3.Viết trigger kiểm tra tuổi của nhân viên phải >=18
create trigger KiemTraTuoiNV
on NHANVIEN
for insert,update
as
   if(select year(getdate())-year(NGAYSINH) from inserted)<18
   print N'Tuổi nhân viên phải trên 18'
   rollback tran
go
--TEST
Insert into NHANVIEN Values
('NV004','CHCH',N'Đinh Bình Minh',N'Nam','30/09/2005',N'Long An','0357657566',30000000,'301234123','01/01/2021')

--4.Viết trigger cập nhật số lượng thú cưng khi mua.
CREATE TRIGGER CapNhapSoLuongThuCung
ON CTHOADON 
FOR INSERT
AS
	UPDATE THUCUNG
	SET TONKHO = TONKHO - (
		(SELECT SOLUONG
		FROM inserted
		WHERE MATC = THUCUNG.MATC)
	)
	FROM THUCUNG
	JOIN inserted ON THUCUNG.MATC = inserted.MATC
GO

--TEST
insert into CTHOADON values(1, 'TC005', 1,NULL)
select * from THUCUNG
select * from CTHOADON

--5.Viết trigger cập nhật thú cưng khi hủy mua.
create TRIGGER CapNhapKhiHuyHang
ON CTHOADON
FOR DELETE 
AS
	UPDATE THUCUNG
	SET TONKHO = TONKHO + (SELECT SOLUONG FROM deleted WHERE MATC = THUCUNG.MATC)
	FROM THUCUNG 
	JOIN deleted ON THUCUNG.MATC = deleted.MATC
GO
--TEST
DELETE FROM CTHOADON
WHERE MATC='TC005' AND MAHD=1
select * from THUCUNG
select * from CTHOADON

--6.Viết trigger cập nhật hàng trong kho sau khi cập nhật mua hàng 
CREATE  TRIGGER CapNhapSoLuong
on CTHOADON 
FOR update
AS
   UPDATE THUCUNG SET TONKHO = TONKHO -
	   (SELECT SOLUONG FROM inserted WHERE MATC = THUCUNG.MATC) +
	   (SELECT SOLUONG FROM deleted WHERE MATC = THUCUNG.MATC)
   FROM THUCUNG 
   JOIN deleted ON THUCUNG.MATC = deleted.MATC

GO

--TEST
UPDATE CTHOADON
SET SOLUONG=3
WHERE MAHD = 1 AND MATC='TC001'
select * from THUCUNG
select * from CTHOADON


-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------PROCEDUCE-----------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--1.Viết Thủ tục truyền vào tham số tháng năm. Tính tổng số lượng của từng sản phẩm bán ra trong tháng đó.
CREATE PROC TinhTongSLTCTheoDMY @THANG INT, @NAM INT
AS
SELECT MATC, SUM(SOLUONG) as Tong
FROM CTHOADON C INNER JOIN HOADON H
ON C.MAHD = H.MAHD
WHERE MONTH(NGAYLAP) = @THANG AND YEAR(NGAYLAP) = @NAM
GROUP BY MATC
GO

--TEST
SELECT * FROM HOADON
SELECT * FROM CTHOADON
--
EXEC TinhTongSLTCTheoDMY 8,2021
SELECT * FROM HOADON
SELECT * FROM CTHOADON

--2.Viết thủ tục tính doanh thu bán xuất theo ngày có hoá đơn.
create proc DoanhThuMoiNgay
as
	SELECT NGAYLAP, SUM(TONGTIEN) AS DOANHTHU
	FROM HOADON
	GROUP BY NGAYLAP
go
--TEST
exec DoanhThuMoiNgay

--3.Viết thủ tục truyền vào tham số mã hóa đơn sẽ trả về mã khách hàng, ngày lập và tổng tiền của hóa đơn đó.
create proc	TraMaHoaDon @maHD varchar(20), @maKH varchar(20) output, @ngayLap date output,@tongTien money output
as
   select @maKH = MAKH, @ngayLap = NGAYLAP, @tongTien = TONGTIEN
   from HOADON 
   where @maHD = MAHD
go
--TEST
declare @maKH varchar(20), @ngayLap date,@tongTien money
exec TraMaHoaDon 1, @maKH output, @ngayLap  output,@tongTien output
print N'Mã KH:'+cast(@maKH as varchar(20))
print N'Ngày lập hóa đơn:'+cast(@ngayLap as varchar(20))
print N'Tổng tiền:'+cast(@tongTien as varchar(20))

--4.Viết thủ tục trả về danh sách thú cưng có mã loài X và được bán ra trong ngày Y.
create proc DSTCXAndY @maLoai varchar(20), @ngayban date
as
	SELECT*
	FROM THUCUNG T INNER JOIN CTHOADON C
	ON T.MATC = C.MATC
	WHERE MALOAI = @maLoai AND c.MAHD IN(SELECT DISTINCT CT.MAHD
										 FROM CTHOADON CT INNER JOIN HOADON H ON CT.MAHD = H.MAHD
										 WHERE NGAYLAP = @ngayban)
GO
--TEST
exec DSTCXAndY 'DOG','19/08/2021'

--5.Viết thủ tục in ra danh sách thú cưng không bán được.
create proc DSTCKhongBanDuoc
as
	SELECT *
	FROM THUCUNG T
	WHERE NOT EXISTS(SELECT * 
	FROM THUCUNG TC INNER JOIN CTHOADON C
	ON TC.MATC = C.MATC AND TC.MATC = T.MATC)
go
--TEST
exec DSTCKhongBanDuoc
--TEST
DELETE FROM CTHOADON
WHERE MATC='TC005' AND MAHD=3
exec DSTCKhongBanDuoc

--6.Viết thủ tục tính doanh thu bán hàng của từng tháng trong năm X.
CREATE PROC DoanhThuTungThangTrongNam @namX varchar(10)
AS
	SELECT MONTH(NGAYLAP) AS THANG, SUM(TONGTIEN) AS DOANHTHU
	FROM HOADON
	WHERE YEAR(NGAYLAP) = @namX
	GROUP BY MONTH(NGAYLAP)
GO
--TEST
EXEC DoanhThuTungThangTrongNam 2021

-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------FUNCTION-----------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

--1.viết hàm truyền vào tham số mã khách hàng sẽ in ra danh sách các hóa đơn(MAHD,TONGTIEN) của khách hàng đó
create function	InDSHDTheoMaKH(@maKH varchar(20)) 
returns table
as
   return (select MAHD,sum(TONGTIEN) as N'Tổng Thành Tiền' from HOADON where MAKH=@maKH group by MAHD)
go
--TEST
select* from dbo.InDSHDTheoMaKH('KH001')

--2.Viết hàm truyền vào nhân viên có tên x và ngày lập hoá đơn y , hàm trả về mã hoá đơn, tổng tiền các 
--hóa đơn lập trong ngày y.
CREATE FUNCTION InRaHDCuaNVXTrongNgayY(@tennv nvarchar(50),@ngay date)
RETURNS TABLE 
AS
RETURN (SELECT MAHD, TONGTIEN FROM HOADON H INNER JOIN NHANVIEN N ON H.MANV = N.MANV 
        WHERE HOTEN = @tennv AND NGAYLAP = @ngay)
go
--TEST
select* from dbo.InRaHDCuaNVXTrongNgayY(N'Lê Nguyễn Đại Đức Tâm','16/09/2021')
select* from HOADON

--3.Viết hàm truyền vào mã giống thú cưng X hàm sẽ trả về danh sách hóa đơn của thú cưng đó.
create function	InDSHDCuaThuCungX(@ThuCungX varchar(20)) 
returns table
as
   return (select h.MAHD, sum(ct.THANHTIEN) as N'Tổng Thành Tiền' 
			from THUCUNG TC, CTHOADON CT, HOADON H
			where TC.MATC = CT.MATC and H.MAHD = CT.MAHD and TC.MAGIONG = @ThuCungX
			Group by H.MAHD)
go

--TEST
UPDATE CTHOADON
SET SOLUONG=5
WHERE MAHD = 1 AND MATC='TC001'
--TEST
select* from dbo.InDSHDCuaThuCungX(N'HUSKY')

--4.Viết hàm truyền vào năm X. Đếm số thú cưng của từng loại được bán ra trong năm đó và tổng tiền của từng loại.
CREATE FUNCTION DemThuCungKhacLoai(@NAM INT)
RETURNS TABLE
AS
RETURN (SELECT C.MATC, SUM(SOLUONG) AS N'Số sản phẩm', Sum(C.THANHTIEN) as N'Thành Tiền'
         FROM CTHOADON C INNER JOIN HOADON H ON C.MAHD = H.MAHD WHERE YEAR(NGAYLAP) = @NAM
		 Group by C.MATC)
GO
--TEST
SELECT * FROM DBO.DemThuCungKhacLoai(2021)

--5.Viết hàm trả về họ tên khách hàng đã mua hóa đơn có tổng tiền cao nhất trong năm X.
CREATE FUNCTION TraVeKHCoGiaTriHDCaoNhatNamX(@nam int)
RETURNS NVARCHAR(50)
AS
BEGIN
DECLARE @KH NVARCHAR(50)
SET @KH=(
SELECT HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH 
AND MAHD = (SELECT MAHD
			FROM HOADON
			WHERE TONGTIEN = (SELECT MAX(TONGTIEN)
							FROM HOADON WHERE YEAR(NGAYLAP)=@nam)))
RETURN @KH
END
GO

--TEST
SELECT DBO.TraVeKHCoGiaTriHDCaoNhatNamX(2021) AS N'Họ tên'

-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------CURSOR--------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

---1.Định nghĩa một biến tên cursor_sv có kiểu cursor gồm mã nv, mã cv, họ tên, sđt, ngày vào làm 
--của các nhân viên là NV001. Đọc và xuất từng dòng dữ liệu.
DECLARE cursor_nv CURSOR
DYNAMIC
FOR Select MANV,MACV, HOTEN, SDT, NGAYVL
From NHANVIEN
Where MANV='NV001'
OPEN cursor_nv
DECLARE @maNV varchar(20),@maCV varchar(20),@ten nvarchar(50),@sdt varchar(15),@ngayvl date
FETCH NEXT FROM cursor_nv into @maNV,@maCV,@ten,@sdt,@ngayvl
While(@@FETCH_STATUS=0)
Begin 
  Print	@maNV +','+ @maCV +','+ @ten+ ','+@sdt+','+convert(varchar,@ngayvl,103)
  Fetch next From cursor_nv into @maNV,@maCV,@ten,@sdt,@ngayvl
End
CLOSE cursor_nv
DEALLOCATE cursor_nv

--2.Hãy viết lệnh định nghĩa cursor có tên là THÀNH TIỀN gồm các thuộc tính:Mã TC, số lượng tòn 
--kho, đơn giá . Thực hiện xử lý trên cursor như sau: 
--Mỗi khi cursor di chuyển đến mẫu tin kế tiếp thì tính THÀNH TIỀN (THANHTIEN) của chi tiết hóa 
--đơn tương ứng theo công thức: 
--THANHTIEN = SOLUUONG*DONGIA.
DECLARE cursor_tt CURSOR 
DYNAMIC 
FOR SELECT MAHD, TC.MATC,TC.TONKHO,TC.DONGIA FROM THUCUNG TC, CTHOADON CT
WHERE TC.MATC=CT.MATC
OPEN  cursor_tt
DECLARE @maHD INT, @maTC VARCHAR(20), @tonKho INT, @donGia MONEY
FETCH NEXT FROM  cursor_tt INTO  @maHD, @maTC, @tonKho, @donGia
WHILE(@@FETCH_STATUS = 0)
BEGIN
	UPDATE CTHOADON
	SET THANHTIEN=(select @tonKho*@donGia )
	WHERE @maTC=MATC and @maHD=MAHD
	FETCH NEXT FROM  cursor_tt INTO @maHD, @maTC, @tonKho, @donGia
END
CLOSE  cursor_tt
DEALLOCATE  cursor_tt


-------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------BACKUP--------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

BACKUP DATABASE QL_ShopThuCung
TO DISK = 'C:\backupsql\Test_FULL.bak'
WITH INIT

-- Thêm một bản ghi mới 
insert into CTHOADON values(1, 'TC004', 2,NULL) 

BACKUP LOG QL_ShopThuCung 
TO DISK = 'C:\backupsql\Test_TRAN.trn'
WITH INIT

-- Thêm một bản ghi mới 
insert into CTHOADON values(1, 'TC005', 2,NULL) 

-- Thời điểm t3: Log Backup
BACKUP LOG QL_ShopThuCung 
TO DISK = 'C:\backupsql\Test_TRAN.trn'

-- Thêm một bản ghi mới 
insert into CTHOADON values(2, 'TC005', 2,NULL) 

-- Thời điểm t4: Differential backup
BACKUP DATABASE QL_ShopThuCung 
TO DISK = 'C:\backupsql\Test_DIFF.bak' 
WITH INIT, DIFFERENTIAL

-- Thời điểm t5: Log Backup
BACKUP LOG QL_ShopThuCung 
TO DISK = 'C:\backupsql\Test_TRAN.trn' 
WITH INIT

-- Thêm một bản ghi mới 
insert into CTHOADON values(4, 'TC005', 2,NULL) 

-- Giả sử sau đó xảy ra sự cố, ta mô phỏng sự việc này bằng cách xóa CSDL:

--Khôi phục
-- Bước 1: Khôi phục từ bản Full Backup 
RESTORE DATABASE QL_ShopThuCung 
FROM DISK = 'C:\backupsql\Test_FULL.bak' 
WITH NORECOVERY   
-- Bước 2: Khôi phục từ bản Differential Backup 
RESTORE DATABASE QL_ShopThuCung 
FROM DISK = 'C:\backupsql\Test_DIFF.bak' 
WITH NORECOVERY  
-- Bước 3: Khôi phục từ các bản Log Backup kể từ sau lần Diferential Backup gần nhất 

RESTORE DATABASE QL_ShopThuCung 
FROM DISK = 'C:\backupsql\Test_TRAN.trn' 
WITH FILE = 1, NORECOVERY

RESTORE DATABASE QL_ShopThuCung 
FROM DISK = 'C:\backupsql\Test_TRAN.trn'
WITH FILE=2, RECOVERY

--Phân Quyền
USE QL_ShopThuCung
GO
--ROLE: QUANLY
SP_ADDROLE 'QUANLY'
--ROLE: NHANVIEN
SP_ADDROLE 'NHANVIEN'

--TẠO TÀI KHOẢN
SP_ADDLOGIN 'tai', 'tai123', 'QL_ShopThuCung'
SP_ADDUSER 'tai', 'tai'

SP_ADDLOGIN 'hoang', 'hoang123', 'QL_ShopThuCung'
SP_ADDUSER 'hoang', 'hoang'

--THÊM USER VÀO NHÓM QUYỀN
--QUANLY
SP_ADDROLEMEMBER 'QUANLY', 'tai'
--NHANVIEN
SP_ADDROLEMEMBER 'NHANVIEN', 'hoang'

--CẤP QUYỀN
-- TEST ROLE: QUANLY
GRANT INSERT, DELETE, UPDATE ON LOAI TO QUANLY
GRANT INSERT, DELETE, UPDATE ON GIONG TO QUANLY
GRANT INSERT, DELETE, UPDATE ON THUCUNG TO QUANLY
GRANT INSERT, DELETE, UPDATE ON NHANVIEN TO QUANLY
GRANT SELECT ON LOAI TO QUANLY
GRANT SELECT ON GIONG TO QUANLY
GRANT SELECT ON THUCUNG TO QUANLY
GRANT SELECT ON NHANVIEN TO QUANLY
--TEST ROLE: NHANVIEN
GRANT SELECT ON NHANVIEN TO NHANVIEN
GRANT SELECT ON THUCUNG TO NHANVIEN

--TEST
SET DATEFORMAT DMY;
INSERT INTO HOADON VALUES
(11, 'NV002', '01/01/2021', 'KH001',NULL)

