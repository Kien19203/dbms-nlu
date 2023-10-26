﻿---BÀI THỰC HÀNH 3 - HQTCSDL 2023

CREATE DATABASE QUANLYGIAOVU
USE QUANLYGIAOVU 

CREATE TABLE HOCVIEN (
MAHV char(5) not null,
HO varchar(25) ,
TEN varchar(10),
NGSINH DATE, 
GIOITINH CHAR(3), 
NOISINH CHAR(15),
MALOP CHAR(3),
CONSTRAINT PK_HOCVIEN PRIMARY KEY (MAHV)

)

CREATE TABLE LOP(
MALOP CHAR(3) NOT NULL,
TENLOP CHAR(15),
TRGLOP CHAR(5),
SISO TINYINT,
MAGVCN CHAR(4),
CONSTRAINT PK_LOP PRIMARY KEY(MALOP)

)

CREATE TABLE KHOA(
MAKHOA CHAR(4) NOT NULL,
TENKHOA VARCHAR(30),
NGTLAP DATE,
TRGKHOA CHAR(4) 
CONSTRAINT PK_KHOA PRIMARY KEY(MAKHOA)
)

CREATE TABLE MONHOC(
MAMH CHAR(10) NOT NULL,
TENMH VARCHAR(30) , 
TCTL TINYINT,
TCTH TINYINT,
MAKHOA CHAR(4)
CONSTRAINT PK_MONHOC PRIMARY KEY(MAMH)
CONSTRAINT FK_MONHOC FOREIGN KEY(MAKHOA) REFERENCES DBO.KHOA(MAKHOA)
)

CREATE TABLE GIAOVIEN(
MAGV CHAR(4) NOT NULL,
HOTEN VARCHAR(25),
HOCVI CHAR(4),
HOCHAM CHAR(4),
GIOITINH CHAR(3),
NGSINH DATE,
NGVL DATE,
HESO FLOAT,
MUCLUONG INT,
MAKHOA CHAR(4) NOT NULL,
CONSTRAINT PK_GIAOVIEN PRIMARY KEY(MAGV),
CONSTRAINT FK_GIAOVIEN FOREIGN KEY (MAKHOA) REFERENCES DBO.KHOA(MAKHOA)



)

CREATE TABLE GIANGDAY (
MALOP CHAR(3) NOT NULL,
MAMH CHAR(10) NOT NULL,
MAGV CHAR(4) NOT NULL,
HOCKY TINYINT,
NAM TINYINT,
TUNGAY DATE,
DENNGAY DATE
CONSTRAINT PK_GIANGDAY PRIMARY KEY(MALOP, MAMH)
CONSTRAINT FK_GIANGDAY FOREIGN KEY(MAGV) REFERENCES DBO.GIAOVIEN(MAGV)

)
ALTER TABLE GIANGDAY
ALTER COLUMN NAM INT

CREATE TABLE DIEUKIEN (
MAMH CHAR(10) NOT NULL,
MAMH_TRUOC CHAR(10) NOT NULL
CONSTRAINT PK_DIEUKIEN PRIMARY KEY(MAMH)

)

CREATE TABLE KETQUATHI (

MAHV CHAR(5) NOT NULL,
MAMH CHAR(10) NOT NULL,
LANTHI TINYINT,
NGTHI DATE, 
DIEM FLOAT,
KQUA CHAR(10)
CONSTRAINT PK_KETQUATHI PRIMARY KEY(MAHV, MAMH, LANTHI)

)

ALTER TABLE HOCVIEN
ADD CONSTRAINT FK_HOCVIEN FOREIGN KEY (MALOP) REFERENCES DBO.LOP(MALOP)

ALTER TABLE LOP 
ADD CONSTRAINT FK_LOP FOREIGN KEY(MAGVCN) REFERENCES DBO.GIAOVIEN(MAGV)

ALTER TABLE DIEUKIEN
DROP CONSTRAINT PK_DIEUKIEN

ALTER TABLE DIEUKIEN
ADD CONSTRAINT PK_DIEUKIEN PRIMARY KEY(MAMH, MAMH_TRUOC)

ALTER TABLE MONHOC
ALTER COLUMN TENMH VARCHAR(50)


INSERT INTO KHOA 
VALUES ('KHMT', 'Khoa hoc may tinh', '20050607', 'GV01'),
('HTTT', 'He thong thong tin', '20050607', 'GV02'),
('CNPM', 'Cong nghe phan mem', '20050607', 'GV04'),
('MTT', 'Mang va truyen thong', '20051020', 'GV03'),
('KTMT', 'Ky thuat may tinh', '20051220', null)

select * from KHOA

