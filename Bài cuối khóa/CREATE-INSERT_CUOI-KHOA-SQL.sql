CREATE DATABASE CUOI_KHOA_SQL_THAI
GO

-- Bảng KHACHHANG
CREATE TABLE THAI_KHACHHANG (
    MAKH CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    DCHI VARCHAR(50),
    SODT VARCHAR(20),
    NGSINH DATE,
    NGDK DATE,
    DOANHSO NUMERIC
);
SELECT * FROM THAI_KHACHHANG

-- Bảng NHANVIEN
CREATE TABLE THAI_NHANVIEN (
    MANV CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR(40),
    SODT VARCHAR(20),
    NGVL DATE
);
SELECT * FROM THAI_NHANVIEN

-- Bảng SANPHAM
CREATE TABLE THAI_SANPHAM (
    MASP CHAR(4) PRIMARY KEY,
    TENSP VARCHAR(40),
    DVT VARCHAR(20),
    NUOCSX VARCHAR(40),
    GIA NUMERIC
);
SELECT * FROM THAI_SANPHAM


-- Bảng HOADON
CREATE TABLE THAI_HOADON (
    SOHD NUMERIC PRIMARY KEY,
    NGHD DATE,
    MAKH CHAR(4),
    MANV CHAR(4),
    TRIGIA NUMERIC,
    FOREIGN KEY (MAKH) REFERENCES THAI_KHACHHANG(MAKH),
    FOREIGN KEY (MANV) REFERENCES THAI_NHANVIEN(MANV)
);
SELECT * FROM THAI_HOADON


-- Bảng CTHD
CREATE TABLE THAI_CTHD (
    SOHD NUMERIC,
    MASP CHAR(4),
    SL NUMERIC,
    PRIMARY KEY (SOHD, MASP),
    FOREIGN KEY (SOHD) REFERENCES THAI_HOADON(SOHD),
    FOREIGN KEY (MASP) REFERENCES THAI_SANPHAM(MASP)
);
SELECT * FROM THAI_CTHD



-- THÊM DỮ LIỆU BẢNG KHÁCH HÀNG
INSERT INTO THAI_KHACHHANG VALUES ('KH01', 'Nguyen Van A', '731, Tran Hung Dao, Q 5 ,Tp HCM', '08823451', '1960-10-22', '2006-10-22', 13000000);
INSERT INTO THAI_KHACHHANG VALUES ('KH02', 'Tran Ngoc Han', '23/5, Nguyen Trai, Q 5, Tp HCM', '0908256478', '1974-04-03', '2006-07-30', 280000);
INSERT INTO THAI_KHACHHANG VALUES ('KH03', 'Tran Ngoc Linh', '45, Nguyen Canh Chan, Q 1, Tp HCM', '0938776266', '1980-06-12', '2006-08-05', 3860000);
INSERT INTO THAI_KHACHHANG VALUES ('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q 10, Tp HCM', '0917325476', '1965-03-09', '2006-10-02', 250000);
INSERT INTO THAI_KHACHHANG VALUES ('KH05', 'Le Nhat Minh', '34, Truong Dinh, Q 3, Tp HCM', '08246108', '1950-03-10', '2006-10-28', 21000);
INSERT INTO THAI_KHACHHANG VALUES ('KH06', 'Le Hoai Thuong', '227, Nguyen Van Cu, Q 5, Tp HCM', '08631738', '1981-12-31', '2006-11-24', 915000);
INSERT INTO THAI_KHACHHANG VALUES ('KH07', 'Nguyen Van Tam', '32/3, Tran Binh Trong, Q 5, Tp HCM', '0916783565', '1971-04-06', '2006-12-01', 12500);
INSERT INTO THAI_KHACHHANG VALUES ('KH08', 'Phan Thi Thanh', '45/2, An Duong Vuong, Q 5, Tp HCM', '0938435756', '1971-01-10', '2006-12-13', 365000);
INSERT INTO THAI_KHACHHANG VALUES ('KH09', 'Le Ha Vinh', '873, Le Hong Phong, Q 5, Tp HCM', '08654763', '1979-09-03', '2007-01-14', 70000);
INSERT INTO THAI_KHACHHANG VALUES ('KH10', 'Ha Duy Lap', '34/34B, Nguyen Trai, Q 1, Tp HCM', '08768904', '1983-05-02', '2007-01-16', 67500);

