create database BooksDataBase
use BooksDataBase
create table BooksTitle
(
BookId int NOT NULL identity(1,1),
Title varchar(200) NOT NULL,
PublishDate DATETIME NOT NULL DEFAULT GETDATE(),
PRIMARY KEY(BookId)
)
create table BooksCategory
(
Id int NOT NULL identity(1,1),
CatId int NOT NULL,
CatName varchar(200) NOT NULL,
PublishDate DATETIME NOT NULL DEFAULT GETDATE(),
[Status] BIT NOT NULL DEFAULT CONVERT(BIT,1),
primary key(Id),
foreign key(CatId) references BooksTitle(BookId)
)
create table BooksSubCategory
(
Id int NOT NULL identity(1,1),
CatId int NOT NUll,
SubId int NOT NULL,
SubName varchar(200) not null,
SubDesc varchar(300) not null,
Price int not null,
Photo varchar(MAX) not null,
[Status] BIT not null default convert(BIT,1),
UploadedOn datetime not null default getdate(),
ISBN int not null,
FeaturedBooks bit not null default convert(bit,0)
primary key(Id),
foreign key(CatId) references BooksTitle(BookId),
foreign key(SubId) references BooksCategory(Id)
)
create table ApplicationUser
(
ApplicationUserId int not null identity(1,1),
ApplicationUserName varchar(100) not null,
ApplicationUserFirstName varchar(100) not null,
ApplicationUserLastName varchar(100) default null,
ApplicationUserContact varchar(100) not null,
ApplicationUserEmail varchar(100) not null,
AppliactionUserPassword varchar(100) not null,
ApplicationUserStatus bit default convert(bit,1),
primary key(ApplicationUserId)
)
create table ApplicationUserAddress
(
AddressId int not null identity(1,1),
ApplicationUserId int not null,
ApplicationUserHouseAddress varchar(300) not null,
AppliactionUserPinCode int not null,
ApplicationUserCity varchar(100) not null,
AppliactionUserState varchar(100) not null,
primary key(AddressId),
foreign key(ApplicationUserId) references ApplicationUser(ApplicationUserId)
)
create table UserOrders
(
OrderId int not null identity(1,1),
ApplicationUserId int not null,
ItemName varchar(200) not null,
ItemCatId int not null,
ItemSubId int not null,
ItemId int not null,
ItemPrice int not null,
ItemPhoto varchar(MAX),
ItemShipAddressId int not null,
CouponApplied bit not null default convert(bit,0),
PriceAfterDiscount int not null,
OrderDate DATETIME not null default getdate(),
primary key(OrderId),
foreign key(ApplicationUserId) references ApplicationUser(ApplicationUserId),
foreign key(ItemShipAddressId) references ApplicationUserAddress(AddressId)
)
create table AddToCart
(
Id int not null identity(1,1),
UserId int not null,
ItemName varchar(200) not null,
ItemPrice int not null,
ItemId int not null,
ItemDesc varchar(300) not null,
AddedOn datetime not null default getdate(),
primary key(Id),
foreign key(UserId) references ApplicationUser(ApplicationUserId)
)
create table WhishList
(
Id int not null identity(1,1),
UserId int not null,
ItemName varchar(200) not null,
ItemPrice int not null,
ItemId int not null,
ItemDesc varchar(300) not null,
AddedOn datetime not null default getdate(),
primary key(Id),
foreign key(UserId) references ApplicationUser(ApplicationUserId)

)
create table DiscountCoupons
(
CouponId int not null identity(1,1),
CouponCode varchar(100) not null,
CouponDiscount int not null,
CouponStatus bit not null default convert(bit,1),
primary key(CouponId),
)
alter table DiscountCoupon
alter column CouponStatus bit not null default convert(bit,1)
