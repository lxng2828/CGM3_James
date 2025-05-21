CREATE DATABASE quan_ly_ban_hang;

USE quan_ly_ban_hang;

CREATE TABLE khach_hang (
    khach_hang_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ten_khach_hang VARCHAR(100) NOT NULL,
    tuoi_khach_hang TINYINT UNSIGNED CHECK (tuoi_khach_hang >= 0 AND tuoi_khach_hang <= 120)
);

CREATE TABLE san_pham (
    san_pham_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ten_san_pham VARCHAR(150) NOT NULL UNIQUE,
    gia_san_pham DECIMAL(12, 2) NOT NULL CHECK (gia_san_pham > 0)
);

CREATE TABLE don_hang (
    don_hang_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    khach_hang_id INT UNSIGNED,
    ngay_dat_hang DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tong_tien DECIMAL(14, 2) CHECK (tong_tien >= 0),
    FOREIGN KEY (khach_hang_id) REFERENCES khach_hang(khach_hang_id)
);

CREATE TABLE chi_tiet_don_hang (
    don_hang_id INT UNSIGNED,
    san_pham_id INT UNSIGNED,
    so_luong SMALLINT UNSIGNED NOT NULL CHECK (so_luong > 0),
    PRIMARY KEY (don_hang_id, san_pham_id),
    FOREIGN KEY (don_hang_id) REFERENCES don_hang(don_hang_id),
    FOREIGN KEY (san_pham_id) REFERENCES san_pham(san_pham_id)
);