-- THÊM DỮ LIỆU NHÂN VIÊN
INSERT INTO THAI_NHANVIEN VALUES ('NV01', 'Nguyen Nhu Nhut', '0927345678', '2006-04-13');
INSERT INTO THAI_NHANVIEN VALUES ('NV02', 'Le Thi Phi Yen', '0987567390', '2006-04-21');
INSERT INTO THAI_NHANVIEN VALUES ('NV03', 'Nguyen Van B', '0997047382', '2006-04-27');
INSERT INTO THAI_NHANVIEN VALUES ('NV04', 'Ngo Thanh Tuan', '0913758498', '2006-06-24');
INSERT INTO THAI_NHANVIEN VALUES ('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '2006-07-20');


--THÊM DỮ LIỆU SẢN PHẨM
insert into THAI_SANPHAM values ('BC01','But chi','cay','Singapore',3000)
insert into THAI_SANPHAM values ('BC02','But chi','cay','Singapore',5000)
insert into THAI_SANPHAM values ('BC03','But chi','cay','Viet Nam',3500)
insert into THAI_SANPHAM values ('BC04','But chi','hop','Viet Nam',30000)
insert into THAI_SANPHAM values ('BB01','But bi','cay','Viet Nam',5000)
insert into THAI_SANPHAM values ('BB02','But bi','cay','Trung Quoc',7000)
insert into THAI_SANPHAM values ('BB03','But bi','hop','Thai Lan',100000)
insert into THAI_SANPHAM values ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into THAI_SANPHAM values ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into THAI_SANPHAM values ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into THAI_SANPHAM values ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into THAI_SANPHAM values ('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into THAI_SANPHAM values ('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into THAI_SANPHAM values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into THAI_SANPHAM values ('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into THAI_SANPHAM values ('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into THAI_SANPHAM values ('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into THAI_SANPHAM values ('ST04','So tay ','quyen','Thai Lan',55000)
insert into THAI_SANPHAM values ('ST05','So tay mong','quyen','Thai Lan',20000)
insert into THAI_SANPHAM values ('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into THAI_SANPHAM values ('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into THAI_SANPHAM values ('ST08','Bong bang','cai','Viet Nam',1000)
insert into THAI_SANPHAM values ('ST09','But long','cay','Viet Nam',5000)
insert into THAI_SANPHAM values ('ST10','But long','cay','Trung Quoc',7000)

-- THÊM DỮ LIỆU HÓA ĐƠN
INSERT INTO THAI_HOADON VALUES (1001, '2006-07-23', 'KH01', 'NV01', 320000);
INSERT INTO THAI_HOADON VALUES (1002, '2006-08-12', 'KH01', 'NV02', 840000);
INSERT INTO THAI_HOADON VALUES (1003, '2006-08-23', 'KH02', 'NV01', 100000);
INSERT INTO THAI_HOADON VALUES (1004, '2006-09-01', 'KH02', 'NV01', 180000);
INSERT INTO THAI_HOADON VALUES (1005, '2006-10-20', 'KH01', 'NV02', 3800000);
INSERT INTO THAI_HOADON VALUES (1006, '2006-10-16', 'KH01', 'NV03', 2430000);
INSERT INTO THAI_HOADON VALUES (1007, '2006-10-28', 'KH03', 'NV03', 510000);
INSERT INTO THAI_HOADON VALUES (1008, '2006-10-28', 'KH01', 'NV03', 440000);
INSERT INTO THAI_HOADON VALUES (1009, '2006-10-28', 'KH03', 'NV04', 200000);
INSERT INTO THAI_HOADON VALUES (1010, '2006-11-01', 'KH01', 'NV01', 5200000);
INSERT INTO THAI_HOADON VALUES (1011, '2006-11-04', 'KH04', 'NV03', 250000);
INSERT INTO THAI_HOADON VALUES (1012, '2006-11-30', 'KH05', 'NV03', 21000);
INSERT INTO THAI_HOADON VALUES (1013, '2006-12-12', 'KH06', 'NV01', 5000);
INSERT INTO THAI_HOADON VALUES (1014, '2006-12-31', 'KH03', 'NV02', 3150000);
INSERT INTO THAI_HOADON VALUES (1015, '2007-01-01', 'KH06', 'NV01', 910000);
INSERT INTO THAI_HOADON VALUES (1016, '2007-01-01', 'KH07', 'NV02', 12500);
INSERT INTO THAI_HOADON VALUES (1017, '2007-01-02', 'KH08', 'NV03', 35000);
INSERT INTO THAI_HOADON VALUES (1018, '2007-01-13', 'KH08', 'NV03', 330000);
INSERT INTO THAI_HOADON VALUES (1019, '2007-01-13', 'KH01', 'NV03', 30000);
INSERT INTO THAI_HOADON VALUES (1020, '2007-01-14', 'KH09', 'NV04', 70000);
INSERT INTO THAI_HOADON VALUES (1021, '2007-01-16', 'KH10', 'NV03', 67500);
INSERT INTO THAI_HOADON VALUES (1022, '2007-01-16', NULL, 'NV03', 7000);
INSERT INTO THAI_HOADON VALUES (1023, '2007-01-17', NULL, 'NV01', 330000);

--THÊM DỮ LIỆU CHI TIẾT HÓA ĐƠN
insert into THAI_CTHD values (1001,'TV02',10)
insert into THAI_CTHD values (1001,'ST01',5)
insert into THAI_CTHD values (1001,'BC01',5)
insert into THAI_CTHD values (1001,'BC02',10)
insert into THAI_CTHD values (1001,'ST08',10)
insert into THAI_CTHD values (1002,'BC04',20)
insert into THAI_CTHD values (1002,'BB01',20)
insert into THAI_CTHD values (1002,'BB02',20)
insert into THAI_CTHD values (1003,'BB03',10)
insert into THAI_CTHD values (1004,'TV01',20)
insert into THAI_CTHD values (1004,'TV02',20)
insert into THAI_CTHD values (1004,'TV03',20)
insert into THAI_CTHD values (1004,'TV04',20)
insert into THAI_CTHD values (1005,'TV05',50)
insert into THAI_CTHD values (1005,'TV06',50)
insert into THAI_CTHD values (1006,'TV07',20)
insert into THAI_CTHD values (1006,'ST01',30)
insert into THAI_CTHD values (1006,'ST02',10)
insert into THAI_CTHD values (1007,'ST03',10)
insert into THAI_CTHD values (1008,'ST04',8)
insert into THAI_CTHD values (1009,'ST05',10)
insert into THAI_CTHD values (1010,'TV07',50)
insert into THAI_CTHD values (1010,'ST07',50)
insert into THAI_CTHD values (1010,'ST08',100)
insert into THAI_CTHD values (1010,'ST04',50)
insert into THAI_CTHD values (1010,'TV03',100)
insert into THAI_CTHD values (1011,'ST06',50)
insert into THAI_CTHD values (1012,'ST07',3)
insert into THAI_CTHD values (1013,'ST08',5)
insert into THAI_CTHD values (1014,'BC02',80)
insert into THAI_CTHD values (1014,'BB02',100)
insert into THAI_CTHD values (1014,'BC04',60)
insert into THAI_CTHD values (1014,'BB01',50)
insert into THAI_CTHD values (1015,'BB02',30)
insert into THAI_CTHD values (1015,'BB03',7)
insert into THAI_CTHD values (1016,'TV01',5)
insert into THAI_CTHD values (1017,'TV02',1)
insert into THAI_CTHD values (1017,'TV03',1)
insert into THAI_CTHD values (1017,'TV04',5)
insert into THAI_CTHD values (1018,'ST04',6)
insert into THAI_CTHD values (1019,'ST05',1)
insert into THAI_CTHD values (1019,'ST06',2)
insert into THAI_CTHD values (1020,'ST07',10)
insert into THAI_CTHD values (1021,'ST08',5)
insert into THAI_CTHD values (1021,'TV01',7)
insert into THAI_CTHD values (1021,'TV02',10)
insert into THAI_CTHD values (1022,'ST07',1)
insert into THAI_CTHD values (1023,'ST04',6)




































































