--BÀI THỰC HÀNH 2 - HQTCSDL 2023.


CREATE DATABASE QUANLYNUOCGK
GO

--KHỞI TẠO BẢNG

USE QUANLYNUOCGK

CREATE TABLE NGK (
MaNGK char(5) NOT NULL,
TenNGK Nvarchar(30),
Quycach Nvarchar(10),
MaLoaiNGK char(5) NOT NULL, 
CONSTRAINT PK_ngk PRIMARY KEY (MaNGK)
--CONSTRAINT FK_ngk FOREIGN KEY(MaLoaiNGK) references dbo.LOAINGK(MaLoaiNGK)
)

CREATE TABLE LOAINGK (
MaLoaiNGK char(5) NOT NULL,
TenLoaiNGK Nvarchar(40),
MaNCC char(5) NOT NULL, 
CONSTRAINT PK_loaingk PRIMARY KEY(MaLoaiNGK) 
)

CREATE TABLE NHACC (
MaNCC char(5) NOT NULL,
TenNCC Nvarchar(40),
DiaChiNCC Nvarchar(50), 
DTNCC int ,
CONSTRAINT PK_nhacc PRIMARY KEY (MaNCC)
)

CREATE TABLE KH (
MaKH char(5) not null,
TenKH Nvarchar(30),
DCKH varchar(30),
DTKH int,
CONSTRAINT PK_kh PRIMARY KEY (MaKH)
)

CREATE TABLE DDH(
SoDDH char(5) not null,
NgayDH date,
MaNCC char(5),
CONSTRAINT PK_ddh PRIMARY KEY (SoDDH),
CONSTRAINT FK_ddh foreign key(MaNCC) REFERENCES dbo.NHACC(MaNCC)
)

CREATE TABLE CT_DDH(
SoDDH char(5) not null,
MaNGK char(5) not null,
SLDat tinyint, 
constraint PK_ctddh PRIMARY KEY (SoDDH, MaNGK) 
)

CREATE TABLE PHIEUGH(
SoPGH char(5) not null,
NgayGH date, 
SoDDH char(5) not null
constraint PK_phieugh PRIMARY KEY (SoPGH),
constraint FK_phieugh foreign key(SoDDH) references dbo.DDH

)

CREATE TABLE CT_PGH (
SoPGH char(5) not null,
MaNGK char(5) not null,
SLGiao tinyint,
DGGiao int,
CONSTRAINT PK_ctpgh PRIMARY KEY (SoPGH, MaNGK) 



)

CREATE TABLE HOADON (
SoHD char(5) not null,
NgaylapHD date,
MaKH char(5) not null,
CONSTRAINT PK_hoadon PRIMARY KEY(SoHD),
CONSTRAINT FK_hoadon FOREIGN KEY(MaKH) references dbo.KH(MaKH)
)

CREATE TABLE CT_HOADON (
SoHD char(5) not null,
MaNGK char(5) NOT NULL,
SLKHMua tinyint,
DGBan int, 
CONSTRAINT PK_cthoadon PRIMARY KEY(SoHD,MaNGK)
)

CREATE TABLE PHIEUHEN(
SoPH char(5) not null,
NgayLapPH date,
NgayHenGiao date,
MaKH char(5) not null,
CONSTRAINT PK_phieuhen PRIMARY KEY(SoPH),
CONSTRAINT FK_phieuhen FOREIGN KEY(MaKH) references dbo.KH(MaKH)


)


CREATE TABLE CT_PH (
SoPH char(5) not null,
MaNGK char(5) NOT NULL,
SLHen tinyint,
CONSTRAINT PK_ctph PRIMARY KEY (SoPH, MaNGK) 

)


create table PHIEUTRANO(
SoPTN char(5) not null,
NgayTra date,
SoTienTra int,
SoHD char(5) not null,

CONSTRAINT PK_phieutrano PRIMARY KEY(SoPTN),
CONSTRAINT FK_phieutrano FOREIGN KEY(SoHD) references dbo.HOADON(SoHD)

)


ALTER TABLE NGK 
ADD CONSTRAINT FK_ngk FOREIGN KEY(MaLoaiNGK) references dbo.LOAINGK(MaLoaiNGK)

ALTER TABLE LOAINGK
ADD CONSTRAINT FK_loaingk FOREIGN KEY(MaNCC) references dbo.NHACC(MaNCC)



