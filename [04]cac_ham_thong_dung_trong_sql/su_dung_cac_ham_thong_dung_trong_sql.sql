SHOW DATABASES;

USE quan_ly_sinh_vien;

SELECT
    dia_chi,
    COUNT(sinh_vien_id) AS so_luong_sinh_vien
FROM
    sinh_vien
GROUP BY
    dia_chi;

SELECT
    sv.sinh_vien_id,
    sv.ho_ten,
    AVG(dt.diem) AS diem_trung_binh
FROM
    sinh_vien AS sv
LEFT JOIN
    diem_thi AS dt ON sv.sinh_vien_id = dt.sinh_vien_id
GROUP BY
    sv.sinh_vien_id, sv.ho_ten;

SELECT
    sv.sinh_vien_id,
    sv.ho_ten,
    AVG(dt.diem) AS diem_trung_binh
FROM
    sinh_vien AS sv
LEFT JOIN
    diem_thi AS dt ON sv.sinh_vien_id = dt.sinh_vien_id
GROUP BY
    sv.sinh_vien_id, sv.ho_ten
ORDER BY
    diem_trung_binh DESC
LIMIT 1;