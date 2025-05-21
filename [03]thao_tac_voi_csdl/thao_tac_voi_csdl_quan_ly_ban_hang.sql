USE quan_ly_ban_hang;

INSERT INTO khach_hang (khach_hang_id, ten_khach_hang, tuoi_khach_hang)
VALUES
    (1, 'Minh Quan', 10),
    (2, 'Ngoc Oanh', 20),
    (3, 'Hong Ha', 50);

INSERT INTO don_hang (don_hang_id, khach_hang_id, ngay_dat_hang, tong_tien)
VALUES
    (1, 1, '2006-03-21', NULL),
    (2, 2, '2006-03-23', NULL),
    (3, 1, '2006-03-16', NULL);

INSERT INTO san_pham (san_pham_id, ten_san_pham, gia_san_pham)
VALUES
    (1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);

INSERT INTO chi_tiet_don_hang (don_hang_id, san_pham_id, so_luong)
VALUES
    (1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (2, 1, 1),
    (2, 5, 8),
    (3, 3, 3);

SELECT
    don_hang.don_hang_id,
    don_hang.ngay_dat_hang,
    don_hang.tong_tien
FROM don_hang;

SELECT
    kh.ten_khach_hang,
    sp.ten_san_pham
FROM khach_hang kh
JOIN don_hang dh ON kh.khach_hang_id = dh.khach_hang_id
JOIN chi_tiet_don_hang ct ON dh.don_hang_id = ct.don_hang_id
JOIN san_pham sp ON ct.san_pham_id = sp.san_pham_id;

SELECT
    kh.ten_khach_hang
FROM khach_hang kh
LEFT JOIN don_hang dh ON kh.khach_hang_id = dh.khach_hang_id
WHERE dh.don_hang_id IS NULL;

SELECT
    dh.don_hang_id,
    dh.ngay_dat_hang,
    SUM(ct.so_luong * sp.gia_san_pham) AS gia_tien
FROM don_hang dh
JOIN chi_tiet_don_hang ct ON dh.don_hang_id = ct.don_hang_id
JOIN san_pham sp ON ct.san_pham_id = sp.san_pham_id
GROUP BY dh.don_hang_id, dh.ngay_dat_hang;
