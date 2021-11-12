create procedure spShowFeaturedBooks
as 
begin
   select * from BooksSubCategory where FeaturedBooks=convert(bit,1)
end

create procedure spActivatedCoupons
as 
begin
   select * from DiscountCoupons where CouponStatus=convert(bit,1)
end

create procedure spShowSubCategoryWithStatus
as 
begin
   select * from BooksSubCategory where [Status]=convert(bit,1)
end


create procedure spGetCartItemsByUserId
@UserId int
as 
begin
   select * from AddToCart where UserId=@UserId
end

create procedure spGetWhislistItemsByUserId
@UserId int
as 
begin
   select * from WhishList where UserId=@UserId
end

 create procedure spActivateBookss
 @BookId int
 as
  begin 
     update BooksSubCategory
	   set [Status]=convert(bit,1)
	   where Id=@BookId
  end

   create procedure spUpdateQuantityInCart
 @BookId int,
 @Count int
 as
  begin 
     update AddToCart
	   set ItemQuant=@Count
	   where Id=@BookId
  end
  
 create procedure spUpdateBook
 @SubName varchar(200),
 @SubDesc varchar(300),
 @Price int,
 @Photo varchar(MAX),
 @ISBN int,
 @BookId int
 as
  begin 
     update BooksSubCategory
	   set SubName=@SubName,SubDesc=@SubDesc,Price=@Price,Photo=@Photo,ISBN=@ISBN
	   where Id=@BookId
  end



   create procedure spDeleteBook
 @BookId int
 as
  begin 
     Delete From BooksSubCategory
	   where Id=@BookId
  end

     create procedure spDeleteCartBook
 @BookId int
 as
  begin 
     Delete From AddToCart
	   where Id=@BookId
  end

  
     create procedure spDeleteWhislistBook
 @BookId int
 as
  begin 
     Delete From WhishList
	   where Id=@BookId
  end


  create procedure spDeactivateBooks
 @BookId int
 as
  begin 
     update BooksSubCategory
	   set [Status]=convert(bit,0)
	   where Id=@BookId
  end

    create procedure spMakeFeatureBooks
 @BookId int
 as
  begin 
     update BooksSubCategory
	   set FeaturedBooks=convert(bit,1)
	   where Id=@BookId
  end

     create procedure spMakesVisible
 @BookId int
 as
  begin 
     update BooksSubCategory
	   set [Status]=convert(bit,1)
	   where Id=@BookId
  end

      create procedure spMakesHidden
 @BookId int
 as
  begin 
     update BooksSubCategory
	   set [Status]=convert(bit,0)
	   where Id=@BookId
  end

     create procedure spRemoveFromFeatureBooks
 @BookId int
 as
  begin 
     update BooksSubCategory
	   set FeaturedBooks=convert(bit,0)
	   where Id=@BookId
  end

create procedure spShowSubCategoryWithZeroStatus
as 
begin
   select * from BooksSubCategory where [Status]=convert(bit,0)
end

create procedure spCountCartItems
@UserId int
as 
begin
   select COUNT(*) from AddToCart where UserId=@UserId
end

create procedure spCountWhislistItems
@UserId int
as 
begin
   select COUNT(*) from WhishList where UserId=@UserId
end
create procedure spAddCoupon
 @CouponCode varchar(50),
 @CouponDiscount int
as
 begin 
    insert into DiscountCoupons(CouponCode,CouponDiscount) values(@CouponCode,@CouponDiscount)
 end


 create procedure spAddToCartss
 @UserId int,
 @ItemName varchar(200),
 @ItemPrice int,
 @ItemId int,
 @ItemDesc varchar(300),
 @ItemQuantity int
as
 begin 
    insert into AddToCart(UserId,ItemName,ItemPrice,ItemId,ItemDesc,ItemQuant) values(@UserId,@ItemName,@ItemPrice,@ItemId,@ItemDesc,@ItemQuantity)
 end

 create procedure spAddsToWhislistss
 @UserId int,
 @ItemName varchar(200),
 @ItemPrice int,
 @ItemId int,
 @ItemDesc varchar(300)

as
 begin 
    insert into WhishList(UserId,ItemName,ItemPrice,ItemId,ItemDesc) values(@UserId,@ItemName,@ItemPrice,@ItemId,@ItemDesc)
 end



create procedure spAddBookTitle
  @BookTitle varchar(200)
as
 begin
    insert into BooksTitle(Title) values(@BookTitle)
 end
 
create procedure spAddBookCategory
  @CatId int,
  @CatName varchar(200)
as
 begin 
    insert into BooksCategory(CatId,CatName) values (@CatId,@CatName) 
 end

 create procedure spAddBooksSubCategory
 (@CatId int,
  @SubId int,
  @SubName varchar(200),
  @SubDesc varchar(300),
  @Price int,
  @Photo varchar(MAX),
  @ISBN int,
  @BookId int Out
  )
as
 begin 
    insert into BooksSubCategory(CatId,SubId,SubName,SubDesc,Price,Photo,ISBN) values (@CatId,@SubId,@SubName,@SubDesc,@Price,@Photo,@ISBN)
	select @BookId=SCOPE_IDENTITY()
 end

 create procedure spGetBookTitle
 as 
  begin
     select * from BooksTitle
  end

  create procedure spGetBookCategory
 as 
  begin
     select * from BooksCategory
  end
  create procedure spGetBooksSubCategory
 as 
  begin
     select * from BooksSubCategory
  end

  create procedure spGetBooksCategoryById
   @Id int
 as 
  begin
     select * from BooksCategory where Id=@Id
  end

   create procedure spGetBooksCategoryByCatId
   @Id int
 as 
  begin
     select * from BooksCategory where CatId=@Id
  end

