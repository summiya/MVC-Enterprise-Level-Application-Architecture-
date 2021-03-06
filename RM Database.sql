USE [ResturantManagement]
GO
/****** Object:  Table [dbo].[tblkitchen]    Script Date: 9/4/2018 1:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblkitchen](
	[kitchenID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tblkitchen] PRIMARY KEY CLUSTERED 
(
	[kitchenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 9/4/2018 1:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Qty] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[discount] [float] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderItem]    Script Date: 9/4/2018 1:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderItem](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 9/4/2018 1:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[KitchenID] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_tblItem] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 9/4/2018 1:08:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblkitchen] ON 

INSERT [dbo].[tblkitchen] ([kitchenID], [Name]) VALUES (1, N'Veg')
INSERT [dbo].[tblkitchen] ([kitchenID], [Name]) VALUES (2, N'Non Veg')
SET IDENTITY_INSERT [dbo].[tblkitchen] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([ProductID], [Name], [KitchenID], [price]) VALUES (1, N'Simple Pizza', 2, 15)
INSERT [dbo].[tblProduct] ([ProductID], [Name], [KitchenID], [price]) VALUES (2, N'Cheese Burger', 2, 20)
INSERT [dbo].[tblProduct] ([ProductID], [Name], [KitchenID], [price]) VALUES (3, N'BBQ Pizza', 2, 15)
INSERT [dbo].[tblProduct] ([ProductID], [Name], [KitchenID], [price]) VALUES (4, N'Cheese Burger', 2, 20)
INSERT [dbo].[tblProduct] ([ProductID], [Name], [KitchenID], [price]) VALUES (5, N'Fajita Pizza', 2, 15)
INSERT [dbo].[tblProduct] ([ProductID], [Name], [KitchenID], [price]) VALUES (6, N'Cheese Burger', 2, 20)
INSERT [dbo].[tblProduct] ([ProductID], [Name], [KitchenID], [price]) VALUES (7, N'Pizza', 2, 15)
INSERT [dbo].[tblProduct] ([ProductID], [Name], [KitchenID], [price]) VALUES (8, N'Cheese Burger', 2, 20)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
ALTER TABLE [dbo].[tblOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrder] ([OrderID])
GO
ALTER TABLE [dbo].[tblOrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[tblOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_tblItem] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[tblOrderItem] CHECK CONSTRAINT [FK_OrderItem_tblItem]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_Kitchen_Item] FOREIGN KEY([KitchenID])
REFERENCES [dbo].[tblkitchen] ([kitchenID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_Kitchen_Item]
GO
