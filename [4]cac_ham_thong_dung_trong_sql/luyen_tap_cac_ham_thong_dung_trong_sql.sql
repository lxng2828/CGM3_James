SHOW DATABASES;

USE quan_ly_sinh_vien;

SELECT
    mon_hoc_id,
    ten_mon,
    so_tin_chi,
    trang_thai
FROM
    mon_hoc
WHERE
    so_tin_chi = (SELECT MAX(so_tin_chi) FROM mon_hoc);

SELECT
    mh.mon_hoc_id,
    mh.ten_mon,
    mh.so_tin_chi,
    mh.trang_thai
FROM
    mon_hoc AS mh
JOIN
    diem_thi AS dt ON mh.mon_hoc_id = dt.mon_hoc_id
WHERE
    dt.diem = (SELECT MAX(diem) FROM diem_thi);

SELECT
    sv.sinh_vien_id,
    sv.ho_ten,
    sv.dia_chi,
    sv.so_dien_thoai,
    sv.trang_thai,
    sv.lop_hoc_id,
    AVG(dt.diem) AS diem_trung_binh
FROM
    sinh_vien AS sv
LEFT JOIN
    diem_thi AS dt ON sv.sinh_vien_id = dt.sinh_vien_id
GROUP BY
    sv.sinh_vien_id, sv.ho_ten, sv.dia_chi, sv.so_dien_thoai, sv.trang_thai, sv.lop_hoc_id
ORDER BY
    diem_trung_binh DESC;