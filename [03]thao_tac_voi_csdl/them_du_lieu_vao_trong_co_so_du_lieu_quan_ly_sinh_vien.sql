USE quan_ly_sinh_vien;

INSERT INTO lop_hoc (lop_hoc_id, ten_lop, ngay_bat_dau, trang_thai) VALUES
(1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', CURRENT_DATE, 0);

INSERT INTO sinh_vien (ho_ten, dia_chi, so_dien_thoai, trang_thai, lop_hoc_id) VALUES
('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong', NULL, 1, 1),
('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO mon_hoc (mon_hoc_id, ten_mon, so_tin_chi, trang_thai) VALUES
(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);

INSERT INTO diem_thi (mon_hoc_id, sinh_vien_id, diem, lan_thi) VALUES
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);