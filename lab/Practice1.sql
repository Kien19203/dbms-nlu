--BÀI THỰC HÀNH 1 - HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU 9/2023.

--Tạo database
CREATE DATABASE QUANLYDEAN
GO

USE QUANLYDEAN

CREATE TABLE DEAN (
MaDA INT NOT NULL,
TenDA Nvarchar(20),
KinhPhi INT,
CONSTRAINT PK_dean PRIMARY KEY(MaDA)

)

CREATE TABLE PHONGBAN(
MaPB int NOT NULL,
TenPB Nvarchar(20),
MaTP int,
DiaDiem varchar(20),
CONSTRAINT PK_phongban PRIMARY KEY (MaPB)
)


CREATE TABLE NHANVIEN(
MaNV int NOT NULL,
TenNV Nvarchar(20),
NgaySinh date,
GT Nvarchar(10), 
MaPB int NOT NULL,
CONSTRAINT PK_nhanvien PRIMARY KEY (MaNV),
CONSTRAINT FK_nhanvien FOREIGN KEY(MaPB) REFERENCES dbo.PHONGBAN(MaPB)
)

CREATE TABLE THAMGIA(
MaNV int NOT NULL,
MaDA int NOT NULL,
NgayBD date,
Chucvu Nvarchar(20),
CONSTRAINT PK_thamgia PRIMARY KEY(MaNV, MaDA)
)

ALTER TABLE dbo.DEAN
ALTER COLUMN TenDA Nvarchar(30)


INSERT INTO dbo.DEAN
VALUES (
1001 , -- int, Mã đề án
N'Tra cứu' , --nvarchar(20), tên đề án
260000 -- int, Kinh phí đề án
) ,
(
1002 , -- int, Mã đề án
N'Phân tích' , --nvarchar(20), tên đề án
100000 -- int, Kinh phí đề án
) ,
(
1003 , -- int, Mã đề án
N'Thực Nghiệm' , --nvarchar(20), tên đề án
994000 -- int, Kinh phí đề án
) ,
(
1004 , -- int, Mã đề án
N'Phát minh' , --nvarchar(20), tên đề án
2400000 -- int, Kinh phí đề án
) ,
(
1005 , -- int, Mã đề án
N'Chi Nhánh' , --nvarchar(20), tên đề án
4800000-- int, Kinh phí đề án
) ;
select * from DEAN


ALTER TABLE dbo.PHONGBAN
ALTER COLUMN TenPB Nvarchar(40)
ALTER TABLE dbo.PHONGBAN
ALTER COLUMN DiaDiem Nvarchar(40)
INSERT INTO dbo.PHONGBAN 
VALUES (
400, --int, Mã phòng ban
N'Ban Quản Lý', --Nvarchar, tên phòng ban
001, --int, Mã trưởng phòng
N'Rạng Đông 400' --Nvarchar, địa điểm
),
(
401, --int, Mã phòng ban
N'Ban Ngân sách', --Nvarchar, tên phòng ban
099, --int, Mã trưởng phòng
N'Tường Vy 100' --Nvarchar, địa điểm
),
(
402, --int, Mã phòng ban
N'Ban Thực Thi', --Nvarchar, tên phòng ban
028, --int, Mã trưởng phòng
N'Cát tường 200' --Nvarchar, địa điểm
),
(
403, --int, Mã phòng ban
N'Ban Vệ Sinh', --Nvarchar, tên phòng ban
017, --int, Mã trưởng phòng
N'Cẩm tú 300' --Nvarchar, địa điểm
);

SELECT * FROM PHONGBAN

