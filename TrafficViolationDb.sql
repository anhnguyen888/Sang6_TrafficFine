﻿CREATE DATABASE TrafficViolationDB;
GO

USE TrafficViolationDB;
GO

-- Bảng Phương tiện
CREATE TABLE Vehicles (
    VehicleID INT IDENTITY(1,1) PRIMARY KEY,
    LicensePlate NVARCHAR(20) NOT NULL UNIQUE, -- Biển số xe
    OwnerName NVARCHAR(100) NOT NULL,         -- Tên chủ phương tiện
    VehicleType NVARCHAR(50) NOT NULL,        -- Loại phương tiện (Xe máy, Ô tô,...)
    RegistrationDate DATE NOT NULL            -- Ngày đăng ký
);
GO

-- Bảng Lỗi vi phạm
CREATE TABLE Violations (
    ViolationID INT IDENTITY(1,1) PRIMARY KEY,
    VehicleID INT NOT NULL,                   -- Liên kết với phương tiện
    ViolationDate DATETIME NOT NULL,          -- Ngày vi phạm
    Location NVARCHAR(200) NOT NULL,          -- Địa điểm vi phạm
    ViolationType NVARCHAR(255) NOT NULL,     -- Loại lỗi vi phạm (VD: Vượt đèn đỏ, chạy quá tốc độ...)
    FineAmount DECIMAL(10,2) NOT NULL,        -- Mức phạt
    IsPaid BIT DEFAULT 0,                     -- Trạng thái thanh toán (0: Chưa đóng, 1: Đã đóng)
    CONSTRAINT FK_Vehicle_Violation FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID) ON DELETE CASCADE
);
GO
