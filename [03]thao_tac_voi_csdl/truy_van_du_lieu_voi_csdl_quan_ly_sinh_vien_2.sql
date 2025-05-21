USE quan_ly_sinh_vien;

SELECT ho_ten, dia_chi, so_dien_thoai, trang_thai, lop_hoc_id
FROM sinh_vien
WHERE ho_ten LIKE 'H%';

SELECT lop_hoc_id, ten_lop, ngay_bat_dau, trang_thai
FROM lop_hoc
WHERE MONTH(ngay_bat_dau) = 12;

SELECT mon_hoc_id, ten_mon, so_tin_chi, trang_thai
FROM mon_hoc
WHERE so_tin_chi BETWEEN 3 AND 5;

UPDATE sinh_vien
SET lop_hoc_id = 2
WHERE ho_ten = 'Hung';

SELECT
    sinh_vien.ho_ten,
    mon_hoc.ten_mon,
    diem_thi.diem
FROM diem_thi
JOIN sinh_vien ON diem_thi.sinh_vien_id = sinh_vien.sinh_vien_id
JOIN mon_hoc ON diem_thi.mon_hoc_id = mon_hoc.mon_hoc_id
ORDER BY diem_thi.diem DESC, sinh_vien.ho_ten ASC;