--NHẬP DỮ LIỆU 
INSERT INTO NGK 
VALUES ('CC1', N'Coca Cola', N'Chai', 'NK1'),
('CC2', N'Coca Cola', N'Lon', 'NK1'),
('PS1', N'Pepsi', N'Chai', 'NK1'),
('PS2', N'Pepsi', N'Lon', 'NK1'),
('SV1', N'Seven Up', N'Chai', 'NK1'),
('SV2', N'Seven UP', N'Lon', 'NK1'),
('NO1', N'Number One', N'Chai', 'NK1'),
('NO2', N'Number One', N'Lon', 'NK1'),
('ST1', N'Sting dâu', N'Chai', 'NK1'),
('ST2', N'Sting dâu', N'Lon', 'NK1'),
('C2', N'Trà C2', N'Chai', 'NK2'),
('OD',N'Trà xanh không độ',N'Chai','NK2'),
('ML1',N'Sữa tươi tiệt trùng', N'Bịch', 'NK1'),
('WT1', 'Nước uống đóng chai', 'Chai', 'NK2')
go
INSERT INTO LOAINGK 
values ('NK1', N'Nước ngọt có gas', 'NC1'),
('NK2', N'Nước ngọt không gas', 'NC2'),
('NK3', N'Trà', 'NC1'),
('NK4', N'Sữa', 'NC2')
go
insert into NHACC 
values ('NC1', N'Công ty NGK quốc tế CocaCola', N'Xa lộ Hà Nội, Thủ Đức, TP.HCM', 088967908),
('NC2', N'Công ty NGK quốc tế Pepsi', N'Bến Chương Dương, Quận 1, TP.HCM', 083663366),
('NC3', N'Công ty NGK Bến Chương Dương', N'Hàm Tử, Q.5, TP.HCM', 089456677)
go
insert into KH
values ('KH01',N'Cửa hàng BT','144 XVNT','088405996'),
('KH02',N'Cửa hàng Trà','198/42 NTT','085974572'),
('KH03',N'Siêu thị Coop','24 ĐTH','086547888')
go
insert into DDH
values 
('DDH01', '20110510', 'NC1'),
('DDH02', '20110520', 'NC1'),
('DDH03', '20110526', 'NC2'),
('DDH04', '20110603', 'NC2')
go
insert into CT_DDH
values ('DDH01', 'CC1', 20),
('DDH01', 'CC2', 15),
('DDH01', 'PS1', 18),
('DDH01', 'SV2', 12),
('DDH02', 'CC2', 30),
('DDH02', 'PS2', 10),
('DDH02', 'SV1', 5),
('DDH02', 'ST1', 15),
('DDH02', 'C2', 10),
('DDH03', 'OD', 45),
('DDH04', 'CC1', 8),
('DDH04', 'ST2', 12)
go
insert into PHIEUGH
values ('PGH01','20100512','DDH01'),
('PGH02','20100515','DDH01'),
('PGH03','20100521','DDH02'),
('PGH04','20100522','DDH02'),
('PGH05','20100528','DDH03')
go
insert into CT_PGH
values ('PGH01', 'CC1', 15, 5000),
 ('PGH01', 'CC2', 15, 4000),
  ('PGH01', 'SV2', 10, 4000),
   ('PGH02', 'SV2', 2, 4000),
    ('PGH03', 'CC2', 30, 5000),
	 ('PGH03', 'PS2', 10, 4000),
	 ('PGH03', 'ST1', 15, 9000),
   ('PGH03', 'C2', 10, 8000)
go
insert into HOADON 
values 
('HD01', '20100510', 'KH01') ,
('HD02', '20100520', 'KH01') ,
('HD03', '20100605', 'KH02') ,
('HD04', '20100616', 'KH02') ,
('HD05', '20110622', 'KH02') ,
('HD06', '20100708', 'KH03') 
go
insert into CT_HOADON 
values 
('HD01', 'CC1', 20, 6000), 
('HD01', 'CC2', 50, 5000), 
('HD02', 'ST1', 40, 10000), 
('HD03', 'SV2', 60, 5000), 
('HD04', 'PS2', 25, 5000),
('HD05', 'CC1', 100, 6000), 
('HD05', 'SV1', 12, 8000), 
('HD05', 'C2', 80, 9000), 
('HD06', 'OD', 55, 1000), 
('HD06', 'ST2', 50, 11000)
insert into PHIEUHEN
values 
('PH01', '20100508', '20100609', 'KH01'),
('PH02', '20100525', '20100628', 'KH02'),
('PH03', '20100601', '20100602', 'KH03')
go
insert into CT_PH
values 
('PH01', 'ST2', 10),
('PH01', 'OD', 8),
('PH02', 'CC1', 20),
('PH03', 'ST1', 7),
('PH03', 'SV2', 12),
('PH03', 'CC2', 9),
('PH03', 'PS2', 15)
go
insert into PHIEUTRANO
values 
('PTN01', '20100518', 500000, 'HD01'),
('PTN02', '20100601', 350000, 'HD01'),
('PTN03', '20100602', 650000, 'HD02'),
('PTN04', '20100615', 1020000, 'HD03'),
('PTN05', '20100701', 1080000, 'HD03')

