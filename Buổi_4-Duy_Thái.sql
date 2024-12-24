SELECT
    *
FROM PRODUCTS

--C�u 1: L?y ra t?t c? nh?ng s?n ph?m m� c�ng ty ?ang b�n (Chu?n h�a l?i t�n s?n ph?m: Chuy?n ??i t?t c? c�c k� t? ??u c?a m?i t? sang hoa, c�c k� t? c�n l?i sang ch? th??ng ). (G?i �: S? d?ng h�m INITCAP())
SELECT 
    PRODUCT_ID, 
    INITCAP(PRODUCT_NAME) AS NORMALIZED_PRODUCT_NAME
FROM 
    PRODUCTS

--C�u 2: L?y ra t?t c? c�c s?n ph?m bao g?m: T�n s?n ph?m, m� t? (X�a t?t c? k� t? �Speed:� n?m b�n tr�i) c?a s?n ph?m c� m� t? s?n ph?m (description) b?t ??u b?ng �Speed�
SELECT 
    PRODUCT_NAME,
    LTRIM(DESCRIPTION,'Speed:') AS DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION LIKE  'Speed%'

--C�u 3: L?y ra t?t c? c�c s?n ph?m bao g?m: T�n s?n ph?m, H�ng (C?t n�y ???c l?y b?ng c�ch C?t l?y 5 k� t? ??u c?a t�n s?n ph?m) c?a s?n ph?m b?t ??u �Intel�
SELECT 
    PRODUCT_NAME AS "T�N S?N PH?M",
    SUBSTR(PRODUCT_NAME,1,5) AS "H�NG"
FROM PRODUCTS
WHERE PRODUCT_NAME LIKE  'Intel%'

--C�u 4: L?y ra t?t c? th�ng tin s?n ph?m c� ?? d�i k� t? c?a t�n s?n ph?m < 12 k� t? (G?i �: D�ng H�m LENGTH())
SELECT * 
FROM PRODUCTS 
WHERE LENGTH(PRODUCT_NAME) < 12

--C�u 5: L?y ra b�o c�o t?ng gi� tr? ??n h�ng ?� mua (status = "Shipped") c?a c�c kh�ch h�ng theo t?ng n?m, S?p x?p theo th? t? m� kh�ch h�ng, n?m mua h�ng.
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
--C�u 6: L?y ra b�o c�o t?ng gi� tr? ??n h�ng ch?a giao(status = "Pending") c?a c�c kh�ch h�ng trong v�ng 3 th�ng tr??c t�nh t? ng�y �2017/03/14' , S?p x?p theo m� kh�ch h�ng, t?ng gi� tr? ??n ch?a giao.

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


--C�U 7:
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


