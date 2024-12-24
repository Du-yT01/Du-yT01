SELECT
    *
FROM PRODUCTS

--Câu 1: L?y ra t?t c? nh?ng s?n ph?m mà công ty ?ang bán (Chu?n hóa l?i tên s?n ph?m: Chuy?n ??i t?t c? các ký t? ??u c?a m?i t? sang hoa, các ký t? còn l?i sang ch? th??ng ). (G?i ý: S? d?ng hàm INITCAP())
SELECT 
    PRODUCT_ID, 
    INITCAP(PRODUCT_NAME) AS NORMALIZED_PRODUCT_NAME
FROM 
    PRODUCTS

--Câu 2: L?y ra t?t c? các s?n ph?m bao g?m: Tên s?n ph?m, mô t? (Xóa t?t c? ký t? ‘Speed:’ n?m bên trái) c?a s?n ph?m có mô t? s?n ph?m (description) b?t ??u b?ng ‘Speed’
SELECT 
    PRODUCT_NAME,
    LTRIM(DESCRIPTION,'Speed:') AS DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION LIKE  'Speed%'

--Câu 3: L?y ra t?t c? các s?n ph?m bao g?m: Tên s?n ph?m, Hãng (C?t này ???c l?y b?ng cách C?t l?y 5 ký t? ??u c?a tên s?n ph?m) c?a s?n ph?m b?t ??u ‘Intel’
SELECT 
    PRODUCT_NAME AS "TÊN S?N PH?M",
    SUBSTR(PRODUCT_NAME,1,5) AS "HÃNG"
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE  'Intel%'

--Câu 4: L?y ra t?t c? thông tin s?n ph?m có ?? dài ký t? c?a tên s?n ph?m < 12 ký t? (G?i ý: Dùng Hàm LENGTH())
SELECT * 
FROM PRODUCTS 
WHERE LENGTH(PRODUCT_NAME) < 12

--Câu 5: L?y ra báo cáo t?ng giá tr? ??n hàng ?ã mua (status = "Shipped") c?a các khách hàng theo t?ng n?m, S?p x?p theo th? t? mã khách hàng, n?m mua hàng.
SELECT 
    CUSTOMER_ID, 
    EXTRACT(YEAR FROM ORDER_DATE) AS ORDER_YEAR,
    SUM(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) AS TOTAL_ORDER_VALUE
FROM 
    ORDERS
INNER JOIN 
    ORDER_ITEMS 
ON 
    ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
WHERE 
    ORDERS.STATUS = 'Shipped'
GROUP BY 
    CUSTOMER_ID, 
    EXTRACT(YEAR FROM ORDER_DATE)
ORDER BY 
    CUSTOMER_ID, 
    ORDER_YEAR;
--Câu 6: L?y ra báo cáo t?ng giá tr? ??n hàng ch?a giao(status = "Pending") c?a các khách hàng trong vòng 3 tháng tr??c tính t? ngày ‘2017/03/14' , S?p x?p theo mã khách hàng, t?ng giá tr? ??n ch?a giao.

SELECT 
    CUSTOMER_ID, 
    SUM(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) AS TOTAL_ORDER_VALUE
FROM 
    ORDERS
INNER JOIN 
    ORDER_ITEMS 
ON 
    ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
WHERE 
    ORDERS.STATUS = 'Pending'
    AND ORDER_DATE BETWEEN ADD_MONTHS(TO_DATE('2017/03/14','YYYY/MM/DD'),-3) AND TO_DATE('2017/03/14','YYYY/MM/DD')
GROUP BY 
    CUSTOMER_ID
ORDER BY 
    CUSTOMER_ID,
    TOTAL_ORDER_VALUE


--CÂU 7:
SELECT 
    SALESMAN_ID, 
    EXTRACT(YEAR FROM ORDER_DATE) AS ORDER_YEAR,
    EXTRACT(MONTH FROM ORDER_DATE) AS ORDER_MONTH,
    SUM(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) AS TOTAL_CANCELED_VALUE,
    MAX(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) AS MAX_CANCELED_ORDER,
    MIN(ORDER_ITEMS.UNIT_PRICE * ORDER_ITEMS.QUANTITY) AS MIN_CANCELED_ORDER
FROM 
    ORDERS
INNER JOIN 
    ORDER_ITEMS 
ON 
    ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
WHERE 
    ORDERS.STATUS = 'Canceled'
GROUP BY 
    SALESMAN_ID, 
    EXTRACT(YEAR FROM ORDER_DATE), 
    EXTRACT(MONTH FROM ORDER_DATE)
ORDER BY  
    ORDER_YEAR,
    SALESMAN_ID,
    ORDER_MONTH;