SELECT * FROM NGK
SELECT * FROM NGK
SELECT * FROM NHACC


-----------------------------------THỰC HIỆN CÂU TRUY VẤN

--1) Liệt kê các NGK và loại NGK tương ứng.
Select ngk.* , lngk.TenLoaiNGK, lngk.MaNCC
from NGK ngk JOIN LOAINGK lngk
on ngk.MaLoaiNGK = lngk.MaLoaiNGK

--2) Cho biết thông tin về nhà cung cấp ở Thành phố HCM.
SELECT * From NHACC 
WHERE DiaChiNCC LIKE N'%TP.HCM'
--3) Liệt kê các hóa đơn mua hàng trong tháng 5/2010.
SELECT * FRom HOADON 
WHERE NgaylapHD >= '20100501' AND NgaylapHD <= '20100531'

--4) Cho biết tên các nhà cung cấp có cung cấp NGK ‘Coca Cola’
SELECT DISTINCT nh.TenNCC FROM NGK n JOIN LOAINGK l 
ON n.MaLoaiNGK = l.MaLoaiNGK 
JOIN NHACC nh
ON l.MaNCC = nh.MaNCC 

WHERE n.TenNGK = 'Coca Cola'


--5) Cho biết tên các nhà cung cấp có thể cung cấp nhiều loại NGK nhất.
SELECT DISTINCT nh.TenNCC FROM NGK n JOIN LOAINGK l 
ON n.MaLoaiNGK = l.MaLoaiNGK 
JOIN NHACC nh
ON l.MaNCC = nh.MaNCC 
GROUP BY 



--6) Cho biết tên nhà cung cấp không có khả năng cung cấp NGK có tên ‘Pepsi’.
--7) Hiển thị thông tin của NGK chưa bán được.
--8) Hiển thị tên và tổng số lượng bán của từng NGK.
--9) Hiển thị tên và tổng số lượng của NGK nhập về.
--10) Hiển thị ĐĐH đã đặt NGK với số lượng nhiều nhất so với các ĐĐH khác có đặt NGK đó. Thông tin
--hiển thị: SoDDH, MaNGK, [SL đặt nhiều nhất].
--11) Hiển thị các NGK không được nhập trong tháng 1/2010.
--12) Hiển thị tên các NGK không bán được trong tháng 6/2010.
--13) Cho biết cửa hàng bán bao nhiêu thứ NGK.
--14) Cho biết cửa hàng bán bao nhiêu loại NGK.
--15) Hiển thị thông tin của khách hàng có giao dịch với cửa hàng nhiều nhất (căn cứ vào số lần mua
--hàng).
--16) Tính tổng doanh thu năm 2010 của cửa hàng.
--17) Liệt kê 5 loại NGK bán chạy nhất (doanh thu) trong tháng 5/2010.
--6
--18) Liệt kê thông tin bán NGK của tháng 5/2010. Thông tin hiển thị: Mã NGK, Tên NGK, SL bán.
--19) Liệt kê thông tin của NGK có nhiều người mua nhất.
--20) Hiển thị ngày nhập hàng gần nhất của cửa hàng.
--21) Cho biết số lần mua hàng của khách có mã là ‘KH001’.
--22) Cho biết tổng tiền của từng hóa đơn.
--23) Cho biết danh sách các hóa đơn gồm SoHD, NgaylapHD, MaKH, TenKH và tổng trị giá của từng
--HoaDon. Danh sách sắp xếp tăng dần theo ngày và giảm dần theo tổng trị giá của hóa đơn.
--24) Cho biết các hóa đơn có tổng trị giá lớn hơn tổng trị giá trung bình của các hóa đơn trong ngày
--18/06/2010.
--25) Cho biết số lượng từng NGK tiêu thụ theo từng tháng của năm 2010.
--26) Đưa ra danh sách NGK chưa được bán trong tháng 9 năm 2010.
--27) Đưa ra danh sách khách hàng có địa chỉ ở TP.HCM và từng mua NGK trong tháng 9 năm 2010.
--28) Đưa ra số lượng đã bán tương ứng của từng NGK trong tháng 10 năm 2010.
--29) Hiển thị thông tin khách hàng đã từng mua và tổng số lượng của từng NGK tại cửa hàng.
--30) Cho biết trong năm 2010, khách hàng nào đã mua nợ nhiều nhất.
--31) Có bao nhiêu hóa đơn chưa thanh toán hết số tiền?
--32) Liệt kê các hóa đơn cùng tên của khách hàng tương ứng đã mua NGK và thanh toán tiền đầy đủ 1
--lần. (Không có phiếu trả nợ)
--33) Thông kê cho biết thông tin đặt hàng của cửa hàng trong năm 2010: Mã NGK, Tên NGK, Tổng SL
--đặt.
--34) Để thuận tiện trong việc tặng quà Tết cho khách hàng, hãy liệt kê danh sách khách
--hàng đã mua NGK với tổng số tiền tương ứng trong năm 2010 (hiển thị giảm dần theo số tiền đã mua)


