
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/29/2018 14:53:16
-- Generated from EDMX file: C:\Users\Sunil\Downloads\EnterInsideShooping\EnterInsideShooping\EnterInsideShooping\Models\EnterInsideShopping.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Greenery];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_News_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[News] DROP CONSTRAINT [FK_News_User];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Order];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderDetail_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Color]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Color];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Model]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Model];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Storage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Storage];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Color]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Color];
GO
IF OBJECT_ID(N'[dbo].[Model]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Model];
GO
IF OBJECT_ID(N'[dbo].[News]', 'U') IS NOT NULL
    DROP TABLE [dbo].[News];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[OrderDetail]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderDetail];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[Storage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Storage];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NULL
);
GO

-- Creating table 'Colors'
CREATE TABLE [dbo].[Colors] (
    [ColorId] int IDENTITY(1,1) NOT NULL,
    [Color1] nvarchar(50)  NULL
);
GO

-- Creating table 'Models'
CREATE TABLE [dbo].[Models] (
    [ModelId] int IDENTITY(1,1) NOT NULL,
    [Model1] nvarchar(50)  NULL
);
GO

-- Creating table 'News'
CREATE TABLE [dbo].[News] (
    [NewsId] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NULL,
    [Title] nvarchar(250)  NULL,
    [ShortDescription] nvarchar(500)  NULL,
    [Content] nvarchar(max)  NULL,
    [CreatedDate] datetime  NULL,
    [Status] int  NULL,
    [Images] nvarchar(250)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [OrderName] nvarchar(50)  NULL,
    [OrderDate] datetime  NULL,
    [PaymentType] nvarchar(50)  NULL,
    [Status] nvarchar(50)  NULL,
    [CustomerName] nvarchar(50)  NULL,
    [CustomerPhone] nvarchar(50)  NULL,
    [CustomerEmail] nvarchar(50)  NULL,
    [CustomerAddress] nvarchar(250)  NULL
);
GO

-- Creating table 'OrderDetails'
CREATE TABLE [dbo].[OrderDetails] (
    [OrderID] int  NOT NULL,
    [ProductID] int  NOT NULL,
    [Price] float  NULL,
    [Quantity] int  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [ProductName] nvarchar(250)  NULL,
    [Image] nvarchar(500)  NULL,
    [UserId] int  NULL,
    [CategoryId] int  NULL,
    [ColorId] int  NULL,
    [ModelId] int  NULL,
    [StorageId] int  NULL,
    [SellStartDate] datetime  NULL,
    [SellEndDate] datetime  NULL,
    [IsNew] int  NULL,
    [Price] float  NULL
);
GO

-- Creating table 'Storages'
CREATE TABLE [dbo].[Storages] (
    [StorageId] int IDENTITY(1,1) NOT NULL,
    [Storage1] nvarchar(50)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(50)  NULL,
    [Password] nvarchar(50)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [ColorId] in table 'Colors'
ALTER TABLE [dbo].[Colors]
ADD CONSTRAINT [PK_Colors]
    PRIMARY KEY CLUSTERED ([ColorId] ASC);
GO

-- Creating primary key on [ModelId] in table 'Models'
ALTER TABLE [dbo].[Models]
ADD CONSTRAINT [PK_Models]
    PRIMARY KEY CLUSTERED ([ModelId] ASC);
GO

-- Creating primary key on [NewsId] in table 'News'
ALTER TABLE [dbo].[News]
ADD CONSTRAINT [PK_News]
    PRIMARY KEY CLUSTERED ([NewsId] ASC);
GO

-- Creating primary key on [OrderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [OrderID], [ProductID] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [PK_OrderDetails]
    PRIMARY KEY CLUSTERED ([OrderID], [ProductID] ASC);
GO

-- Creating primary key on [ProductId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- Creating primary key on [StorageId] in table 'Storages'
ALTER TABLE [dbo].[Storages]
ADD CONSTRAINT [PK_Storages]
    PRIMARY KEY CLUSTERED ([StorageId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_Category]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Category'
CREATE INDEX [IX_FK_Product_Category]
ON [dbo].[Products]
    ([CategoryId]);
GO

-- Creating foreign key on [ColorId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_Color]
    FOREIGN KEY ([ColorId])
    REFERENCES [dbo].[Colors]
        ([ColorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Color'
CREATE INDEX [IX_FK_Product_Color]
ON [dbo].[Products]
    ([ColorId]);
GO

-- Creating foreign key on [ModelId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_Model]
    FOREIGN KEY ([ModelId])
    REFERENCES [dbo].[Models]
        ([ModelId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Model'
CREATE INDEX [IX_FK_Product_Model]
ON [dbo].[Products]
    ([ModelId]);
GO

-- Creating foreign key on [UserId] in table 'News'
ALTER TABLE [dbo].[News]
ADD CONSTRAINT [FK_News_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_News_User'
CREATE INDEX [IX_FK_News_User]
ON [dbo].[News]
    ([UserId]);
GO

-- Creating foreign key on [OrderID] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_OrderDetail_Order]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductID] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_OrderDetail_Product]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Products]
        ([ProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetail_Product'
CREATE INDEX [IX_FK_OrderDetail_Product]
ON [dbo].[OrderDetails]
    ([ProductID]);
GO

-- Creating foreign key on [StorageId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_Storage]
    FOREIGN KEY ([StorageId])
    REFERENCES [dbo].[Storages]
        ([StorageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Storage'
CREATE INDEX [IX_FK_Product_Storage]
ON [dbo].[Products]
    ([StorageId]);
GO

-- Creating foreign key on [UserId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_User'
CREATE INDEX [IX_FK_Product_User]
ON [dbo].[Products]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------