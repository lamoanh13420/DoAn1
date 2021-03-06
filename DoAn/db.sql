USE [master]
GO
/****** Object:  Database [Dulich]    Script Date: 06/02/2021 11:17:38 ******/
CREATE DATABASE [Dulich] ON  PRIMARY 
( NAME = N'Dulich', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Dulich.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Dulich_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Dulich_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Dulich] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dulich].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dulich] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Dulich] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Dulich] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Dulich] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Dulich] SET ARITHABORT OFF
GO
ALTER DATABASE [Dulich] SET AUTO_CLOSE ON
GO
ALTER DATABASE [Dulich] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Dulich] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Dulich] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Dulich] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Dulich] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Dulich] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Dulich] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Dulich] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Dulich] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Dulich] SET  ENABLE_BROKER
GO
ALTER DATABASE [Dulich] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Dulich] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Dulich] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Dulich] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Dulich] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Dulich] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Dulich] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Dulich] SET  READ_WRITE
GO
ALTER DATABASE [Dulich] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Dulich] SET  MULTI_USER
GO
ALTER DATABASE [Dulich] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Dulich] SET DB_CHAINING OFF
GO
USE [Dulich]
GO
/****** Object:  Table [dbo].[LoaiTour]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTour](
	[ID_LoaiTour] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTour] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_LoaiTour] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoaiTour] ON
INSERT [dbo].[LoaiTour] ([ID_LoaiTour], [TenLoaiTour]) VALUES (1, N'Tour Miền Bắc')
INSERT [dbo].[LoaiTour] ([ID_LoaiTour], [TenLoaiTour]) VALUES (2, N'Tour Miền Trung')
INSERT [dbo].[LoaiTour] ([ID_LoaiTour], [TenLoaiTour]) VALUES (3, N'Tour Miền Nam')
SET IDENTITY_INSERT [dbo].[LoaiTour] OFF
/****** Object:  Table [dbo].[TinTuc]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[ID_TT] [int] IDENTITY(1,1) NOT NULL,
	[TenTT] [nvarchar](1000) NULL,
	[ImageTT] [nvarchar](50) NULL,
	[NoiDungTT] [nvarchar](max) NULL,
	[NgayNhapTT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (1, N'Du lịch Việt Nam', N'~/Images/HCM.jpg', N' Trên hành trình thay đổi về cả lượng và chất để thấy đạt được vị thế như ngày hôm nay, du lịch Việt Nam đã trải qua những bước thăng trầm không hề đơn giản .Vào năm 1990, Việt Nam chỉ đón được 250 nghìn lượt khách quốc tế', CAST(0x0000AD3B001C12C3 AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (2, N'Tổ chức “Ngày hội gia đình” tại Làng Văn hóa - Du lịch các dân tộc Việt Nam', N'~/Images/hue2.jpg', N'Trong trường hợp dịch bệnh được kiểm soát, nhiều chương trình giao lưu văn hóa, văn nghệ đặc sắc và các hoạt động tập thể như trò chơi dân gian, giáo dục, tham quan trải nghiệm sẽ được tổ chức tại Làng Văn hóa - Du lịch các dân tộc Việt Nam. Cụ thể, với chủ đề “Truyền thống văn hóa gia đình trong cộng đồng các dân tộc”, chương trình “Trò chơi dân gian - Tuổi thơ tôi” sẽ là dịp để các em nhỏ vui đùa, trải nghiệm các trò chơi như làm con trâu bằng lá mít, chơi đá cỏ gà, kéo co, tu lu, đánh yến, tó má lẹ… và tham gia các hoạt động giáo dục về môi trường sinh thái, văn hóa dân tộc.', CAST(0x0000AD3B001C1D37 AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (3, N'Thận trọng với các quảng cáo ''''tour du lịch tiêm phòng vắc xin Covid-19''''', N'~/Images/Tour_vaccine.jpeg', N'Cụ thể, Người phát ngôn Bộ Ngoại giao cho biết: “Trong thời điểm hiện nay, các công dân cần hết sức thận trọng và tính toán kỹ khi tiến hành các chuyến đi ở nước ngoài, do chính sách xuất nhập cảnh ở nhiều nước trên thế giới còn đang bị thắt chặt do tình hình dịch bệnh diễn biến vô cùng phức tạp. Nếu có những thông tin hay quảng cáo như vậy, công dân cần kiểm tra với các cơ quan chức năng của các nước, có thể thông qua cơ quan đại diện ngoại giao của các nước tại Việt Nam”.  Cũng trong khuôn khổ họp báo, trả lời các câu hỏi của phóng viên CNA (Đài Loan, Trung Quốc), Sputnik (Nga) về chính sách phòng dịch mà Việt Nam triển khai đối với người nước ngoài, Người phát ngôn Bộ Ngoại giao nêu rõ:  “Trong bối cảnh dịch bệnh diễn biến hết sức phức tạp trên thế giới và ngay cả tại Việt Nam, các chính sách, biện pháp theo dõi, cách ly y tế cho người nhập cảnh Việt Nam luôn được Chính phủ Việt Nam điều chỉnh một cách linh hoạt để bảo đảm ngăn chặn sự bùng phát, lây lan của dịch bệnh, hướng tới mục tiêu bảo vệ sức khỏe cộng đồng, đồng thời, phục vụ mục tiêu phục hồi sản xuất, kinh doanh và phát triển kinh tế.  Thực hiện chỉ đạo của Ban Chỉ đạo quốc gia về phòng, chống dịch Covid-19, Bộ Ngoại giao đang phối hợp với một số cơ quan liên quan, trong đó có Bộ Y tế, để nghiên cứu xây dựng hướng dẫn về cách ly y tế phòng, chống dịch Covid-19 đối với người nhập cảnh. Trong đó, có cân nhắc đến các yếu tố như tiêm chủng, thời gian lưu trú tại Việt Nam, mục đích nhập cảnh, diễn biến dịch bệnh trong nước và quốc tế để có thể áp dụng các biện pháp và chế độ cách ly phù hợp nhất”.    Về tiêm phòng vắc xin cho người nước ngoài tại Việt Nam, Người phát ngôn Bộ Ngoại giao cũng cho biết: “Theo Nghị quyết 21/NQ-CP về mua và sử dụng vắc xin phòng Covid-19 ngày 26-2-2021 đã xác định 9 nhóm ưu tiên được tiêm, trong đó chú trọng ưu tiên những đối tượng trong tuyến đầu phòng, chống dịch bệnh và một số đối tượng khác, như người cao tuổi... Việt Nam rất quan tâm đến cộng đồng người nước ngoài sinh sống và làm việc tại Việt Nam. Cho đến nay, Việt Nam đã đàm phán thành công với một số đối tác như AstraZeneca, Pfizer, BioNTech để cung cấp vắc xin cho Việt Nam. Hiện nay, Việt Nam cũng tiếp tục nỗ lực trao đổi với các quốc gia và các đối tác khác để đa dạng hóa nguồn cung vắc xin, để có thể sớm mở rộng tiến tới bao phủ tối đa các đối tượng được tiêm vắc xin”.  Trả lời câu hỏi của phóng viên AFP về khả năng triển khai “hộ chiếu vắc xin” của Việt Nam, Người phát ngôn Bộ Ngoại giao khẳng định: “Hiện nay, Việt Nam chưa có quy định riêng đối với việc nhập cảnh của những người đã tiêm phòng vắc xin ngừa Covid-19. Trong bối cảnh hộ chiếu vắc xin đã bắt đầu được một số nước trên thế giới áp dụng, vừa qua, thực hiện chỉ đạo của Thủ tướng Chính phủ, các cơ quan chức năng của Việt Nam đang phối hợp, nghiên cứu, đánh giá và đề xuất các biện pháp xử lý phù hợp đối với vấn đề này. Bộ Ngoại giao cũng đang phối hợp với các cơ quan chức năng để tìm hiểu, tổng hợp kinh nghiệm thực tiễn của các nước nhằm nghiên cứu, đề xuất chính sách xuất nhập cảnh cũng như mở cửa phù hợp với việc thực hiện mục tiêu kép, bảo đảm an toàn sức khỏe cho người dân, chống dịch hiệu quả cũng như thúc đẩy phát triển kinh tế - xã hội”...', CAST(0x0000AD3B0007A61B AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (4, N'Phú Yên: Thác H’Ly với phát triển du lịch', N'~/Images/ThacUyen.png', N'Không chỉ là cảnh quan thiên nhiên hùng vĩ, thác H’Ly còn là tài nguyên quý để phát triển du lịch ở địa phương.  Vẻ đẹp hoang sơ, hùng vĩ  Thắng cảnh thác H’Ly nằm cạnh quốc lộ 19C, thuộc địa bàn xã Sông Hinh, cách trung tâm thị trấn Hai Riêng khoảng 21km. Khu vực thác ở giữa một vùng núi non hùng vĩ, nổi bật với phong cảnh thiên nhiên tươi đẹp. Thác H’Ly được hình thành do đặc điểm địa hình, khu vực xung quanh thác có nhiều dòng suối lớn bắt nguồn từ các ngọn núi cao, những con suối này phần lớn chảy theo hướng Nam - Bắc rồi nhập vào nguồn sông Hinh, trên những dòng suối có nhiều thác nước lớn, trong đó có thác H’Ly.  Thực tế, các nhà nghiên cứu đánh giá, thác H’Ly được hình thành từ 2 yếu tố cơ bản. Thứ nhất là từ độ dốc của địa hình khu vực; thứ hai là do quá trình đứt gãy, sụt lún do vận động, dịch chuyển về mặt địa chất. Quan sát khu vực thác H’Ly, ta có thể nhận thấy một số tảng đá bazan cột nằm ở phía dưới thác. Qua đó có thể phỏng đoán khu vực này đã bị tác động bởi các đợt phun trào núi lửa trong các thời kỳ khác nhau.  Ông Lê Trọng Chung, Chủ tịch UBND xã Sông Hinh, cho biết: “Toàn bộ khu vực thác H’Ly có tổng diện tích trên 10ha, có thể phân thành 3 khu vực chính. Trong đó, khu vực nằm trên thác có diện tích khoảng 1ha, gồm nhiều phiến đá bằng phẳng đã được dòng chảy mài mòn qua thời gian, trải rộng hết cả khu vực lòng suối.  Khu vực chính của thác có chiều cao khoảng 10m, chiều dài khoảng 80m. Phần phía trên thác tương đối bằng phẳng nên khi vào mùa mưa, lượng nước chảy trên suối lớn từ độ cao cả chục mét, tung bọt trắng xóa tạo cảnh quan vô cùng ấn tượng”.  Có thể nói H’Ly là thác nước có cảnh quan thiên nhiên độc đáo còn rất ít ở Phú Yên. Phía dưới chân thác do quá trình tác động của dòng nước từ trên cao qua nhiều năm làm cho chân thác bị khoét sâu vào phía trong kiểu hàm ếch. Chân thác cũng có nhiều tảng đá lớn nằm chồng lên nhau, những tảng đá này có thể bị tách rời do hoạt động của vỏ trái đất hoặc do tác động cơ học và cũng có thể do tác động dòng chảy của thác.  Đáng chú ý là ở chân thác phía tây có nhiều tảng đá bazan được hình thành do quá trình phun trào núi lửa nên có cấu tạo tương đối đặc thù với các đường nứt giống kiểu bazan dạng cột và hình tổ ong. Khu vực phía dưới thác, dòng nước sau khi đổ chảy từ độ cao 10m đã tạo thành thác H’Ly, rồi bắt đầu chảy vào một đoạn suối bằng phẳng và tiếp tục chảy về phía bắc để đổ vào lòng hồ thủy điện Sông Hinh.  Ngoài ra, thác H’Ly hình thành còn gắn liền với câu chuyện tình đẹp giữa chàng trai và cô con gái cưng của hai vị tù trưởng bộ tộc ở vùng Sông Hinh và vùng M’Đrăk. Ông Kso Y Rơi ở thôn Hà Roi (xã Sông Hinh) kể lại: Chàng trai và cô gái thường hò hẹn nhau ngay trên bờ sông Hinh, nơi có cánh rừng đại ngàn, có con sông nước trong xanh với làn hương của muôn loài hoa tỏa bay thơm ngát. Họ thề ước cùng nhau sống trọn kiếp người trong hạnh phúc lứa đôi và không quên làm cầu nối để xóa tan đi những hận thù của hai vị tù trưởng là cha của chàng và nàng, mang lại cuộc sống ấm no cho hai bộ tộc.  Tuy nhiên, những tâm nguyện tốt đẹp của hai người đã trở thành tro than khi hai bên sử dụng vũ lực để giải quyết những bất hòa. Trong cuộc chiến, chàng trai đã tử trận. Và cô gái bỏ nhà tới nơi dòng sông ngồi than khóc cho số phận. Nước mắt nàng biến thành con suối, thành dòng sông và cuộn trào tuôn đi, xói bờ đá cứng thành thác sâu, nước đổ réo rắt như oán như than, sụt sùi tung bọt trắng ngầu cả một quãng sông dài... Các đời sau này nhớ lại mối tình bi thảm đó, bèn lấy tên nàng đặt tên cho thác là thác H’Ly.  “Bao bọc lấy sự hùng vĩ của thác H’Ly là nét dịu dàng và thơ mộng của thiên nhiên. Xung quanh thác H’Ly có nhiều những cây cổ thụ cao và xum xuê cành lá. Nếu đi vào đúng dịp, điểm tô cho sắc màu xanh đại ngàn, là sắc đỏ cam rực rỡ của chùm hoa phong lan rừng nằm bên bờ thác”, chị Lê Thị Ngọc Điểm, một du khách đến từ TX Đông Hòa cảm nhận.  Gắn với phát triển du lịch  Theo ông Đinh Ngọc Dạn, Chủ tịch UBND huyện Sông Hinh, thác H’Ly không chỉ là cảnh quan thiên nhiên hùng vĩ mà còn nằm trong khu vực sinh sống từ lâu đời của đồng bào các dân tộc thiểu số có đời sống văn hóa, tinh thần phong phú, đa dạng, thuận lợi cho việc bảo tồn và phát huy giá trị di tích thắng cảnh gắn với phát triển du lịch.', CAST(0x0000AD3B0018E06C AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (5, N'Nét đẹp đình làng Bến Tre trong du lịch', N'~/Images/1.6.1_đình_lang_Bến_Tre.jpg', N'Từ bao đời nay, “cây đa, bến nước, sân đình" là hình ảnh thân quen, gắn bó với đời sống của cộng đồng cư dân người Việt qua bao thế hệ, không chỉ có giá trị về mặt lịch sử, kiến trúc mà còn là kho tàng chứa đựng văn hóa, giá trị nhân văn mang sức sống mãnh liệt của địa phương. Đình làng ở Nam Bộ nói chung và đình làng ở Bến Tre nói riêng được hình thành lâu đời, trải qua nhiều giai đoạn vẫn giữ nguyên giá trị và được đưa vào hoạt động du lịch như một nét đặc trưng về văn hóa bản địa giới thiệu đến du khách gần xa. Từ bao đời nay, “cây đa, bến nước, sân đình" là hình ảnh thân quen, gắn bó với đời sống của cộng đồng cư dân người Việt qua bao thế hệ, không chỉ có giá trị về mặt lịch sử, kiến trúc mà còn là kho tàng chứa đựng văn hóa, giá trị nhân văn mang sức sống mãnh liệt của địa phương. Đình làng ở Nam Bộ nói chung và đình làng ở Bến Tre nói riêng được hình thành lâu đời, trải qua nhiều giai đoạn vẫn giữ nguyên giá trị và được đưa vào hoạt động du lịch như một nét đặc trưng về văn hóa bản địa giới thiệu đến du khách gần xa.  Qua rồi thời “dưới sông sấu lội, trên rừng cọp um", Bến Tre từng là vùng đất “mở" đón nhiều thế hệ cư dân đến sinh sống, làng quê đã hình thành nên phố thị nhưng dấu ấn của thời khai khẩn vẫn còn đó và thể hiện rõ nhất qua đình làng. Đây là công trình kiến trúc nghệ thuật của cộng đồng dân cư, là nơi họp bàn để giải quyết các vấn đề nội bộ trong làng, diễn ra hội hè, sinh hoạt văn hóa – văn nghệ; nơi tiến hành các lễ nghi, thờ phụng Thành Hoàng, các vị Nhân thần, danh nhân lịch sử, “Tiền hiền khai khẩn, hậu hiền khai cơ", đa số sắc thần thờ trong đình đều được vua đóng ấn phong thần… Chính vì thế, đình làng mang tính cộng đồng và không thể thiếu trong đời sống tín ngưỡng của cư dân. Như nhà văn Sơn Nam đã từng nói “Có đình thì mới tạo được thế đứng, gắn bó vào cộng đồng dân tộc và càn khôn vũ trụ". Do đó, đình là một trong những sản phẩm du lịch tâm linh, văn hóa hấp dẫn, thể hiện nét đặt trưng của địa phương gắn với những câu chuyện hấp dẫn khi du khách có dịp đặt chân đến đây.  Hiện tại, toàn tỉnh Bến Tre có khoảng 207 đình thần, trong đó có 6 ngôi đình được công nhận là di tích cấp quốc gia gồm: Đình Bình Hòa (Giồng Trôm), Đình Tiên Thủy, Đình Tân Thạch (Châu Thành), Đình Phú Lễ (Ba Tri), Đình Long Phụng, Đình Long Thạnh (Bình Đại). Về kiến trúc, Đình ở Bến Tre đa số mang kiến trúc cổ truyền Nam Bộ, dựng theo hình chữ Nhất với cột kèo, đòn tay, mè rui bằng gỗ, mái lợp ngói âm dương, bên trên mái đình trang trí lưỡng long tranh trân châu, ngư hóa long vô cùng đẹp mắt và cổ kính. Các hoành phi, bao lam, câu đối bằng chữ Hán của Đình rất có giá trị về mặt lịch sử, văn hóa. ', CAST(0x0000AD3B00270166 AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (6, N'Tổ chức Cuộc thi và triển lãm ảnh Di sản văn hóa toàn quốc - lần thứ Nhất', N'~/Images/TCCTDSTQL1.jpg', N'Theo đó, Bộ VHTTDL giao Cục Di sản Văn hóa chủ trì, phối hợp với Cục Mỹ thuật, Nhiếp ảnh và Triển lãm, Báo Văn hóa, Báo Điện tử Tổ quốc, Hội Nghệ sỹ Nhiếp ảnh Việt Nam, Hội Di sản Văn hóa Việt Nam tổ chức Cuộc thi và triển lãm ảnh Di sản văn hóa toàn quốc - lần thứ Nhất.  Với chủ đề "Di sản văn hóa vật thể tại Việt Nam", cuộc thi và triển lãm ảnh Di sản văn hóa toàn quốc - lần thứ Nhất là hoạt động hướng tới Ngày Di sản văn hóa Việt Nam (23/11), nhằm tìm kiếm các tác phẩm nhiếp ảnh có giá trị, tiêu biểu về các loại hình di sản văn hóa vật thể tại Việt Nam (di tích lịch sử - văn hoá, kiến trúc - nghệ thuật và danh lam thắng cảnh). Đồng thời, thông qua hoạt động này còn góp phần khơi dậy niềm tự hào, tình yêu quê hương, đất nước, góp phần bảo vệ và phát huy giá trị di sản văn hóa tại Việt Nam đến công chúng trong và ngoài nước.  Các tác phẩm tiêu biểu sẽ được lựa chọn cho cuộc triển lãm và sách ảnh với chủ đề "Di sản văn hóa vật thể tại Việt Nam", đăng tải trên phương tiện truyền thông và các tài liệu tuyên truyền về hoạt động bảo vệ, phát huy giá trị di sản văn hóa. Kết quả cuộc thi sẽ góp phần quảng bá giá trị văn hóa, khoa học, lịch sử và thẩm mỹ của di sản văn hóa nói chung, di sản văn hóa vật thể nói riêng tới người dân Việt Nam và bạn bè quốc tế.  Lễ phát động Cuộc thi và triển lãm ảnh Di sản văn hóa toàn quốc - lần thứ Nhất dự kiến sẽ diễn ra vào cuối tháng 5/2021. Lễ trao giải và triển lãm ảnh dự kiến được tổ chức vào tháng 11/2021 tại thành phố Hà Nội.', CAST(0x0000AD3B002C16C2 AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (7, N'Cà Mau: Đặc sản U Minh vào top 100 món ăn đặc sản Việt Nam', N'~/Images/CAMAU.jpg', N'Ngày 30-4, Hội Kỷ lục gia Việt Nam, Tổ chức Kỷ lục Việt Nam về xác lập 100 món ăn đặc sắc Việt Nam và 100 đặc sản quà tặng Việt Nam năm 2020-2021 đã trao bằng công nhận đối với món ăn lẩu mắm U Minh và quà tặng mật ong rừng U Minh.Dịp này, Sở VHTTDL tỉnh Cà Mau phối hợp với UBND huyện U Minh tổ chức Hội thi ẩm thực với chủ để "mắm". Đây là một trong những nội dung hoạt động của sự kiện “Hương rừng U Minh” trong chương trình "Cà Mau - Điểm đến năm 2021".Theo Ban tổ chức, hội thi nhằm khuyến khích sự sáng tạo của những người đam mê nấu ăn, đặc biệt là món lẩu mắm; giúp mọi người có dịp giao lưu, học hỏi và khuyến khích sự sáng tạo trong việc tạo ra các món ăn từ mắm. Qua đó, quảng bá món ăn này đến với du khách gần xa; góp phần bảo tồn và phát huy giá trị văn hoá ẩm thực của người dân xứ U Minh.  Ông Lê Hữu Lơi, Trưởng Phòng Văn hóa - Thông tin huyện U Minh cho biết, Ban tổ chức rất kỳ vọng chương trình "Hương rừng U Minh" sẽ là cơ hội để du khách có những trải nghiệm đầy đủ nhất về văn hóa của người và đất U Minh (Cà Mau). Vì vậy, huyện U Minh đã tập trung nâng cao chất lượng dịch vụ, các sản phẩm du lịch. Đặc biệt, đảm bảo an toàn cho du khách đến đây tham quan, trải nghiệm...', CAST(0x0000AD3B002C90CC AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (8, N'TP Hồ Chí Minh: Dừng bắn pháo hoa, bắt buộc đeo khẩu trang tại nơi tập trung đông người', N'~/Images/27.4.TP_Ho_Chi_Minh-Dung_ban_phao_hoa.jpg', N'Trưa ngày 26/4, Ban chỉ đạo phòng chống dịch bệnh COVID-19 TP Hồ Chí Minh đã tổ chức họp khẩn với các Sở, ngành và quận, huyện về công tác phòng chống dịch COVID-19.   Tại cuộc họp, ông Nguyễn Thành Phong đã chỉ đạo các đơn vị dừng việc tổ chức bắn pháo hoa trong dịp lễ 30/4 và 1/5 trên địa bàn để đảm bảo công tác phòng chống dịch bệnh COVID-19. "Hiện nay, virus SAR-CoV-2 biến thể đang phát triển rất nhanh. Phản ánh của báo chí cho thấy, tại Ấn Độ, tình hình dịch bệnh rất nặng nề. Vì vậy, TP Hồ Chí Minh cần nêu cao tinh thần cảnh giác trong công tác phòng chống dịch bệnh, đặc biệt trong dịp lễ 30/4 và 1/5 tới", ông Nguyễn Thành Phong nói.  Theo ông Nguyễn Thành Phong, dù TP Hồ Chí Minh không có ca nhiễm COVID-19 mới trong cộng đồng, nhưng nguy cơ vẫn luôn thường trực. "Muốn giữ vững thành quả chống dịch, ngoài những chỉ đạo trong công điện khẩn của Thủ tướng và Phó Thủ tướng Phạm Bình Minh; các đơn vị, UBND quận, huyện, thành phố Thủ Đức và người dân cần thực hiện nghiêm thông điệp 5K của Bộ Y tế. Trong đó, bắt buộc đeo khẩu trang tại các khu vực tập trung đông người, khu vui chơi giải trí; tiếp tục xử lý nghiêm các trường hợp không đeo khẩu trang; các phòng họp, khu vui chơi, giải trí đông người phải bố trí dung dịch rửa tay sát khuẩn… Ngoài ra, TP Hồ Chí Minh sẽ xử lý nghiêm các trường hợp nhập cảnh trái phép, tiếp tay cho nhập cảnh trái phép, hoặc không thực hiện khai báo”, ông Nguyễn Thành Phong đề nghị.', CAST(0x0000AD3B002CDEF1 AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (9, N'Thứ trưởng Đoàn Văn Việt: Chương trình “Qua những miền di sản Việt Bắc” cần được mở rộng, lan tỏa để thu hút ngày càng nhiều khách du lịch', N'~/Images/KhaimacVietBac1.jpg', N'Hưởng ứng Năm du lịch Quốc gia 2021, Hoa Lư - Ninh Bình, Chương trình du lịch “Qua những miền di sản Việt Bắc” lần thứ XII - Thái Nguyên năm 2021 diễn ra từ ngày 20 đến 23/4 với nhiều hoạt động sôi nổi như: Khảo sát các tuyến, điểm du lịch văn hóa - lịch sử, sinh thái - nghỉ dưỡng trên địa bàn tỉnh Thái Nguyên; Tọa đàm “Hợp tác phát triển du lịch 6 tỉnh Việt Bắc”; Triển lãm ảnh giới thiệu, quảng bá du lịch 6 tỉnh Việt Bắc; Chương trình biểu diễn nghệ thuật chuyên nghiệp; Trình diễn trang phục dân tộc vùng Việt Bắc... Các hoạt động này đã đem đến cho du khách những trải nghiệm thú vị về sắc màu văn hóa Việt Bắc.Phát biểu tại Lễ khai mạc, ông Dương Văn Lượng, Phó Chủ tịch UBND tỉnh Thái Nguyên, Trưởng ban tổ chức chương trình nhấn mạnh: Chương trình được tổ chức thường niên và luân phiên là cơ hội cho các tỉnh và doanh nghiệp giới thiệu, quảng bá tiềm năng, thế mạnh của những sản phẩm du lịch tới nhân dân, du khách trong và ngoài nước. Chương trình cũng góp phần xây dựng và định vị thương hiệu du lịch vùng Việt Bắc, đẩy mạnh liên kết hợp tác phát triển du lịch, thu hút đầu tư và xây dựng các sản phẩm du lịch đặc sắc có tính liên vùng cao. Từ đó góp phần đưa du lịch các tỉnh trong vùng phát triển nhanh trong những năm tới, tạo động lực phát triển kinh tế - xã hội của các địa phương.', CAST(0x0000AD3B002D457D AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (10, N'Trường Đại học Griffith (Úc) mời tham dự Hội thảo chiến lược phục hồi du lịch thông minh', N'~/Images/Workshop_1.png', N' Theo thông báo của Trường Đại học Griffith (Úc), trong khuôn khổ Dự án “Diễn đàn du lịch Khách sạn Úc – ASEAN” được Chính phủ Úc hỗ trợ kinh phí triển khai và sự ủng hộ của Tổng cục Du lịch Việt Nam, dự kiến, Trường Đại học Griffith sẽ phối hợp với VinUniversity và các đối tác khác tổ chức các khóa đào tạo trực tuyến miễn phí và 2 hội thảo tại Việt Nam.Hội thảo đầu tiên với chủ đề “Chiến lược phục hồi du lịch thông minh” dự kiến được tổ chức tại Pullman Phu Quoc Beach Resort (Phú Quốc, Kiên Giang) vào ngày 9/7/2021 với sự tham dự (trực tuyến) của nhiều diễn giả từ Úc và các nước ASEAN nhằm thảo luận chiến lược phục hồi và phát triển ngành du lịch, khách sạn trước những thách thức to lớn của dịch Covid-19.  Nhân dịp này, Trường Đại học Griffith mời các bên liên quan trong ngành du lịch Việt Nam quan tâm, tham dự hội thảo.', CAST(0x0000AD3B002D8D55 AS DateTime))
INSERT [dbo].[TinTuc] ([ID_TT], [TenTT], [ImageTT], [NoiDungTT], [NgayNhapTT]) VALUES (11, N'Tổ chức “Ngày hội gia đình” tại Làng Văn hóa - Du lịch các dân tộc Việt Nam', N'~/Images/1.6_Lang_VHDL.jpg', N'Làng Văn hóa - Du lịch các dân tộc Việt Nam (Đồng Mô, Sơn Tây, Hà Nội) sẽ tổ chức các hoạt động tháng 6 với chủ đề “Ngày hội gia đình”. Quy mô và chương trình tùy theo diễn biến của dịch bệnh Covid-19. Trong trường hợp dịch bệnh được kiểm soát, nhiều chương trình giao lưu văn hóa, văn nghệ đặc sắc và các hoạt động tập thể như trò chơi dân gian, giáo dục, tham quan trải nghiệm sẽ được tổ chức tại Làng Văn hóa - Du lịch các dân tộc Việt Nam.  Cụ thể, với chủ đề “Truyền thống văn hóa gia đình trong cộng đồng các dân tộc”, chương trình “Trò chơi dân gian - Tuổi thơ tôi” sẽ là dịp để các em nhỏ vui đùa, trải nghiệm các trò chơi như làm con trâu bằng lá mít, chơi đá cỏ gà, kéo co, tu lu, đánh yến, tó má lẹ… và tham gia các hoạt động giáo dục về môi trường sinh thái, văn hóa dân tộc.', CAST(0x0000AD3B002DC825 AS DateTime))
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
/****** Object:  Table [dbo].[KhachHang]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID_KH] [int] IDENTITY(1,1) NOT NULL,
	[HoTenKH] [nvarchar](50) NULL,
	[SDT] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Password] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_KH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON
INSERT [dbo].[KhachHang] ([ID_KH], [HoTenKH], [SDT], [Email], [NgaySinh], [GioiTinh], [DiaChi], [Password]) VALUES (1, N'Trần Thị Loan', N'0794166819', N'Loan123@gmail.com', CAST(0xBA220B00 AS Date), N'Nữ', N'52/16 Trương Định Q3 TP.HCM', N'123456              ')
INSERT [dbo].[KhachHang] ([ID_KH], [HoTenKH], [SDT], [Email], [NgaySinh], [GioiTinh], [DiaChi], [Password]) VALUES (2, N'Lý Nghiêm Thu', N'074598019', N'Thu123@gmail.com', CAST(0x5E250B00 AS Date), N'Nữ', N'520 Điện Biên Phủ Q3 TP.HCM', N'123456              ')
INSERT [dbo].[KhachHang] ([ID_KH], [HoTenKH], [SDT], [Email], [NgaySinh], [GioiTinh], [DiaChi], [Password]) VALUES (3, N'Nguyên Thu Thủy', N'0794175301', N'Thuy123@gmail.com', CAST(0xAA210B00 AS Date), N'Nam', N'317 Sư Vạn Hạnh Q10 TP.HCM', N'123456              ')
INSERT [dbo].[KhachHang] ([ID_KH], [HoTenKH], [SDT], [Email], [NgaySinh], [GioiTinh], [DiaChi], [Password]) VALUES (4, N'Cù Thị Lâm Oanh', N'0715841052', N'Oanh123@gmail.com', CAST(0x6E240B00 AS Date), N'nữ', N'85 Sư Vạn Hạnh Q10', N'123456              ')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([TaiKhoan], [Password], [Email], [SDT]) VALUES (N'Admin', N'123456', N'trangianhi1332000@gmail.com', N'0794166910')
/****** Object:  Table [dbo].[Tour]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[ID_Tour] [int] IDENTITY(1,1) NOT NULL,
	[TenTour] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[KhachSan] [nvarchar](50) NULL,
	[PhuongTien] [nvarchar](50) NULL,
	[Gia] [decimal](18, 2) NULL,
	[NgayKhoiHanh] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[NgayTapTrung] [date] NULL,
	[DiaChiTapTrung] [nvarchar](100) NULL,
	[ID_LoaiTour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tour] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tour] ON
INSERT [dbo].[Tour] ([ID_Tour], [TenTour], [HinhAnh], [MoTa], [KhachSan], [PhuongTien], [Gia], [NgayKhoiHanh], [NgayKetThuc], [NgayTapTrung], [DiaChiTapTrung], [ID_LoaiTour]) VALUES (1, N'Hà Nội', N'~/Images/HANOI1.jpg', N'Hà Nội (chữ Hán: 河內) là thủ đô của nước Cộng hòa Xã hội chủ nghĩa Việt Nam, cũng là kinh đô của hầu hết các vương triều phong kiến tại Việt Nam trước đây. Do đó, lịch sử Hà Nội gắn liền với sự thăng trầm của lịch sử Việt Nam qua các thời kỳ.[5] Hà Nội là thành phố trực thuộc trung ương và là thành phố có diện tích lớn nhất cả nước từ khi tỉnh Hà Tây sáp nhập vào, đồng thời cũng là địa phương đứng thứ hai về dân số với hơn 8 triệu người (năm 2019). Tuy nhiên, nếu tính những người cư trú không đăng ký thì dân số thực tế của thành phố này năm 2019 là gần 10 triệu người. Mật độ dân số của Hà Nội là 2.398 người/km², mật độ giao thông là 105,2 xe/km² mặt đường. Hiện nay, Hà Nội là một đô thị loại đặc biệt của Việt Nam.  Năm 2019, Hà Nội là đơn vị hành chính Việt Nam xếp thứ 2 về Tổng sản phẩm trên địa bàn (GRDP), xếp thứ 8 về GRDP bình quân đầu người, đứng thứ 41 về tốc độ tăng trưởng GRDP. GRDP đạt 971.700 tỉ Đồng (tương ứng với 41,85 tỉ USD), GRDP bình quân đầu người đạt 120,6 triệu đồng (tương ứng với 5200 USD),', N'4 sao', N'Máy bay', CAST(5000000.00 AS Decimal(18, 2)), CAST(0xB2420B00 AS Date), CAST(0xB4420B00 AS Date), CAST(0xB1420B00 AS Date), N'TP.HCM', 1)
INSERT [dbo].[Tour] ([ID_Tour], [TenTour], [HinhAnh], [MoTa], [KhachSan], [PhuongTien], [Gia], [NgayKhoiHanh], [NgayKetThuc], [NgayTapTrung], [DiaChiTapTrung], [ID_LoaiTour]) VALUES (2, N'Sapa', N'~/Images/HaLong.jpg', N'Tên gọi của thị xã xuất phát từ tên thị trấn Sa Pa cũ. Thị trấn này ra đời vào năm 1905, khi người Pháp phát hiện đây là địa điểm lý tưởng để xây dựng khu nghỉ mát và đã thực hiện. Tên "Sa Pả" là tên vốn có theo tiếng H''Mông ở vùng này, có nghĩa là "bãi cát" (Hán Việt: Sa Bá, 沙坝), người Pháp viết tên khu là "Chapa", vì âm "S" phát âm cứng gần như "Ch" trong tiếng Pháp và "S" trong tiếng Việt chuẩn. Dấu tích còn lại của tên vùng là phường Sa Pả ngày nay[4]. Cùng với các tên đó là loạt tên xã theo tiếng H''Mông như Lao Chải, San Sả Hồ, Sử Pán, Suối Thầu, Tả Giàng Phình,...', N'4 sao', N'Máy bay', CAST(4090000.00 AS Decimal(18, 2)), CAST(0xB2420B00 AS Date), CAST(0xB4420B00 AS Date), CAST(0xB1420B00 AS Date), N'Đã Nẵng', 1)
INSERT [dbo].[Tour] ([ID_Tour], [TenTour], [HinhAnh], [MoTa], [KhachSan], [PhuongTien], [Gia], [NgayKhoiHanh], [NgayKetThuc], [NgayTapTrung], [DiaChiTapTrung], [ID_LoaiTour]) VALUES (3, N'TP. HỒ CHÍ MINH ', N'~/Images/HCM2.jpg', N'Thành phố Hồ Chí Minh (còn gọi là Sài Gòn) là thành phố lớn nhất tại Việt Nam về dân số và quy mô đô thị hóa. Đây còn là trung tâm kinh tế, chính trị, văn hóa và giáo dục tại Việt Nam. Thành phố Hồ Chí Minh là thành phố trực thuộc trung ương thuộc loại đô thị đặc biệt của Việt Nam cùng với thủ đô Hà Nội.[5]  Nằm trong vùng chuyển tiếp giữa Đông Nam Bộ và Tây Nam Bộ, thành phố này hiện có 16 quận, 1 thành phố và 5 huyện, tổng diện tích 2.061 km².[6] Theo kết quả điều tra dân số chính thức vào thời điểm ngày một tháng 4 năm 2009 thì dân số thành phố là 7.162.864 người (chiếm 8,34% dân số Việt Nam), mật độ dân số trung bình 3.419 người/km². Đến năm 2019, dân số thành phố tăng lên 8.993.082 người và cũng là nơi có mật độ dân số cao nhất Việt Nam.[7] Tuy nhiên, nếu tính những người cư trú không đăng ký hộ khẩu thì dân số thực tế của thành phố này năm 2018 là gần 14 triệu người.[8] Thành phố Hồ Chí Minh năm 2011 chiếm 21,3% tổng sản phẩm (GDP) và 29,38% tổng thu ngân sách của cả Việt Nam.[9][10] Năm 2020, thành phố có GRDP theo giá hiện hành ước là 1.372 nghìn tỷ đồng, theo giá so sánh 2010 đạt 991.424 tỷ đồng (số liệu địa phương cung cấp, Tổng cục Thống kê sẽ công bố GRDP đánh giá lại), tăng 1,39% so với năm 2019, đóng góp trên 22% GDP và 27% tổng thu ngân sách cả nước. GRDP bình quân đầu người ước năm 2020 là 6.328 USD/người (Báo cáo chính trị Đại hội đảng bộ Thành phố Hồ Chí Minh) xếp thứ 4 trong số các tỉnh thành cả nước, nhưng so với năm 2019 là giảm[11]. Thu nhập bình quân đầu người năm 2019 sơ bộ là 6,758 triệu VN đồng / tháng cao thứ hai cả nước. Nhờ điều kiện tự nhiên, Thành phố Hồ Chí Minh trở thành một đầu mối giao thông của Việt Nam và Đông Nam Á, bao gồm cả đường bộ, đường sắt, đường thủy và đường không. Vào năm 2007, thành phố đón khoảng 3 triệu khách du lịch quốc tế tức 70% lượng khách vào Việt Nam. Các lĩnh vực giáo dục, truyền thông, thể thao, giải trí, Thành phố Hồ Chí Minh đều giữ vị thế nhất định.', N'4 sao', N'ÔTÔ', CAST(3500000.00 AS Decimal(18, 2)), CAST(0xBC420B00 AS Date), CAST(0xBE420B00 AS Date), CAST(0xBB420B00 AS Date), N'TP.HCM', 3)
INSERT [dbo].[Tour] ([ID_Tour], [TenTour], [HinhAnh], [MoTa], [KhachSan], [PhuongTien], [Gia], [NgayKhoiHanh], [NgayKetThuc], [NgayTapTrung], [DiaChiTapTrung], [ID_LoaiTour]) VALUES (4, N'Phú Quốc', N'~/Images/phuquoc.jpg', N'Phú Quốc là hòn đảo lớn nhất Việt Nam, nằm trong vịnh Thái Lan. Đảo Phú Quốc cùng với các đảo nhỏ hơn ở lân cận và quần đảo Thổ Chu nằm cách đó 55 hải lý về phía tây nam hợp thành thành phố Phú Quốc thuộc tỉnh Kiên Giang. Đây cũng là thành phố đảo đầu tiên của Việt Nam.', N'5 sao', N'Tàu Hỏa', CAST(5000000.00 AS Decimal(18, 2)), CAST(0xB7420B00 AS Date), CAST(0xB9420B00 AS Date), CAST(0xB6420B00 AS Date), N'TP.HCM', 3)
INSERT [dbo].[Tour] ([ID_Tour], [TenTour], [HinhAnh], [MoTa], [KhachSan], [PhuongTien], [Gia], [NgayKhoiHanh], [NgayKetThuc], [NgayTapTrung], [DiaChiTapTrung], [ID_LoaiTour]) VALUES (5, N'Hạ Long', N'~/Images/HaLong1.jpg', N'Hạ Long là thành phố tỉnh lỵ của tỉnh Quảng Ninh, Việt Nam.  Thành phố được đặt theo tên của vịnh Hạ Long, vịnh biển nằm ở phía nam thành phố và là một di sản thiên nhiên nổi tiếng của Việt Nam. Tên "Hạ Long" (chữ Hán: 下龍) nghĩa là "con rồng bay xuống".[a]  Thành phố Hạ Long được thành lập ngày 27 tháng 12 năm 1993 trên cơ sở toàn bộ diện tích và dân số của thị xã Hồng Gai cũ[1]. Ngày 10 tháng 10 năm 2013, thành phố được công nhận là đô thị loại I.[2]  Trước năm 2019, phần đất liền thuộc địa giới hành chính của Hạ Long bị chia tách bởi vịnh Cửa Lục, đất liền phía bắc là địa phận huyện Hoành Bồ. Bến phà Bãi Cháy và sau đó là Cầu Bãi Cháy là phương tiện kết nối trực tiếp duy nhất cho giao thông đường bộ của thành phố khi đó. Ngày 1 tháng 1 năm 2020, sau khi sáp nhập huyện Hoành Bồ vào địa giới hành chính, Hạ Long trở thành thành phố thuộc tỉnh có diện tích lớn nhất Việt Nam, đồng thời phần đất liền của Hạ Long được nối liền.[6]', N'5 sao', N'ÔTÔ', CAST(4090000.00 AS Decimal(18, 2)), CAST(0xBA420B00 AS Date), CAST(0xBC420B00 AS Date), CAST(0xB9420B00 AS Date), N'Đã Nẵng', 3)
INSERT [dbo].[Tour] ([ID_Tour], [TenTour], [HinhAnh], [MoTa], [KhachSan], [PhuongTien], [Gia], [NgayKhoiHanh], [NgayKetThuc], [NgayTapTrung], [DiaChiTapTrung], [ID_LoaiTour]) VALUES (6, N'Nha Trang', N'~/Images/images5325124_nhatrang.jpg', N'Nha Trang là một thành phố ven biển và là trung tâm chính trị, kinh tế, văn hóa, khoa học kỹ thuật và du lịch của tỉnh Khánh Hòa, Việt Nam.  Trước đây, vùng đất Nha Trang vốn thuộc về Chiêm Thành, do đó các di tích của người Chăm vẫn còn tồn tại nhiều nơi ở Nha Trang. Nha Trang được Thủ tướng chính phủ Việt Nam công nhận là đô thị loại I vào ngày 22 tháng 4 năm 2009. Nha Trang được mệnh danh là hòn ngọc của biển Đông, Viên ngọc xanh [3] vì giá trị thiên nhiên, vẻ đẹp cũng như khí hậu của nó.[4]', N'5 sao', N'ÔTÔ', CAST(5500000.00 AS Decimal(18, 2)), CAST(0xB2420B00 AS Date), CAST(0xB4420B00 AS Date), CAST(0xB1420B00 AS Date), N'TP.HCM', 3)
INSERT [dbo].[Tour] ([ID_Tour], [TenTour], [HinhAnh], [MoTa], [KhachSan], [PhuongTien], [Gia], [NgayKhoiHanh], [NgayKetThuc], [NgayTapTrung], [DiaChiTapTrung], [ID_LoaiTour]) VALUES (7, N'Đà Nẵng', N'~/Images/download (1).jpg', N'Đà Nẵng là một thành phố trực thuộc trung ương, nằm trong vùng Duyên hải Nam Trung Bộ Việt Nam, là thành phố trung tâm và lớn nhất khu vực miền Trung - Tây Nguyên.  Thành phố Đà Nẵng là thành phố tổng hợp đa ngành, đa lĩnh vực; trung tâm chính trị - kinh tế - xã hội với vai trò là trung tâm công nghiệp, tài chính, du lịch, dịch vụ, văn hóa, giáo dục - đào tạo, y tế chất lượng cao, khoa học - công nghệ, khởi nghiệp, đổi mới sáng tạo của khu vực Miền Trung - Tây Nguyên và cả nước; trung tâm tổ chức các sự kiện tầm khu vực và quốc tế. Thành phố Đà Nẵng đóng vai trò hạt nhân, quan trọng trong Vùng kinh tế trọng điểm miền Trung, đồng thời cũng là một trong 5 thành phố trực thuộc Trung ương ở Việt Nam, đô thị loại I, trung tâm cấp quốc gia, cùng với Hải Phòng và Cần Thơ.   Bãi biển Mỹ Khê, được tạp chí Forbes (Mỹ) bình chọn là "một trong sáu bãi biển quyến rũ nhất hành tinh" Đà Nẵng nằm ở vị trí trung độ của Việt Nam, có vị trí trọng yếu cả về kinh tế - xã hội và quốc phòng - an ninh của khu vực Miền Trung - Tây Nguyên và cả nước; là đô thị biển và đầu mối giao thông rất quan trọng về đường bộ, đường sắt, đường biển và đường hàng không.[4] Trong những năm gần đây, Đà Nẵng tích cực đầu tư xây dựng cơ sở hạ tầng, cải thiện môi trường, nâng cao an sinh xã hội và được coi là "Thành phố đáng sống nhất Việt Nam".[5][6] Năm 2018, Đà Nẵng được chọn đại diện cho Việt Nam lọt vào Top 10 Địa điểm Tốt nhất để Sống ở Nước ngoài do Tạp chí Du lịch Live and Invest Overseas (LIO) bình chọn.[7]', N'5 sao', N'Máy bay', CAST(5000000.00 AS Decimal(18, 2)), CAST(0xBC420B00 AS Date), CAST(0xBE420B00 AS Date), CAST(0xBB420B00 AS Date), N'TP.HCM', 1)
INSERT [dbo].[Tour] ([ID_Tour], [TenTour], [HinhAnh], [MoTa], [KhachSan], [PhuongTien], [Gia], [NgayKhoiHanh], [NgayKetThuc], [NgayTapTrung], [DiaChiTapTrung], [ID_LoaiTour]) VALUES (8, N'Huế', N'~/Images/hue2.jpg', N'Huế là thành phố tỉnh lỵ của tỉnh Thừa Thiên Huế, Việt Nam.  Huế từng là kinh đô (cố đô Huế) của Việt Nam thời phong kiến dưới triều Tây Sơn (1788–1801) và nhà Nguyễn (1802–1945). Hiện nay, thành phố là một trong những trung tâm về văn hóa – du lịch, y tế chuyên sâu, giáo dục đào tạo, khoa học công nghệ của Miền Trung - Tây Nguyên và cả nước. Những địa danh nổi bật là sông Hương và những di sản để lại của triều đại phong kiến, Thành phố có năm danh hiệu UNESCO ở Việt Nam: Quần thể di tích Cố đô Huế (1993), Nhã nhạc cung đình Huế (2003), Mộc bản triều Nguyễn (2009), Châu bản triều Nguyễn (2014) và Hệ thống thơ văn trên kiến trúc cung đình Huế (2016). Ngoài ra, Huế còn là một trong những địa phương có di sản hát bài chòi đã được công nhận là di sản văn hóa phi vật thể của nhân loại.', N'4 sao', N'ÔTÔ', CAST(5000000.00 AS Decimal(18, 2)), CAST(0xCF420B00 AS Date), CAST(0xD1420B00 AS Date), CAST(0xCE420B00 AS Date), N'Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[Tour] OFF
/****** Object:  Table [dbo].[DonHang]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[ID_DonHang] [int] IDENTITY(1,1) NOT NULL,
	[TinhTrang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[ID_KH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DonHang] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhaiHoi]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhaiHoi](
	[ID_PH] [int] IDENTITY(1,1) NOT NULL,
	[ID_Tour] [int] NULL,
	[TenNguoiGui] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[TieudePH] [nvarchar](50) NULL,
	[NoidungPH] [nvarchar](max) NULL,
	[NgayGui] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichTrinh]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichTrinh](
	[ID_LichTrinh] [int] IDENTITY(1,1) NOT NULL,
	[ID_Tour] [int] NULL,
	[Ngay] [nvarchar](10) NULL,
	[TenLT] [nvarchar](50) NULL,
	[HinhAnhLT] [nvarchar](50) NULL,
	[Mota] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_LichTrinh] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitietDH]    Script Date: 06/02/2021 11:17:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietDH](
	[ID_DonHang] [int] NOT NULL,
	[ID_Tour] [int] NOT NULL,
	[Soluong] [int] NULL,
	[DonGia] [decimal](18, 2) NULL,
 CONSTRAINT [PK_chitietDH] PRIMARY KEY CLUSTERED 
(
	[ID_DonHang] ASC,
	[ID_Tour] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__Tour__ID_LoaiTou__0CBAE877]    Script Date: 06/02/2021 11:17:38 ******/
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD FOREIGN KEY([ID_LoaiTour])
REFERENCES [dbo].[LoaiTour] ([ID_LoaiTour])
GO
/****** Object:  ForeignKey [FK__DonHang__ID_KH__1ED998B2]    Script Date: 06/02/2021 11:17:38 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([ID_KH])
REFERENCES [dbo].[KhachHang] ([ID_KH])
GO
/****** Object:  ForeignKey [FK__PhaiHoi__ID_Tour__164452B1]    Script Date: 06/02/2021 11:17:38 ******/
ALTER TABLE [dbo].[PhaiHoi]  WITH CHECK ADD FOREIGN KEY([ID_Tour])
REFERENCES [dbo].[Tour] ([ID_Tour])
GO
/****** Object:  ForeignKey [FK__LichTrinh__ID_To__117F9D94]    Script Date: 06/02/2021 11:17:38 ******/
ALTER TABLE [dbo].[LichTrinh]  WITH CHECK ADD FOREIGN KEY([ID_Tour])
REFERENCES [dbo].[Tour] ([ID_Tour])
GO
/****** Object:  ForeignKey [FK__chitietDH__ID_Do__20C1E124]    Script Date: 06/02/2021 11:17:38 ******/
ALTER TABLE [dbo].[chitietDH]  WITH CHECK ADD  CONSTRAINT [FK__chitietDH__ID_Do__20C1E124] FOREIGN KEY([ID_DonHang])
REFERENCES [dbo].[DonHang] ([ID_DonHang])
GO
ALTER TABLE [dbo].[chitietDH] CHECK CONSTRAINT [FK__chitietDH__ID_Do__20C1E124]
GO
/****** Object:  ForeignKey [FK__chitietDH__ID_To__21B6055D]    Script Date: 06/02/2021 11:17:38 ******/
ALTER TABLE [dbo].[chitietDH]  WITH CHECK ADD  CONSTRAINT [FK__chitietDH__ID_To__21B6055D] FOREIGN KEY([ID_Tour])
REFERENCES [dbo].[Tour] ([ID_Tour])
GO
ALTER TABLE [dbo].[chitietDH] CHECK CONSTRAINT [FK__chitietDH__ID_To__21B6055D]
GO
