/****** Object:  Table [dbo].[Customer]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Contact] [nvarchar](11) NOT NULL,
	[Employer] [nvarchar](256) NULL,
	[Password] [nvarchar](64) NOT NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_Customer_Active]  DEFAULT ((0)),
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItem](
	[Id] [uniqueidentifier] NOT NULL,
	[VendorId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](3000) NULL,
	[Type] [int] NOT NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_FoodItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[VendorId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuFoodItem]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuFoodItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[FoodItemId] [uniqueidentifier] NOT NULL,
	[VendorId] [uniqueidentifier] NOT NULL,
	[Availability] [bit] NOT NULL,
 CONSTRAINT [PK_MenuFoodItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[VenderId] [uniqueidentifier] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[ServiceTax] [decimal](18, 2) NOT NULL,
	[Vat] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[TimeSlot] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[OrderDateTime] [datetime2](7) NULL,
	[Accepted] [bit] NOT NULL,
	[TokenNo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[FoodItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionId] [nvarchar](500) NOT NULL,
	[PaymentVia] [nvarchar](100) NOT NULL,
	[PaymentStatus] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Site]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Site](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Address] [nvarchar](256) NOT NULL,
	[Contact] [nvarchar](11) NULL,
	[Owner] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 2/14/2018 5:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Contact] [nvarchar](11) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[ShopNo] [nvarchar](8) NULL,
	[Logo] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_Vendor_Active]  DEFAULT ((0)),
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Customer] ([Id], [Name], [Email], [Contact], [Employer], [Password], [Active]) VALUES (N'acb20936-bc6b-4e81-8fe8-2145ef51460a', N'new', N'new@gmail.com', N'9898989898', NULL, N'12345', 0)
INSERT [dbo].[Customer] ([Id], [Name], [Email], [Contact], [Employer], [Password], [Active]) VALUES (N'33f6ec56-aeab-44e1-aedf-41138a6713b2', N'Sanjeet', N'sanjeet1827@gmail.com', N'9899138026', NULL, N'12345', 1)
INSERT [dbo].[Customer] ([Id], [Name], [Email], [Contact], [Employer], [Password], [Active]) VALUES (N'db29d266-81fd-4042-942d-5aea09c6b826', N'Ravi', N'ravi@gmail.com', N'9878237654', NULL, N'12345', 1)
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'e572d8e4-74f7-4276-894d-019369416d5e', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Butter Roti', CAST(22.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:33:48.800' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'039b7404-d7d6-46dc-adc6-0504c1c08db3', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Veg Patty', CAST(22.00 AS Decimal(18, 2)), N'', 1, CAST(N'2015-12-28 22:25:13.080' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'23db12ce-3b62-47a1-a75b-054f33401ef0', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', N'Stuffed Bread', CAST(100.00 AS Decimal(18, 2)), N'Cheese,Backed, vegitabled filled', 1, CAST(N'2015-12-27 00:16:54.067' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'c428433b-cb87-4380-8962-07afb7cc485e', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Premium Thali', CAST(120.00 AS Decimal(18, 2)), NULL, 2, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'42df6fe9-3c24-4db3-9681-17da1afe5009', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Dal Makhani', CAST(165.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:30:40.243' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'3d667918-9188-4399-8ae3-1b2535c2591e', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Kabab Platters', CAST(210.00 AS Decimal(18, 2)), N'2PCs Paneer Tikka, 2 Pcs Seekh Kabab, 2 PCs Bharwa Aloo, Lachcha Paratha, Dal Makni, Raita, Kimchi Salad', 2, CAST(N'2015-12-28 22:28:08.157' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'994de29e-08ee-4357-8ab5-1c84ec8be606', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Kadhi Chawal', CAST(120.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:32:11.713' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'a5a4a7e3-d990-4194-a803-22f00478d212', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', N'Aaloo Burger', CAST(25.00 AS Decimal(18, 2)), N'Cheese', 1, CAST(N'2015-12-27 00:16:07.447' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'659ab4ce-317b-4b12-ad21-233a1e217890', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Aloo Partha', CAST(25.00 AS Decimal(18, 2)), N'', 4, CAST(N'2015-12-28 22:36:58.033' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'47d8e25c-0eb6-4d01-b8b9-2442404ec297', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Sandwich', CAST(20.00 AS Decimal(18, 2)), NULL, 3, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'9c373c09-23b2-426e-9d23-279d315d429e', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Normal Thali', CAST(100.00 AS Decimal(18, 2)), NULL, 4, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'32484b91-64da-4a9d-b950-3301b68e367e', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Punjabi Paneer', CAST(175.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:30:55.417' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'866ec0ef-ee43-4c76-b4b1-34e66cbabfd1', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Veg Sandwich', CAST(20.00 AS Decimal(18, 2)), N'Most selling Item', 1, CAST(N'2015-12-28 22:26:31.877' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'1336e032-a3f5-4d20-af8b-3ec5b47185f7', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Jeera Pulao', CAST(115.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:32:59.557' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'2ccf3b80-4793-48e2-aa68-44e012159ecf', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', N'Rice Bowl', CAST(90.00 AS Decimal(18, 2)), NULL, 2, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'15dcdbb5-7403-42f7-8dde-48215d9e31e0', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Veg Chowmin', CAST(115.00 AS Decimal(18, 2)), N'', 4, CAST(N'2015-12-28 22:37:37.133' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'0800a929-ddf1-405a-894c-5777993376f0', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', N'Chicken Bucket-4', CAST(450.00 AS Decimal(18, 2)), NULL, 2, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'8bde7b6f-3848-4369-9f0a-611aca7fb2a7', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Papri Chaat', CAST(75.00 AS Decimal(18, 2)), N'', 3, CAST(N'2015-12-28 22:35:31.123' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'e0449827-18d4-4477-8212-616d0afad260', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Spring Roll', CAST(35.00 AS Decimal(18, 2)), N'Famous Chinese Dish', 1, CAST(N'2018-02-06 16:23:28.647' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'92d90d64-382f-4267-8c74-6236137c0293', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', N'Garlic Bread', CAST(90.00 AS Decimal(18, 2)), N'Cheese,Backed', 1, CAST(N'2015-12-27 00:16:29.963' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'edb9e70e-a58f-4e78-b1a4-65fbe91ebd7f', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Fulwari Special Thali', CAST(200.00 AS Decimal(18, 2)), N'Naan, Paratha, Paneer Sabji, Dry Veg, Dal Makhani, Pulao, Raita, Salad, Pickle, Papad & Sweet', 2, CAST(N'2015-12-28 22:29:21.300' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'd1bfe981-a277-47c9-93ec-6a7298fedbb3', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Mutter Kulcha', CAST(65.00 AS Decimal(18, 2)), N'', 3, CAST(N'2015-12-28 22:34:40.283' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'ba94a909-3054-47b2-8d78-6ba67ef58342', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', N'King Size Pizza', CAST(300.00 AS Decimal(18, 2)), N'So Cheesy, family serve', 2, CAST(N'2015-12-27 00:17:55.880' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'588ea24c-4032-43d1-a289-729338390c82', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', N'Chicken Bucket-8', CAST(800.00 AS Decimal(18, 2)), NULL, 2, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'e4b5d92d-2630-4107-a6ce-74cf4f36fcee', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', N'Pan Pizza', CAST(200.00 AS Decimal(18, 2)), N'Thin Crust', 2, CAST(N'2015-12-27 00:18:10.560' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'b60050df-b195-49ee-9659-74d3032a6671', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Paneer Butter Masala', CAST(175.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:31:20.517' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'7c08031c-d8eb-470b-ab35-79de64de00c6', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', N'Chees Burst Pizza Regural', CAST(150.00 AS Decimal(18, 2)), N'So Cheesy', 2, CAST(N'2015-12-27 00:17:26.737' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'56134f6c-759e-4f74-9edf-7aeeea6f99c7', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Samosa', CAST(15.00 AS Decimal(18, 2)), N'Traditional Taste', 1, CAST(N'2015-12-28 22:23:03.840' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'68d01144-c108-4d13-ab81-7eb74e3cb2ed', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Paneer Naan', CAST(75.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:33:24.913' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'e3170b12-cd05-4371-8bb7-8018c307d9cf', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Sprouts', CAST(20.00 AS Decimal(18, 2)), NULL, 1, NULL)
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'ca654b48-e767-44af-a688-825585457b62', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Hakka Noodles', CAST(120.00 AS Decimal(18, 2)), N'', 4, CAST(N'2015-12-28 22:37:50.353' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'f458273a-a059-4441-a2ee-8f6b64d4d982', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Ghar Ki Thali', CAST(175.00 AS Decimal(18, 2)), N'Lachcha Paratha/Naan, Roti, Paneer Sabji, Dry Veg, Dal Tadka, Plain Rice, Pickle Papad', 2, CAST(N'2015-12-28 22:30:15.523' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'27a43861-b208-497d-b6cd-923dae475f13', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Bread Toast', CAST(40.00 AS Decimal(18, 2)), N'No fat fresh food', 1, NULL)
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'b8660a8d-6179-4d9a-bfd2-92b86f5ecbaf', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Sahi Paneer', CAST(175.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:31:32.550' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'e73548af-f9c2-4f9a-9903-93cc2a8a60a7', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Kachori and Sabji', CAST(45.00 AS Decimal(18, 2)), N'', 3, CAST(N'2015-12-28 22:34:53.630' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'fa16bb62-6230-40a9-b8db-97145615f822', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Delux Thali', CAST(150.00 AS Decimal(18, 2)), NULL, 2, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'c43d3146-7636-499e-b80d-990922aaaa21', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Khasta Kachori', CAST(15.00 AS Decimal(18, 2)), N'Traditional Taste', 1, CAST(N'2015-12-28 22:23:28.070' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'3d4f921a-9787-4864-b525-9974cda263cb', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Rajma Rice', CAST(40.00 AS Decimal(18, 2)), NULL, 4, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'dd9b2473-14f7-4b76-b312-9dec232be80d', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', N'Chicken Bucket-4', CAST(450.00 AS Decimal(18, 2)), NULL, 4, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'2bcfa52d-1842-4150-8a99-a1bb26993467', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Paneer Rice', CAST(50.00 AS Decimal(18, 2)), NULL, 4, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'dfc6ca4a-a7f4-4338-af76-a7005409e329', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Plain Roti', CAST(17.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:34:00.147' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'79ae2c61-e62f-4c14-a80c-aae7a92e0b18', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Gobhi Paratha', CAST(25.00 AS Decimal(18, 2)), N'', 4, CAST(N'2015-12-28 22:37:11.300' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'448340ee-24fa-413b-9faa-b41341f37d69', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Caoffee', CAST(30.00 AS Decimal(18, 2)), N'Latte, Esprasso', 1, CAST(N'2015-12-25 22:34:36.597' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'68176d3b-0bfa-48a3-b133-c15e79d55ce6', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Veg Cutlet', CAST(20.00 AS Decimal(18, 2)), N'', 1, CAST(N'2015-12-28 22:24:55.553' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'4b4e4fa3-51d4-4d89-8436-c15efe4ca316', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Mix Veg', CAST(165.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:31:44.710' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'1611eb3d-3d1e-4f11-8154-c31d07c54c5f', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Kadai Paneer', CAST(175.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:31:05.367' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'42ed47c2-fe4a-4718-8a46-cf53c6b71ec4', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Normal Thali', CAST(100.00 AS Decimal(18, 2)), NULL, 2, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'1ae69aa0-b39f-41e5-a830-d3dac3cab159', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Premium Thali', CAST(150.00 AS Decimal(18, 2)), N'2 PCs Naan, Paneer, Mix Veg, Raita, Salad, Sweet', 4, CAST(N'2015-12-28 22:36:32.700' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'744c6565-b833-4aa1-aa31-db9ad78ea542', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Gobhi Masala', CAST(120.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:31:57.817' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'880c4b57-2acd-4d23-8cfb-de29f59c8fc9', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Plain Dhokla', CAST(25.00 AS Decimal(18, 2)), N'Famous Gujrati Dish', 1, CAST(N'2015-12-28 22:24:22.667' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'b4750479-9f7a-4c3b-8554-deaac027a1f1', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Samosa', CAST(10.00 AS Decimal(18, 2)), NULL, 3, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'447873a5-a4b4-4a2b-b7e8-e204148c4b65', N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Samosa', CAST(10.00 AS Decimal(18, 2)), NULL, 1, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'74db281a-71f7-404c-9cf0-e69527f42d7d', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Butter Naan', CAST(60.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:33:34.523' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'a2b3152d-072e-40e9-8e0d-f64441a96a23', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', N'Zinger', CAST(90.00 AS Decimal(18, 2)), NULL, 3, CAST(N'2015-12-25 19:14:32.673' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'd86ccd82-1b1c-43fc-86c6-f8ad788309cd', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Rajma Chawal', CAST(120.00 AS Decimal(18, 2)), N'', 2, CAST(N'2015-12-28 22:32:24.770' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'd181fd80-2198-4415-8285-fbc54acd1e4c', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Bhel Poori', CAST(45.00 AS Decimal(18, 2)), N'', 3, CAST(N'2015-12-28 22:35:17.157' AS DateTime))
INSERT [dbo].[FoodItem] ([Id], [VendorId], [Name], [Price], [Description], [Type], [LastUpdate]) VALUES (N'4b6e8575-db4b-48f2-9ed3-fee7ba298d6c', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Paneer Patty', CAST(25.00 AS Decimal(18, 2)), N'Stuffed with fired cheese', 1, CAST(N'2015-12-28 22:25:43.173' AS DateTime))
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'e52df8b0-d2aa-4d15-973a-006740613bfb', 1, N'23db12ce-3b62-47a1-a75b-054f33401ef0', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'8e812d99-50e1-4772-9fb9-0168ee0313d6', 4, N'ca654b48-e767-44af-a688-825585457b62', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'079024a3-cf81-4134-863b-06a0b208dfb1', 2, N'ba94a909-3054-47b2-8d78-6ba67ef58342', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'a403f02e-1219-4bae-83ff-083fbdc01144', 4, N'79ae2c61-e62f-4c14-a80c-aae7a92e0b18', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'568a3b79-fa93-42d1-bf8a-14054d3f5516', 2, N'68d01144-c108-4d13-ab81-7eb74e3cb2ed', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'56cbcb97-d8d6-4d70-aea1-151f3caf3a5e', 2, N'edb9e70e-a58f-4e78-b1a4-65fbe91ebd7f', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'8dd91d93-b34a-47ca-8a94-16d137f4f253', 2, N'f458273a-a059-4441-a2ee-8f6b64d4d982', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'53c16e82-a5b0-4a0d-bcc1-2219d203ac56', 2, N'659ab4ce-317b-4b12-ad21-233a1e217890', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'77ee198e-84db-4a02-b858-2744768b4075', 1, N'866ec0ef-ee43-4c76-b4b1-34e66cbabfd1', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'0679a271-3e4c-450b-a649-28f80f6c43a3', 2, N'e572d8e4-74f7-4276-894d-019369416d5e', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'4a5962bd-af20-43eb-bac8-293433a8b64e', 2, N'd86ccd82-1b1c-43fc-86c6-f8ad788309cd', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'6adc9bc2-ee19-4150-94a4-2c240244038a', 4, N'dd9b2473-14f7-4b76-b312-9dec232be80d', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'c6e8b910-a79d-4053-8b25-2f5c440b6aee', 2, N'79ae2c61-e62f-4c14-a80c-aae7a92e0b18', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'0c9ed96e-15a3-4d3a-aee8-2f9edf529379', 2, N'0800a929-ddf1-405a-894c-5777993376f0', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'278d4c5f-7df0-486d-924f-326c4de8721b', 2, N'c428433b-cb87-4380-8962-07afb7cc485e', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'66cd6cbc-4bc4-4327-b62e-35366c2f5f88', 3, N'e73548af-f9c2-4f9a-9903-93cc2a8a60a7', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'c03498ee-ffca-4078-b20e-3dd6bca020a7', 2, N'744c6565-b833-4aa1-aa31-db9ad78ea542', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'94c689ba-ea0e-4e86-b8af-3e6006aa4847', 1, N'448340ee-24fa-413b-9faa-b41341f37d69', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'b3877527-026d-4946-bb52-3e8e6f7bae73', 2, N'1336e032-a3f5-4d20-af8b-3ec5b47185f7', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'a1186cb1-f7e0-41ea-ace8-43105a87c6a5', 1, N'659ab4ce-317b-4b12-ad21-233a1e217890', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'1834f3f4-b801-45ea-9274-4e5b1707ed18', 2, N'3d667918-9188-4399-8ae3-1b2535c2591e', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'0c2fc084-f135-4239-a5a6-4f8e7a944526', 2, N'32484b91-64da-4a9d-b950-3301b68e367e', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'9a3b322d-16b6-400f-87f1-524f4e1335e5', 2, N'b8660a8d-6179-4d9a-bfd2-92b86f5ecbaf', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'ee6f22af-5dac-43b3-94fb-53cd93c1dd58', 2, N'dfc6ca4a-a7f4-4338-af76-a7005409e329', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'36ce365b-c437-4c6f-a73f-542a56a03c09', 1, N'e0449827-18d4-4477-8212-616d0afad260', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'e954bdab-2d7c-48a2-8127-5e1fba285c38', 4, N'9c373c09-23b2-426e-9d23-279d315d429e', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'2df6fec4-e961-4a70-8655-61ca70d53be5', 2, N'7c08031c-d8eb-470b-ab35-79de64de00c6', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'cc2e235c-6829-4fdb-a0bd-6eba47d0305b', 1, N'68176d3b-0bfa-48a3-b133-c15e79d55ce6', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'da12507a-345a-43c0-83ff-72cc62e66db2', 2, N'a2b3152d-072e-40e9-8e0d-f64441a96a23', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'447b555a-db35-43d6-afc3-75c28f8a3eab', 1, N'039b7404-d7d6-46dc-adc6-0504c1c08db3', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'7ecea62c-3db6-4dee-9859-799a8b36f6e8', 2, N'9c373c09-23b2-426e-9d23-279d315d429e', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'9b02d31d-3eef-434b-866e-7ca9b32aedf4', 2, N'1611eb3d-3d1e-4f11-8154-c31d07c54c5f', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'0c11e7fe-1224-4983-8d58-7deff572bf24', 1, N'92d90d64-382f-4267-8c74-6236137c0293', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'0a69369c-c036-411b-be35-854887b172c4', 3, N'b4750479-9f7a-4c3b-8554-deaac027a1f1', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'6a5473d7-884e-4ed7-b020-85b10cc6f1eb', 1, N'a5a4a7e3-d990-4194-a803-22f00478d212', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'26a599a7-f6bc-4135-bd7e-8731dd19c5db', 1, N'c43d3146-7636-499e-b80d-990922aaaa21', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'01263880-fba6-4f89-b995-8d588770275e', 1, N'4b6e8575-db4b-48f2-9ed3-fee7ba298d6c', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'25d8f26a-ac02-4ad2-b405-8ef76069eae2', 2, N'4b4e4fa3-51d4-4d89-8436-c15efe4ca316', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'6c5094d9-be02-4801-af0b-a7ed96c94db7', 2, N'e4b5d92d-2630-4107-a6ce-74cf4f36fcee', N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'1a515d05-98a7-4d61-b33b-a86136022278', 4, N'c428433b-cb87-4380-8962-07afb7cc485e', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'0adaf6c6-b131-4e91-83f8-a98b03738d6f', 3, N'd181fd80-2198-4415-8285-fbc54acd1e4c', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'a81297ef-6873-4047-b9fe-ac0315d8e8a1', 4, N'f458273a-a059-4441-a2ee-8f6b64d4d982', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'c8818871-aa49-47d0-b297-b0ead8944b40', 4, N'1ae69aa0-b39f-41e5-a830-d3dac3cab159', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'dde321ce-4798-4cbf-817b-b7e7d2a5f501', 2, N'42df6fe9-3c24-4db3-9681-17da1afe5009', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'ad063fc7-0908-48c8-a78b-bf8591697eed', 2, N'42ed47c2-fe4a-4718-8a46-cf53c6b71ec4', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'ae4829a6-0c04-4fb8-b0aa-c0fb287d7b99', 2, N'74db281a-71f7-404c-9cf0-e69527f42d7d', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'b6b90e74-55fe-4987-8d69-cb36e9832a0c', 1, N'27a43861-b208-497d-b6cd-923dae475f13', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'1ff16bc8-75d7-4372-a33b-cd4f6cee4b58', 1, N'880c4b57-2acd-4d23-8cfb-de29f59c8fc9', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'be301eb6-e558-42ac-83f5-d226450fbcc9', 2, N'2ccf3b80-4793-48e2-aa68-44e012159ecf', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'035c9451-fb0e-471d-befd-d875045f46f9', 3, N'e0449827-18d4-4477-8212-616d0afad260', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'13c4c848-074c-488b-9bab-d8f858ee23ba', 1, N'56134f6c-759e-4f74-9edf-7aeeea6f99c7', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'4c01a5cf-ad9f-48d8-8b27-da0950ac19be', 3, N'd1bfe981-a277-47c9-93ec-6a7298fedbb3', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'ed6e22d2-8d20-45db-9e85-db519c3fa6cb', 3, N'a2b3152d-072e-40e9-8e0d-f64441a96a23', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'0f243003-9b51-4350-bffa-e09b51c83600', 2, N'994de29e-08ee-4357-8ab5-1c84ec8be606', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'b567dd28-07d9-4de4-8e1e-e7b95fb45bce', 3, N'8bde7b6f-3848-4369-9f0a-611aca7fb2a7', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'ad4d4c1d-e180-4a86-9bc5-e8f6da0a1e7c', 4, N'a2b3152d-072e-40e9-8e0d-f64441a96a23', N'9d58740d-7927-4d12-98ae-8e447c3c84d2', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'f82f4494-c078-4d5f-8913-ea6b9dae5e48', 2, N'27a43861-b208-497d-b6cd-923dae475f13', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'9e13b8fd-56ee-4f81-9e5b-ecf589d07b39', 4, N'15dcdbb5-7403-42f7-8dde-48215d9e31e0', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'0be67665-9005-4386-b2c5-f4b58b401d34', 2, N'b60050df-b195-49ee-9659-74d3032a6671', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'7a86afa2-9cf3-4a96-8260-f8ba12649d2d', 1, N'47d8e25c-0eb6-4d01-b8b9-2442404ec297', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'c0fc5b0e-6e3a-4827-806a-fa2d592085bf', 3, N'47d8e25c-0eb6-4d01-b8b9-2442404ec297', N'b4a839b9-e283-46c2-830f-938fe50083f1', 1)
INSERT [dbo].[MenuFoodItem] ([Id], [Type], [FoodItemId], [VendorId], [Availability]) VALUES (N'55ca0335-5e97-4190-a0fa-fcf79abca9bf', 4, N'659ab4ce-317b-4b12-ad21-233a1e217890', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', 1)
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [CustomerId], [VenderId], [SubTotal], [ServiceTax], [Vat], [Discount], [Total], [TimeSlot], [Status], [PaymentStatus], [OrderDateTime], [Accepted], [TokenNo]) VALUES (N'1db429d3-06fb-40dd-b811-4ccdf8c91a3c', N'db29d266-81fd-4042-942d-5aea09c6b826', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', CAST(72.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(94.00 AS Decimal(18, 2)), 1, 1, 1, CAST(N'2018-02-02 00:07:07.1787887' AS DateTime2), 1, 2)
INSERT [dbo].[Order] ([Id], [CustomerId], [VenderId], [SubTotal], [ServiceTax], [Vat], [Discount], [Total], [TimeSlot], [Status], [PaymentStatus], [OrderDateTime], [Accepted], [TokenNo]) VALUES (N'a01ebf23-8850-4a7a-bc75-8971818756e5', N'db29d266-81fd-4042-942d-5aea09c6b826', N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', CAST(90.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(112.00 AS Decimal(18, 2)), 1, 0, 0, CAST(N'2018-02-02 00:01:33.5387887' AS DateTime2), 0, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderItem] ([Id], [OrderId], [Price], [Quantity], [FoodItemId]) VALUES (N'204ea736-0a0b-4dd2-a6e3-4ff03e2b5891', N'1db429d3-06fb-40dd-b811-4ccdf8c91a3c', CAST(25.00 AS Decimal(18, 2)), 2, N'659ab4ce-317b-4b12-ad21-233a1e217890')
INSERT [dbo].[OrderItem] ([Id], [OrderId], [Price], [Quantity], [FoodItemId]) VALUES (N'c4f64625-ebd0-4902-a967-c3855a6c4776', N'a01ebf23-8850-4a7a-bc75-8971818756e5', CAST(20.00 AS Decimal(18, 2)), 2, N'866ec0ef-ee43-4c76-b4b1-34e66cbabfd1')
INSERT [dbo].[OrderItem] ([Id], [OrderId], [Price], [Quantity], [FoodItemId]) VALUES (N'fb6afbf4-efa2-4b35-a2f4-d7c8fa9946bb', N'1db429d3-06fb-40dd-b811-4ccdf8c91a3c', CAST(22.00 AS Decimal(18, 2)), 1, N'039b7404-d7d6-46dc-adc6-0504c1c08db3')
INSERT [dbo].[OrderItem] ([Id], [OrderId], [Price], [Quantity], [FoodItemId]) VALUES (N'b4607418-8e98-4021-8433-ee324fba1287', N'a01ebf23-8850-4a7a-bc75-8971818756e5', CAST(25.00 AS Decimal(18, 2)), 2, N'659ab4ce-317b-4b12-ad21-233a1e217890')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [TransactionId], [PaymentVia], [PaymentStatus]) VALUES (N'4dd15e83-e2ba-4654-a2dd-0b167bbd1025', N'1db429d3-06fb-40dd-b811-4ccdf8c91a3c', CAST(94.00 AS Decimal(18, 2)), N'f34639c80b5281ce5e7d', N'PayUMoney', N'success')
INSERT [dbo].[Payment] ([Id], [OrderId], [Amount], [TransactionId], [PaymentVia], [PaymentStatus]) VALUES (N'2af0aa04-0729-449e-aac1-726e148f31ad', N'a01ebf23-8850-4a7a-bc75-8971818756e5', CAST(112.00 AS Decimal(18, 2)), N'1647258012', N'PayUMoney', N'Pending')
INSERT [dbo].[Site] ([Id], [Name], [Address], [Contact], [Owner]) VALUES (N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'Ansal Tower', N'', N'', N'')
INSERT [dbo].[Site] ([Id], [Name], [Address], [Contact], [Owner]) VALUES (N'c92162e9-1f04-45ce-bf09-e16816a4d740', N'DLF Tower Phase 2', N'', N'', N'')
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0', N'Fulwari', N'kavita.singh1218@gmail.com', N'9898989898', N'1234', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'122', N'../../Content/VendorLogo/a8c3d129-8f19-4e4b-b3b6-39f9a8bd8df0_logo.png', 1)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'bfbd3bb7-b1f5-4159-b5bd-5f3cf1fc0869', N'Pizza Hut', N'pizzahut@gmail.com', N'979879', N'1234', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'103', N'../../Content/VendorLogo/467550f3-dc21-46a1-87f4-da935cde4659_logo.png', 1)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'08c3bafb-bc70-4771-8092-87d1e3b5c33b', N'ravi', N'ravi@ravi.com', N'99999999', N'1234', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'123', NULL, 1)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'9d58740d-7927-4d12-98ae-8e447c3c84d2', N'KFC', N'kfc@gmail.com', N'987979877', N'1234', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'104', N'../../Content/VendorLogo/9D58740D-7927-4D12-98AE-8E447C3C84D2_logo.png', 1)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'b4a839b9-e283-46c2-830f-938fe50083f1', N'Taste of China', N'sanjeet1827@gmail.com', N'9899138026', N'1234', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'123', N'../../Content/VendorLogo/467550f3-dc21-46a1-87f4-da935cde4659_logo.png', 1)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'edfdf080-5640-427a-9d00-93f6446be448', N'', N'', N'', N'', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'', NULL, 1)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'21e213c4-c9bb-4f71-8c51-c90def8f4510', N'McDonald', N'mc@gmail.com', N'868687', N'1234', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'105', N'../../Content/VendorLogo/467550f3-dc21-46a1-87f4-da935cde4659_logo.png', 1)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'db085a04-9d46-4bf7-9e63-c92226da05b8', N'Sanjeet Chauhan', N'kavsan1827@gmail.com', N'99999999', N'1234', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'123', NULL, 1)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'467550f3-dc21-46a1-87f4-da935cde4659', N'test', N'test@test.com', N'9899138026', N'12345', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'111', N'../../Content/VendorLogo/467550f3-dc21-46a1-87f4-da935cde4659_logo.png', 0)
INSERT [dbo].[Vendor] ([Id], [Name], [Email], [Contact], [Password], [SiteId], [ShopNo], [Logo], [Active]) VALUES (N'7de0f2d6-8787-4047-851e-f0a8b37e7ba4', N'Dominos', N'dom@gmail.com', N'89889908', N'1234', N'43f88769-aebf-4eb0-be7d-463caf83be3a', N'102', N'../../Content/VendorLogo/467550f3-dc21-46a1-87f4-da935cde4659_logo.png', 1)
ALTER TABLE [dbo].[FoodItem]  WITH CHECK ADD  CONSTRAINT [FK_FoodItem_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[FoodItem] CHECK CONSTRAINT [FK_FoodItem_Vendor]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Vendor] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendor] ([Id])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Vendor]
GO
ALTER TABLE [dbo].[MenuFoodItem]  WITH CHECK ADD  CONSTRAINT [FK_MenuFoodItem_FoodItem] FOREIGN KEY([FoodItemId])
REFERENCES [dbo].[FoodItem] ([Id])
GO
ALTER TABLE [dbo].[MenuFoodItem] CHECK CONSTRAINT [FK_MenuFoodItem_FoodItem]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Order]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Site] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Site] ([Id])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Site]
GO
