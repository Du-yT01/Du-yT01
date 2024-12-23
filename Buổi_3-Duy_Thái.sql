
-- Câu 1 Tạo bảng
CREATE TABLE Thai_Oils (
    NGAY DATE,
    LOAI NVARCHAR(50),
    GIA_BAN INT,
    TON_KHO INT,
    GIA_TRI DECIMAL(20,2),
    CUA_HANG NVARCHAR(50),
    QUAN_HUYEN NVARCHAR(50)
);

--Câu 2 Thêm dữ liệu vào bảng
INSERT INTO Thai_Oils (NGAY, LOAI, GIA_BAN, TON_KHO, GIA_TRI, CUA_HANG, QUAN_HUYEN) VALUES
('2020-08-31', N'RON 95-IV', 15210, 1900, 28899000.00, N'CHXD SỐ 74', N'Thanh Trì'),
('2020-08-31', N'RON 95-III', 14920, 754, 11249680.00, N'CHXD SỐ 74', N'Thanh Trì'),
('2020-08-31', N'E5 RON 92-II', 14400, 3646, 52502400.00, N'CHXD SỐ 74', N'Thanh Trì'),
('2020-08-31', N'DIEZEN', 12450, 3533, 43985850.00, N'CHXD SỐ 74', N'Thanh Trì'),
('2020-08-31', N'DẦU HỎA', 10200, 2344, 23908800.00, N'CHXD SỐ 74', N'Thanh Trì'),
('2020-08-31', N'MAZUT', 11380, 3422, 38942360.00, N'CHXD SỐ 74', N'Thanh Trì'),

('2020-08-31', N'RON 95-IV', 15210, 1900, 28899000.00, N'CHXD SỐ 75', N'Hoàng Mai'),
('2020-08-31', N'RON 95-III', 14920, 2344, 34972480.00, N'CHXD SỐ 75', N'Hoàng Mai'),
('2020-08-31', N'E5 RON 92-II', 14400, 3555, 51192000.00, N'CHXD SỐ 75', N'Hoàng Mai'),
('2020-08-31', N'DIEZEN', 12450, 866, 10781700.00, N'CHXD SỐ 75', N'Hoàng Mai'),
('2020-08-31', N'DẦU HỎA', 10200, 7657, 78101400.00, N'CHXD SỐ 75', N'Hoàng Mai'),
('2020-08-31', N'MAZUT', 11380, 9534, 108496920.00, N'CHXD SỐ 75', N'Hoàng Mai'),

('2020-08-31', N'RON 95-IV', 15210, 1900, 28899000.00, N'CHXD SỐ 85', N'Long Biên'),
('2020-08-31', N'RON 95-III', 14920, 6456, 96323520.00, N'CHXD SỐ 85', N'Long Biên'),
('2020-08-31', N'E5 RON 92-II', 14400, 5345, 76968000.00, N'CHXD SỐ 85', N'Long Biên'),
('2020-08-31', N'DIEZEN', 12450, 234, 2913300.00, N'CHXD SỐ 85', N'Long Biên'),
('2020-08-30', N'DẦU HỎA', 10200, 4244, 43288800.00, N'CHXD SỐ 85', N'Long Biên'),
('2020-08-30', N'MAZUT', 11380, 2424, 27585120.00, N'CHXD SỐ 85', N'Long Biên');

--Câu 3: Sử dụng câu truy vấn để trả lời các câu hỏi sau:
		--Dữ liệu báo cáo bao gồm những ngày nào?
		--Có tất cả bao nhiêu loại xăng đang được bán?
		--Có bao nhiêu cửa hàng đang hoạt động? 
		--Có bao nhiêu cửa hàng thuộc QUẬN: Long Biên

SELECT DISTINCT NGAY 
FROM Thai_Oils

SELECT DISTINCT LOAI 
FROM Thai_Oils

SELECT DISTINCT CUA_HANG
FROM Thai_Oils

SELECT DISTINCT CUA_HANG 
FROM Thai_Oils
WHERE Quan_Huyen = 'Long Biên'


-- Câu 4: Đổi tên cột NGAY thành NGAY_BAO_CAO, GIA_TRI thành GIA_TRI_VND
EXEC sp_rename 'Thai_Oils.NGAY', 'NGAY_BAO_CAO', 'Column'
Exec sp_rename 'Thai_Oils.GIA_TRI' , 'GIA_TRI_VND' , 'colunm'
SELECT*FROM Thai_Oils


--Câu 5: Update TON_KHO = 1900 đới với LOAI= ‘RON 95-IV’ và có NGAY_BAO_CAO = ‘31/08/2020’

UPDATE Thai_Oils
SET Ton_Kho = 1900
WHERE Loai = N'RON 95-IV' AND NGAY_BAO_CAO = '2020-08-31';


--Câu 6: Update lại GIA_TRI = TON_KHO * GIA_BAN đới với LOAI= ‘RON 95-IV’ và có NGAY_BAO_CAO = ‘31/08/2020’ theo TON_KHO mới

UPDATE Thai_Oils
SET GIA_TRI = TON_KHO * GIA_BAN
WHERE LOAI = N'RON 95-IV' AND NGAY_BAO_CAO = '2020-08-31'

--Câu 7: Xóa bỏ tất cả các bản ghi với LOAI là ‘DIEZEN’ và ở  CUA_HANG  ‘CHXD SỐ 60’ và ‘CHXD SỐ 74’
DELETE FROM Thai_Oils
WHERE Loai = N'DIEZEN' AND (Cua_Hang = N'CHXD SỐ 60' OR Cua_Hang = N'CHXD SỐ 74');

--Câu 8: Xóa bỏ tất cả các bản ghi với LOAI là ‘MAZUT’ có TON_KHO nhỏ hơn 11380
DELETE FROM Thai_Oils
WHERE LOAI = N'MAZUT' AND TON_KHO < '1300'

--Câu 9: Tạo ra bảng <tên học viên>_Oils_Backup_31082020 từ bảng <tên học viên>_Oils với điều kiện NGAY_BAO_CAO = '31/08/2020’
SELECT *
INTO Thai_Oils_Backup_31082020
FROM Thai_Oils
WHERE NGAY_BAO_CAO = '2020-08-31';

SELECT*FROM Thai_Oils_Backup_31082020

--Câu 10: Xóa toàn bộ dữ liệu trong bảng <tên học viên>_Oils
Delete from Thai_Oils

--Câu 11: Xóa  bảng <tên học viên>_Oils
drop table Thai_Oils
