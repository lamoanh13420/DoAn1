Exec msdb.dbo.sp_delete_database_backuphistory @database_name = N'DuLich'
go
use [master]
go
Alter Database Dulich set Single_User with Rollback Immediate
go
drop database DuLich
go
create database Dulich
use DuLich
go
create table Admin(
	TaiKhoan nvarchar(50) primary key,
	Password nvarchar(50),
	Email nvarchar(50),
	SDT nvarchar(10),
)
insert into Admin values ('Admin','123456','trangianhi1332000@gmail.com','0794166910')


create table TinTuc(
	ID_TT int primary key identity,
	TenTT nvarchar(1000),
	ImageTT nvarchar(50),
	NoiDungTT nvarchar(Max),
	NgayNhapTT datetime
)

insert into TinTuc values (N'Du lịch Việt Nam' , '1.jpg' , N' Trên hành trình thay đổi về cả lượng và chất để thấy đạt được vị thế như ngày hôm nay, du lịch Việt Nam đã trải qua những bước thăng trầm không hề đơn giản .Vào năm 1990, Việt Nam chỉ đón được 250 nghìn lượt khách quốc tế','2021-6-1')
insert into TinTuc values (N'Tổ chức “Ngày hội gia đình” tại Làng Văn hóa - Du lịch các dân tộc Việt Nam' , '2.jpg' , N'Trong trường hợp dịch bệnh được kiểm soát, nhiều chương trình giao lưu văn hóa, văn nghệ đặc sắc và các hoạt động tập thể như trò chơi dân gian, giáo dục, tham quan trải nghiệm sẽ được tổ chức tại Làng Văn hóa - Du lịch các dân tộc Việt Nam. Cụ thể, với chủ đề “Truyền thống văn hóa gia đình trong cộng đồng các dân tộc”, chương trình “Trò chơi dân gian - Tuổi thơ tôi” sẽ là dịp để các em nhỏ vui đùa, trải nghiệm các trò chơi như làm con trâu bằng lá mít, chơi đá cỏ gà, kéo co, tu lu, đánh yến, tó má lẹ… và tham gia các hoạt động giáo dục về môi trường sinh thái, văn hóa dân tộc.' , GETDATE())

select*from TinTuc

create table LoaiTour(
	ID_LoaiTour int primary key identity,
	TenLoaiTour nvarchar(50)
)
insert into LoaiTour values (N'Tour Miền Bắc')
insert into LoaiTour values (N'Tour Miền Trung')
insert into LoaiTour values (N'Tour Miền Nam')


create table Tour(
	ID_Tour int primary key identity,
	TenTour nvarchar(50),
	HinhAnh nvarchar(50),
	MoTa nvarchar(Max),
	KhachSan nvarchar(50),
	PhuongTien nvarchar(50),
	Gia decimal(18,2),
	NgayKhoiHanh date,
	NgayKetThuc date,
	NgayTapTrung date,
	DiaChiTapTrung nvarchar(100),
	ID_LoaiTour int references LoaiTour(ID_LoaiTour)
)
create table LichTrinh(
	ID_LichTrinh int primary key identity,
	ID_Tour int references Tour(ID_Tour),
	Ngay nvarchar(10),
	TenLT nvarchar(50),
	HinhAnhLT nvarchar(50),
	Mota nvarchar(max)	
)
create table PhaiHoi(
	ID_PH int primary key identity,
	ID_Tour int references Tour(ID_Tour),
	TenNguoiGui nvarchar(50),
	Email nvarchar(50),
	TieudePH nvarchar(50),
	NoidungPH nvarchar(Max),
	NgayGui datetime
)

create table KhachHang(
	ID_KH int primary key identity,
	HoTenKH nvarchar(50),
	SDT nvarchar(10),
	Email nvarchar(50),
	NgaySinh date,
	GioiTinh nvarchar(5),
	DiaChi nvarchar(100),
	Password nchar(20)
	)
insert into KhachHang values (N'Trần Thị Loan','0794166819','Loan123@gmail.com','1999-2-2',N'Nữ',N'52/16 Trương Định Q3 TP.HCM','123456')
insert into KhachHang values (N'Lý Nghiêm Thu','074598019','Thu123@gmail.com','2000-12-9',N'Nữ',N'520 Điện Biên Phủ Q3 TP.HCM','123456')
insert into KhachHang values (N'Nguyên Thu Thủy','0794175301','Thuy123@gmail.com','1998-05-06',N'Nam',N'317 Sư Vạn Hạnh Q10 TP.HCM','123456')

create table DonHang(
	ID_DonHang int primary key identity,
	TinhTrang int,
	NgayDat datetime,
	ID_KH int references KhachHang(ID_KH)
)

create table chitietDH(
	ID_DonHang int references DonHang(ID_DonHang),
	ID_Tour int references Tour(ID_Tour),
	Soluong int,
	DonGia decimal(18,2)
)