create procedure spGetBooksSubCategoryById
   @Id int
 as 
  begin
     select * from BooksSubCategory where Id=@Id
  end



create procedure spGetBooksSubCategoryByCatId
   @Id int
 as 
  begin
     select * from BooksSubCategory where CatId=@Id
  end


create procedure spGetBooksSubCategoryBySubId
   @Id int
 as 
  begin
     select * from BooksSubCategory where SubId=@Id
  end


create procedure spGetBooksSubCategoryAlphabatically
 as 
  begin
     select * from BooksSubCategory order by SubName
  end

create procedure spGetBooksSubCategorybyPriceIncrease
 as 
  begin
     select * from BooksSubCategory order by Price ASC
  end

create procedure spGetBooksSubCategorybyPriceDecrease
 as 
  begin
     select * from BooksSubCategory order by Price DESC
  end
















create procedure spAddApplicationUsers
(
@UserName varchar(100),
@UserGender varchar(10),
@UserContact varchar(100),
@UserEmail varchar(100),
@UserPassword varchar(100),
@UserId int Out
)
as
  begin
    insert 
	into 
	 ApplicationUser 
	(
	ApplicationUserName,
	Gender,
	ApplicationUserContact,
	ApplicationUserEmail,
	AppliactionUserPassword
	)
	values
	(
	@UserName,
	@UserGender,
	@UserContact,
	@UserEmail,
	@UserPassword
	)
	select @UserId=SCOPE_IDENTITY()
  end

create procedure spUserOrderInfo
(
@UserId int,
@ItemName varchar(200),
@ItemCatId int,
@ItemSubId int,
@ItemId int,
@ItemPrice int,
@ItemPhoto varchar(MAX),
@ItemShipAddressId int,
@CouponApplied bit,
@PriceAfterDiscount int,
@OrderId int Out
)
as
 begin
   insert into 
   UserOrders
   (
   ApplicationUserId,
   ItemName,
   ItemCatId,
   ItemSubId,
   ItemId,
   ItemPrice,
   ItemPhoto,
   ItemShipAddressId,
   CouponApplied,
   PriceAfterDiscount
   )
   values
   (@UserId,@ItemName,@ItemCatId,@ItemSubId,@ItemId,@ItemPrice,@ItemPhoto,@ItemShipAddressId,@CouponApplied,@PriceAfterDiscount)
   select @OrderId=SCOPE_IDENTITY();
 end

 create procedure spDeactivateUser
 @UserId int
 as
  begin 
     update ApplicationUser
	   set ApplicationUserStatus=convert(bit,0)
	   where ApplicationUserId=@UserId
  end

  create procedure spActivateUser
 @UserId int
 as
  begin 
     update ApplicationUser
	   set ApplicationUserStatus=convert(bit,1)
	   where ApplicationUserId=@UserId
  end


   create procedure spLoginAdmin
 @UserName varchar(100),
 @pass varchar(100)
 as
  begin 
     select* from AdminDetails
	   where (UserName=@UserName and pass=@pass)
  end

     create procedure spLoginUser
 @UserName varchar(100),
 @pass varchar(100)
 as
  begin 
     select* from ApplicationUser
	   where (ApplicationUserName=@UserName and AppliactionUserPassword=@pass and ApplicationUserStatus=convert(bit,1) )
  end

create procedure spGetApplicationUserList
as
 begin
   select 
    ApplicationUserId,
    ApplicationUserName,
	ApplicationUserEmail,
    Gender,
    ApplicationUserContact,
    ApplicationUserStatus
  from ApplicationUser
 end

 create procedure spGetBlockedApplicationUserList
as
 begin
   select 
    ApplicationUserId,
    ApplicationUserName,
	ApplicationUserEmail,
    Gender,
    ApplicationUserContact,
    ApplicationUserStatus
  from ApplicationUser
  where ApplicationUserStatus=convert(bit,0)
 end

create procedure spShowCoupons
as
 begin 
   select * from DiscountCoupons
 end
  
create procedure spGetCouponbyId
@CouponId int
as
 begin
  select * from DiscountCoupons where CouponId=@CouponId
 end

create procedure spDeactivateCouponbyId
@CouponId int
as 
  begin
   update DiscountCoupons
   set CouponStatus=convert(bit,0)
   where CouponId=@CouponId
 end

 create procedure spDeactivateCouponbyCouponCode
@CouponCode varchar(100)
as 
  begin
   update DiscountCoupons
   set CouponStatus=convert(bit,0)
   where CouponCode=@CouponCode and CouponStatus=convert(bit,1)
 end



 create procedure spDeactivateCouponbybyCouponCode
@CouponCode varchar(100)
as 
  begin
   update DiscountCoupons
   set CouponStatus=convert(bit,0)
   where CouponCode=@CouponCode and CouponStatus=convert(bit,1)
 end

 create procedure spActivateCouponbybyCouponCode
@CouponCode varchar(100)
as 
  begin
   update DiscountCoupons
   set CouponStatus=convert(bit,1)
   where CouponCode=@CouponCode
 end

  create procedure spActivateCouponbyCouponCode
@CouponCode varchar(100)
as 
  begin
   update DiscountCoupons
   set CouponStatus=convert(bit,1)
   where CouponCode=@CouponCode and CouponStatus=convert(bit,0)
 end

create procedure spActivateCouponbyId
@CouponId int
as 
  begin
   update DiscountCoupons
   set CouponStatus=convert(bit,1)
   where CouponId=@CouponId
 end

create procedure spActivateFeaturedBooks