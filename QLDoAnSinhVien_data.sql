USE [QLDoAnSinhVien]
GO
INSERT [dbo].[DeTai] ([MaDT], [TenDeTai], [MoTa], [LinhVuc]) VALUES (N'DT01', N'PT&TKHT', N'Đồ án môn học', N'Điện tử')
INSERT [dbo].[DeTai] ([MaDT], [TenDeTai], [MoTa], [LinhVuc]) VALUES (N'DT02', N'Hệ thống nhúng', N'Đồ án môn học', N'Điện tử')
GO
INSERT [dbo].[DoAn] ([MaDA], [MaDT], [NamHoc], [HocKy], [TinhTrang], [GhiChu]) VALUES (N'DA01', N'DT01', N'2025', 3, N'Đang thực hiện', NULL)
INSERT [dbo].[DoAn] ([MaDA], [MaDT], [NamHoc], [HocKy], [TinhTrang], [GhiChu]) VALUES (N'DA02', N'DT02', N'2023', 2, N'Đang thực hiện', NULL)
GO