INSERT INTO GIAOVIEN 
VALUES ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '19500502', '20040111', 5.00, 2250000, 'KHMT')

INSERT INTO GIAOVIEN 
VALUES ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '19651207', '20040420', 4.50, 2025000, 'HTTT'),
('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '19500801', '20040923', 4.00, 1800000, 'CNPM'),
('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '19610222', '20050112', 4.50, 2025000, 'KTMT')
INSERT INTO GIAOVIEN 
VALUES 
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '19580312', '20050112', 3.00, 1350000, 'HTTT'),
('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '19530311', '20050112', 4.50, 2025000, 'KHMT'),
('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '19711123', '20050301', 4.00, 1800000, 'KHMT'),
('GV08', 'Le Thi Tran', 'KS', NULL, 'Nu', '19740326', '20050301', 1.69, 760500, 'KHMT')
INSERT INTO GIAOVIEN 
VALUES 
('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '19661231', '20050301', 4.00,1800000, 'HTTT'),
('GV10', 'Le Tran Anh Loan', 'KS', NULL, 'Nu', '19720717', '20050301', 1.86, 837000, 'CNPM')
INSERT INTO GIAOVIEN 
VALUES 
('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '19800112', '20050515', 2.67, 1201500, 'MTT'),
('GV12', 'Tran Van Anh', 'CN', NULL, 'Nu', '19810329', '20050515', 1.69, 760500, 'CNPM')
INSERT INTO GIAOVIEN 
VALUES 
('GV13', 'Nguyen Linh Dan', 'CN', NULL, 'Nu', '19800523', '20050515', 1.69, 760500, 'KTMT'),
('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '19761130', '20050515', 3.00, 1350000, 'MTT'),
('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '19780504', '20050515', 3.00, 1350000, 'KHMT')

select * from GIAOVIEN

INSERT INTO LOP 
VALUES ('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07' ),
('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09' ),
('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV04' )

INSERT INTO MONHOC 
VALUES ('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT' ),
('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT' ),
('CSDL', 'Co so du lieu', 3, 1, 'HTTT' ),
('CTDLGT', 'Cau truc du lieu giai thuat', 3, 1, 'KHMT' ),
('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT' ),
('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT' ),
('KTMT', 'Kien truc may tinh', 3, 0, 'KHMT' ),
('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT' ),
('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT' ),
('HDH', 'He dieu hanh', 4, 0, 'KTMT' ),
('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM' ),
('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM' ),
('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM' )

INSERT INTO GIANGDAY 
VALUES ('K11', 'THDC', 'GV07',1, 2006, '20060102','20060512' ),
('K12', 'THDC', 'GV06',1, 2006, '20060102','20060512' ),
('K13', 'THDC', 'GV15',1, 2006, '20060102','20060512' ),
('K11', 'CTRR', 'GV02',1, 2006, '20060109','20060517' )
INSERT INTO GIANGDAY 
VALUES
('K12', 'CTRR', 'GV02',1, 2006, '20060109','20060517' ),
('K13', 'CTRR', 'GV08',1, 2006, '20060109','20060517' ),
('K11', 'CSDL', 'GV05',2, 2006, '20060601','20060715' )
INSERT INTO GIANGDAY 
VALUES

('K12', 'CSDL', 'GV09',2, 2006, '20060601','20060715' ),
('K13', 'CTDLGT', 'GV15',2, 2006, '20060601','20060715' ),
('K13', 'CSDL', 'GV05',3, 2006, '20060801','20061215' ),
('K13', 'DHMT', 'GV07',3, 2006, '20060801','20061215' ),
('K11', 'CTDLGT', 'GV15',3, 2006, '20060801','20061215' ),
('K12', 'CTDLGT', 'GV15',3, 2006, '20060801','20061215' ),
('K11', 'HDH', 'GV04',1, 2007, '20070102','20060218' ),
('K12', 'HDH', 'GV04',1, 2007, '20070102','20060320' ),
('K11', 'DHMT', 'GV07',1, 2007, '20070218','20060320' )

INSERT INTO DIEUKIEN 
VALUES ('CSDL', 'CTRR'),
('CSDL', 'CTDLGT'),
('CTDLGT', 'THDC'),
('PTTKTT', 'THDC'),
('PTTKTT', 'CTDLGT'),
('DHMT', 'THDC'),
('LTHDT', 'THDC'),
('PTTKHTTT', 'CSDL')

INSERT INTO KETQUATHI 
VALUES
('K1101', 'CSDL', 1, '20060720', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '20061228', 9.00, 'Dat'),
('K1101', 'THDC', 1, '20060520', 9.00, 'Dat'),
('K1101', 'CTRR', 1, '20060513', 9.50, 'Dat'),
('K1102', 'CSDL', 1, '20060720', 4.00, 'Khong Dat'),
('K1102', 'CSDL', 2, '20060727', 4.25, 'Khong Dat'),
('K1102', 'CSDL', 3, '20060810', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 1, '20071228', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '20070105', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '20060115', 6.00, 'Dat'),
('K1102', 'THDC', 1, '20060520', 5.00, 'Dat'),
('K1102', 'CTRR', 1, '20060513', 7.00, 'Dat'),
('K1103', 'CSDL', 1, '20060720', 3.50, 'Khong Dat'),
('K1103', 'CSDL', 2, '20060727', 8.25, 'Dat'),
('K1103', 'CTDLGT', 1, '20061228', 7.00, 'Dat'),
('K1103', 'THDC', 1, '20060520', 8.00, 'Dat'),
('K1103', 'CTRR', 1, '20060513', 6.50, 'Dat'),
('K1104', 'CSDL', 1, '20060720', 3.75, 'Khong Dat'),
('K1104', 'CTDLGT', 1, '20061228', 4.00, 'Khong Dat'),
('K1104', 'THDC', 1, '20060520', 4.00, 'Khong Dat')







--------------
INSERT INTO KETQUATHI 
VALUES 
('K1104', 'CTRR', 1, '20060513', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 2, '20060520', 3.50, 'Khong Dat'),
('K1104', 'CTRR', 3, '20060630', 4.00, 'Khong Dat'),
('K1201', 'CSDL', 1, '20060720', 6.00, 'Dat'),
('K1201', 'CTDLGT', 1, '20061228', 5.00, 'Dat'),
('K1201', 'THDC', 1, '20060520', 8.50, 'Dat'),
('K1201', 'CTRR', 1, '20060513', 9.00, 'Dat'),
('K1202', 'CSDL', 1, '20060720', 8.00, 'Dat'),
('K1202', 'CTDLGT', 1, '20061228', 4.00, 'Khong Dat'),
('K1202', 'CTDLGT', 2, '20070105', 5.00, 'Dat'),
('K1202', 'THDC', 1, '20060520', 4.00, 'Khong Dat'),
('K1202', 'THDC', 2, '20060527', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 1, '20060513', 3.00, 'Khong Dat')

INSERT INTO KETQUATHI 
VALUES
('K1202', 'CTRR', 2, '20060520', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 3, '20060630', 6.25, 'Dat'),
('K1203', 'CSDL', 1, '20060720', 9.25, 'Dat'),
('K1203', 'CTDLGT', 1, '20061228', 9.50, 'Dat'),
('K1203', 'THDC', 1, '20060520', 10.00, 'Dat'),
('K1203', 'CTRR', 1, '20060513', 10.00, 'Dat'),
('K1204', 'CSDL', 1, '20060720', 8.50, 'Dat'),
('K1204', 'CTDLGT', 1, '20061228', 6.75, 'Dat'),
('K1204', 'THDC', 1, '20060520', 4.00, 'Khong Dat'),
('K1204', 'CTRR', 1, '20060513', 6.00, 'Dat'),
('K1301', 'CSDL', 1, '20061220', 4.25, 'Khong Dat'),
('K1301', 'CTDLGT', 1, '20060725', 8.00, 'Dat'),
('K1301', 'THDC', 1, '20060520', 7.75, 'Dat'),
('K1301', 'CTRR', 1, '20060513', 8.00, 'Dat'),
('K1302', 'CSDL', 1, '20061220', 6.75, 'Dat'),
('K1302', 'CTDLGT', 1, '20060725', 5.00, 'Dat'),
('K1302', 'THDC', 1, '20060520', 8.00, 'Dat'),
('K1302', 'CTRR', 1, '20060513', 8.50, 'Dat'),
('K1303', 'CSDL', 1, '20061220', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 1, '20060725', 4.50, 'Khong Dat'),
('K1303', 'CTDLGT', 2, '20060807', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 3, '20060815', 4.25, 'Khong Dat'),
('K1303', 'THDC', 1, '20060520', 4.50, 'Khong Dat'),
('K1303', 'CTRR', 1, '20060513', 3.25, 'Khong Dat'),
('K1303', 'CTRR', 2, '20060520', 5.00, 'Dat'),
('K1304', 'CSDL', 1, '20061220',7.75, 'Dat'),
('K1304', 'CTDLGT', 1, '20060725', 9.75, 'Dat'),
('K1304', 'THDC', 1, '20060520', 5.50, 'Dat'),
('K1304', 'CTRR', 1, '20060513', 5.00, 'Dat'),
('K1305', 'CSDL', 1, '20061220', 9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '20060725', 10.00, 'Dat'),
('K1305', 'THDC', 1, '20060520', 8.00, 'Dat'),
('K1305', 'CTRR', 1, '20060513', 10.00, 'Dat')



INSERT INTO HOCVIEN
VALUES 
('K1101', 'Nguyen Van', 'A', '19860127', 'Nam', 'TpHCM', 'K11'),
('K1102', 'Tran Ngoc', 'Han', '19860314', 'Nu', 'Kien Giang', 'K11'),
('K1103', 'Ha Duy', 'Lap', '19860418', 'Nam', 'Nghe An', 'K11'),
('K1104', 'Tran Ngoc', 'Linh', '19860330', 'Nu', 'Tay Ninh', 'K11'),
('K1105', 'Tran Minh', 'Long', '19860227', 'Nam', 'TpHCM', 'K11'),
('K1106', 'Le Nhat', 'Minh', '19860124', 'Nam', 'TpHCM', 'K11'),
('K1107', 'Nguyen Nhu', 'Nhut', '19860127', 'Nam', 'Ha Noi', 'K11'),
('K1108', 'Nguyen Manh', 'Tam', '19860227', 'Nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi Thanh', 'Tam', '19860127', 'Nu', 'Vinh Long', 'K11'),
('K1110', 'Le Hoai', 'Thuong', '19860205', 'Nu', 'Can Tho', 'K11'),
('K1111', 'Le Ha', 'Vinh', '19861225', 'Nam', 'Vinh Long', 'K11'),
('K1201', 'Nguyen Van', 'B', '19860211', 'Nam', 'TpHCM', 'K12'),
('K1202', 'Nguyen Thi Kim', 'Duyen', '19860118', 'Nu', 'TpHCM', 'K12'),
('K1203', 'Tran Thi Kim', 'Duyen', '19860917', 'Nu', 'TpHCM', 'K12'),
('K1204', 'Truong My', 'Hanh', '19860519', 'Nu', 'Dong Nai', 'K12'),
('K1205', 'Nguyen Thanh', 'Nam', '19860417', 'Nam', 'TpHCM', 'K12'),
('K1206', 'Nguyen Thi Truc', 'Thanh', '19860304', 'Nu', 'Kien Giang', 'K12'),
('K1207', 'Tran Thi Bich', 'Thuy', '19860208', 'Nu', 'Nghe An', 'K12'),
('K1208', 'Huynh Thi Kim', 'Trieu', '19860408', 'Nu', 'Tay Ninh', 'K12'),
('K1209', 'Pham Thanh', 'Trieu', '19860223', 'Nam', 'TpHCM', 'K12'),
('K1210', 'Ngo Thanh', 'Tuan', '19860214', 'Nam', 'TpHCM', 'K12'),
('K1211', 'Do Thi', 'Xuan', '19860309', 'Nu', 'Ha Noi', 'K12'),
('K1212', 'Le Thi Phi', 'Yen', '19860312', 'Nu', 'TpHCM', 'K12'),
('K1301', 'Nguyen Thi Kim', 'Cuc', '19860609', 'Nu', 'Kien Giang', 'K13'),
('K1302', 'Truong Thi My', 'Hien', '19860318', 'Nu', 'Nghe An', 'K13'),
('K1303', 'Le Duc', 'Hien', '19860321', 'Nam', 'Tay Ninh', 'K13'),
('K1304', 'Le Quang', 'Hien', '19860418', 'Nam', 'TpHCM', 'K13'),
('K1305', 'Le Thi', 'Huong', '19860327', 'Nu', 'TpHCM', 'K13'),
('K1306', 'Nguyen Thai', 'Huu', '19860330', 'Nam', 'Ha Noi', 'K13'),
('K1307', 'Tran Minh', 'Man', '19860528', 'Nam', 'TpHCM', 'K13'),
('K1308', 'Nguyen Hieu', 'Nghia', '19860408', 'Nam', 'Kien Giang', 'K13'),
('K1309', 'Nguyen Trung', 'Nghia', '19860118', 'Nam', 'Nghe An', 'K13'),
('K1310', 'Tran Thi Hong', 'Tham', '19860422', 'Nu', 'Tay Ninh', 'K13'),
('K1311', 'Tran Minh', 'Thuc', '19860404', 'Nam', 'TpHCM', 'K13'),
('K1312', 'Nguyen Thi Kim', 'Yen', '19860907', 'Nu', 'TpHCM', 'K13')



SELECT * FROM KETQUATHI
SELECT * FROM DIEUKIEN
SELECT * FROM HOCVIEN
SELECT * FROM GIAOVIEN
SELECT * FROM GIANGDAY
SELECT * FROM LOP
SELECT * FROM MONHOC
SELECT * FROM KHOA


----------------