-----------------------------------VIEW
--1. Tạo View V_NGK tổng hợp dữ liệu về từng NGK đã được bán. Cấu trúc View gồm các thuộc tính:
--MaNGK, TenNGK, Quycach, SoLuongBan,Tổng tiền= SoLuongBan*Đơn giá bán
--2. Tạo View V_khachang tổng hợp dữ liệu về 10 khách hàng lớn. Danh sách gồm MaKH, TenKH,
--DTKH, Tổng tiền= SoLuongBan*Đơn giá bán
--3. Tạo view V_TRANO cho biết danh sách khách hàng đã thu hơn 2 lần nhưng chưa trả hết tiền. Danh
--sách gồm: MaKH, TenKH, DTKH, tổng tiền phải trả, tổng tiền đã trả, số lần thu tiền
--4. Tạo view V_ngk_ton hiển thị thông tin nước giải khát chưa bán được

-----------------------------------PROCEDURE
--1. Tạo thủ tục sp _ngk liệt kê tất cả nước giải khát và loại nước giải khát tương ứng
--2. Tạo thủ tục sp_ncc cho biết thông tin về nhà cung cấp với mã nhà cung cấp là tham số đầu vào
--3. Tạo thủ tục sp_ton hiển thị thông tin nước giải khát chưa bán được
--4. Tạo thủ tục sp_dt tinh tổng doanh thu của năm (với năm là tham số đầu vào và doanh thu là tham số đầu
--ra)
--5. Tạo thủ tục sp_tong_dt tinh tổng doanh thu của năm (với năm là tham số đầu vào và doanh thu là tham
--số đầu ra)
--6. Tạo thủ tục sp_danhsach liệt kê n loại nước giải khát bán chạy nhất (doanh thu) trong tháng (với n và
--tháng là tham số đầu vào)
--7. Tạo thủ tục sp_insert_CTPGH nhận vào các tham số tương ứng với thông tin của một dòng trong chi
--tiết phiếu giao hàng, nếu các điều kiện sau đây được thỏa mãn thì thêm dòng mới tương ứng với các thông
--tin đã cho vào Table CT_PGH:
-- +)SoPGH phải tồn tại trong table PGH
-- +)MaNGK ứng với SoDDH phải tồn tại trong table CT_DDH
-- +)SLGiao<=SLDAT
--Thông báo nếu điều kiện trên bị vi phạm
--8. Tạo thủ tục có tên sp_delete_CTPH nhận vào các tham số tương ứng với thông tin của một dòng trong
-- chi tiết phiếu hẹn, thực hiện các yêu cầu sau:
-- +) Xóa dòng trương ứng trong chi tiết phiếu hẹn
-- +) Nếu phiếu hẹn tương ứng không còn dòng chi tiết thì xóa luôn phiếu hẹn đó
-----------------------------------FUNCTION
-----------------------------------TRIGGER








