CREATE TABLE HocSinh(
  ID int PRIMARY KEY,
  HoTen varchar(100),
  NgaySinh varchar(100),
  GioiTinh varchar(100),
  LopHoc varchar(100)
);
CREATE TABLE MonHoc(
  ID int PRIMARY KEY,
  TenMon varchar(100)
);
CREATE TABLE Diem(
  HocSinhID int,
  MonHocID int,
  DiemSo int,
  NgayThi varchar(100),
  FOREIGN KEY (HocSinhID) REFERENCES HocSinh(ID),
  FOREIGN KEY (MonHocID) REFERENCES MonHoc(ID)
);
------------------------------------------------------

INSERT INTO HocSinh (ID, HoTen, NgaySinh, GioiTinh, LopHoc)
VALUES 
(1, 'Nguyen Van A', '2005-09-01', 'Nam', '10A1'),
(2, 'Tran Thi B', '2005-08-15', 'Nu', '10A1'),
(3, 'Le Van C', '2005-07-20', 'Nam', '10A2'),
(4, 'Pham Thi D', '2006-01-01', 'Nu', '10A2'),
(5, 'Hoang Van E', '2006-02-12', 'Nam', '10A3');

INSERT INTO MonHoc (ID, TenMon)
VALUES 
(1, 'Toan'),
(2, 'Ly'),
(3, 'Hoa'),
(4, 'Van'),
(5, 'Anh');

INSERT INTO Diem (HocSinhID, MonHocID, DiemSo, NgayThi)
VALUES 
(1, 1, 8.5, '2023-06-01'), 
(1, 2, 7.0, '2023-06-01'), 
(1, 3, 6.5, '2023-06-01'), 
(2, 1, 9.0, '2023-06-02'), 
(2, 2, 8.5, '2023-06-02'), 
(3, 1, 5.0, '2023-06-03'), 
(3, 3, 4.5, '2023-06-03'),
(4, 4, 7.5, '2023-06-04'),
(4, 5, 8.0, '2023-06-04'), 
(5, 1, 5.5, '2023-06-05'),
(5, 2, 6.0, '2023-06-05'); -- Hoang Van E, Ly

-------------------------- 1 -----------------------------
SELECT HS.HoTen, COUNT(DISTINCT D.MonHocID) AS SoMonHocDaHoc
FROM HocSinh HS
LEFT JOIN Diem D ON HS.ID = D.HocSinhID
GROUP BY HS.ID, HS.HoTen;

-------------------------- 2 ------------------
WITH AverageScores AS 
(
  SELECT 
        HS.ID,
        HS.HoTen,
        HS.LopHoc,
        AVG(D.DiemSo) AS DiemTrungBinh
  FROM HocSinh HS
  JOIN Diem D ON HS.ID = D.HocSinhID
  GROUP BY HS.ID, HS.HoTen, HS.LopHoc
),

MaxScoresPerClass AS 
(
  SELECT 
        LopHoc,
        MAX(DiemTrungBinh) AS MaxDiemTrungBinh
  FROM AverageScores
  GROUP BY LopHoc
)
SELECT 
    A.HoTen,
    A.LopHoc,
    A.DiemTrungBinh
FROM AverageScores A
JOIN MaxScoresPerClass M ON A.LopHoc = M.LopHoc AND A.DiemTrungBinh = M.MaxDiemTrungBinh;

----------------------- 3 ----------------------
WITH CountBelowFive AS 
(
  SELECT HS.ID, HS.HoTen, COUNT(*) AS SoMonDuoi5 FROM HocSinh HS
  JOIN Diem D ON HS.ID = D.HocSinhID
  WHERE D.DiemSo < 5
  GROUP BY HS.ID, HS.HoTen
)
SELECT C.HoTen, C.SoMonDuoi5 FROM CountBelowFive C
ORDER BY C.SoMonDuoi5 DESC
LIMIT 1;

----------------------- 5 ----------------------
WITH MaxScoresPerSubject AS (
  SELECT MonHocID, MAX(DiemSo) AS MaxDiem FROM Diem
  GROUP BY MonHocID
)
SELECT HS.HoTen, MH.TenMon, D.DiemSo 
FROM Diem D
JOIN HocSinh HS ON D.HocSinhID = HS.ID
JOIN MonHoc MH ON D.MonHocID = MH.ID
JOIN MaxScoresPerSubject MS ON D.MonHocID = MS.MonHocID AND D.DiemSo = MS.MaxDiem;

