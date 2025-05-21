USE quan_ly_sinh_vien;

SELECT ho_ten, dia_chi, so_dien_thoai
FROM sinh_vien;

SELECT ho_ten, dia_chi, so_dien_thoai
FROM sinh_vien
WHERE trang_thai = 1;

SELECT ten_mon, so_tin_chi
FROM mon_hoc
WHERE so_tin_chi < 10;

SELECT sinh_vien.ho_ten, sinh_vien.dia_chi, sinh_vien.so_dien_thoai
FROM sinh_vien
JOIN lop_hoc ON sinh_vien.lop_hoc_id = lop_hoc.lop_hoc_id
WHERE lop_hoc.ten_lop = 'A1';

SELECT sinh_vien.ho_ten, mon_hoc.ten_mon, diem_thi.diem, diem_thi.lan_thi
FROM diem_thi
JOIN sinh_vien ON diem_thi.sinh_vien_id = sinh_vien.sinh_vien_id
JOIN mon_hoc ON diem_thi.mon_hoc_id = mon_hoc.mon_hoc_id
WHERE mon_hoc.ten_mon = 'CF';