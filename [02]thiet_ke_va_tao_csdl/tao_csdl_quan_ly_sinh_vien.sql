CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE lop_hoc (
    lop_hoc_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_lop      VARCHAR(60) NOT NULL,
    ngay_bat_dau DATETIME    NOT NULL,
    trang_thai   BIT
);

CREATE TABLE sinh_vien (
    sinh_vien_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ho_ten         VARCHAR(30) NOT NULL,
    dia_chi        VARCHAR(50),
    so_dien_thoai  VARCHAR(20),
    trang_thai     BIT,
    lop_hoc_id     INT         NOT NULL,
    FOREIGN KEY (lop_hoc_id) REFERENCES lop_hoc (lop_hoc_id)
);

CREATE TABLE mon_hoc (
    mon_hoc_id INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ten_mon    VARCHAR(30) NOT NULL,
    so_tin_chi TINYINT     NOT NULL DEFAULT 1 CHECK (so_tin_chi >= 1),
    trang_thai BIT                  DEFAULT 1
);

CREATE TABLE diem_thi (
    diem_thi_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mon_hoc_id  INT NOT NULL,
    sinh_vien_id INT NOT NULL,
    diem        FLOAT   DEFAULT 0 CHECK (diem BETWEEN 0 AND 100),
    lan_thi     TINYINT DEFAULT 1,
    UNIQUE (mon_hoc_id, sinh_vien_id),
    FOREIGN KEY (mon_hoc_id) REFERENCES mon_hoc (mon_hoc_id),
    FOREIGN KEY (sinh_vien_id) REFERENCES sinh_vien (sinh_vien_id)
);
