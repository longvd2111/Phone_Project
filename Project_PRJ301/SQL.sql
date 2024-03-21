/*create database Phone_Project
go
use Phone_Project*/

go
-- Tạo bảng Danh mục (Categories)
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name NVARCHAR(255)
);

go

-- Tạo bảng Shipping
	CREATE TABLE Shipping(
	shipping_ID INT PRIMARY KEY IDENTITY (1,1),
	[name] NVARCHAR(255),
	[phone] NVARCHAR(255),
	[address] NVARCHAR(255)
	
	)

-- Tạo bảng Người dùng (Users)
CREATE TABLE Users (
    user_id INT identity(1,1) PRIMARY KEY,
    username NVARCHAR(50),
    password NVARCHAR(100) ,
    full_name NVARCHAR(100),
    phone_number NVARCHAR(20),
	isAdmin INT,
	isSell INT,
	active INT,

);
go
-- Tạo bảng Sản phẩm (Products)
CREATE TABLE Products (
    product_id INT identity(1,1) PRIMARY KEY,
    product_name NVARCHAR(255),
    description NVARCHAR(MAX),
    price DECIMAL(10, 2),
	memory INT,
    image_url NVARCHAR(255),
    stock_quantity INT,
	category_id INT FOREIGN KEY (category_id) REFERENCES Categories(category_id),
	user_id INT FOREIGN KEY (user_id) REFERENCES Users (user_id)

);


go



-- Tạo bảng Đơn hàng (Orders)
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users (user_id),
	shipping_ID INT FOREIGN KEY (shipping_ID) REFERENCES Shipping (shipping_ID),
	 isAccept int,
	 isEdited int
);


go


-- Tạo bảng Chi tiết đơn hàng (OrderDetails)
CREATE TABLE OrderDetails (
    order_detail_id INT identity(1,1) PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders (order_id),
    FOREIGN KEY (product_id) REFERENCES Products (product_id)
);

go
INSERT INTO Categories(category_id, category_name) VALUES (1, N'Apple')
INSERT INTO Categories(category_id, category_name) VALUES (2, N'Samsung')
INSERT INTO Categories(category_id, category_name) VALUES (3, N'XiaoMi')
GO
	INSERT INTO Users (username, password, full_name,  phone_number, isAdmin,isSell,active)
VALUES
	('admin', 'admin',  'admin',  '123-456-7890', 1,1,1),
	('iphone', 'iphone',  'Iphone',  '123-456-7890', 0,1,1),
	('samsung', 'samsung',  'Samsung',  '123-456-7891', 0,1,1),
	('xiaomi', 'xiaomi',  'Xiaomi',  '123-456-7892', 0,1,1),
    ('long123', 'tu1den10',  'Long Vu',  '555-123-4567', 0,0,1),
    ('longdca', 'long2111',  'Long Nguyen',  '555-987-6543', 0,0,1),
    ('duymca', '12345678',  'Duy Nguyen',  '555-555-5555', 0,0,1),
    ('chubba', 'asdfghjkl',  'A Van B',  '555-333-8888', 0,0,1),
    ('bobbye', '88888888',  'C Wilson'  , '555-111-2222', 0,0,0),
	('chubedan', 'taokhongngu',  'Bing Bong',  '555-111-2222', 0,0,0);
	go
INSERT INTO Products ( product_name, description, price, memory, image_url, stock_quantity, category_id,user_id)
VALUES
     ('iPhone 15 Promax ','New Iphone model | Elevate your world with iPhone', 1600,  1024, 'https://cdn.tgdd.vn/Products/Images/42/305660/iphone-15-pro-max-blue-thumbnew-600x600.jpg	', 50, 1,2),
	( 'iPhone 15 Pro ', 'New Iphone model | Experience excellence with every touch', 1500,  1024, 'https://cdn.tgdd.vn/Products/Images/42/303833/iphone-15-pro-blue-thumbnew-600x600.jpg', 50, 1,2),
	( 'iPhone 15 Promax ', 'New Iphone model | Elevate your world with iPhone', 1499,  512, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-pro-max_5.png', 50, 1,2),
	( 'iPhone 15 Pro', 'New Iphone model | Experience excellence with every touch', 1450,  512, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS03iFVboVuk0EHzJ6kS6Ubj3px8NFTCPKMgowcgUpVy_5CHNl8iwEewxEP_s5njfKsZQaQ2uzmpuyeKqVdu5KZlaxz1kzn6jRr9MyZlJOby3AG9P-phNACuIANPGgM2g&usqp=CAc', 30, 1,2),
	( 'iPhone 15 Promax', 'New Iphone model | Elevate your world with iPhone', 1400,  256, 'https://cdn.tgdd.vn/Products/Images/42/305659/iphone-15-pro-max-black-thumbnew-600x600.jpg', 30, 1,2),
    ( 'iPhone 15 Plus', 'New Iphone model | Elevate your mobile experience', 1350,  512, 'https://cdn.tgdd.vn/Products/Images/42/303891/iphone-15-plus-128gb-xanh-thumb-600x600.jpg', 30, 1,2),
    ( 'iPhone 14 Promax', 'Another iPhone | Where technology meets elegance ', 1350,  256, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-14-pro-max-256gb.png', 20, 1,2),
	( 'iPhone 15 ', 'New Iphone model | Elevate your mobile experience', 1350,  512, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-plus-256gb_5.png', 20, 1,2),
	( 'iPhone 15 Plus', 'New Iphone model | Elevate your mobile experience', 1350,  256, 'https://cdn.tgdd.vn/Products/Images/42/303716/iphone-15-xanh-la-thumb-600x600.jpg', 20, 1,2),
	( 'iPhone 12 Promax', 'Another iPhone | Effortlessly blend technology and fashion', 1250,  256, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/2/_/2_240_2.jpg', 20, 1,2),
    ( 'iPhone 13 Pro Max', 'Another iPhone | Simplicity and sophistication', 1300,  256, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-13-pro-max-256gb.png', 10, 1,2),
	( 'iPhone 14 Pro ', 'Another iPhone | Where technology meets elegance ', 1200,  128, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-14-pro_2__4.png', 10, 1,2),
	( 'iPhone 13 Pro Max', 'Another iPhone |Simplicity and sophistication', 1200,  128, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-13-pro-max.png', 10, 1,2),

	( 'Samsung Galaxy Z Fold 5', 'New SamSung | Elevate your Samsung experience', 2099,  1024, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-z-fold-5-256gb_1.png', 20, 2,3),
	( 'Samsung Galaxy Z Fold 5', 'New SamSung | Elevate your Samsung experience', 1800,  256, 'https://cdn2.cellphones.com.vn/358x/media/catalog/product/g/a/galaxy-z-fold-5-kem-1_1.jpg', 10, 2,3),
	( 'Samsung Galaxy S23 Ultra', 'New SamSung', 1499,  512, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-s23-ultra-12gb-512gb.png', 10, 2,3),
	( 'Samsung Galaxy S22 Ultra', 'Innovation at your fingertips with Samsung', 1499,  512, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_burgundy_211119_3.jpg', 10, 2,3),
	( 'Samsung Galaxy Z Flip 5', 'Samsung | Where style meets technology', 1099,  256, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-z-flip-5-256gb_1_4.png', 10, 2,3),
	( 'Samsung Galaxy Z Filp 3', 'Timeless elegance, enduring performance.', 1000,  128, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/8/0/800x800_flip_3_cream.png', 10, 2,3),
	( 'Samsung Galaxy Z Fold 4', 'A touch of nostalgia with modern functionality', 1049,  512, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-z-fold-4_1.png', 10, 2,3),
	( 'Samsung Galaxy Note 20 Ultra 5G', 'Discover the future with Samsung', 1391,  256, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-note-20-ultra-5g.png', 10, 2,3),
	
	( 'Xiaomi 13 Pro', 'Elevate your connectivity and style', 999,  256, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/1/3/13_prooo_2.jpg', 10, 3,4),
	( 'Xiaomi 13', 'Elevate your connectivity and style', 900,  256, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1670745783.80967984.png', 10, 3,4),
	( 'Xiaomi 12 T ', 'Elevate your connectivity and style', 499,  512, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-mi-12t.png', 10, 3,4),
	( 'Xiaomi 13 T', 'Elevate your connectivity and style', 599,  256, 'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-13t_1_2.png', 10, 3,4),
	( 'Xiaomi 13 T Pro', 'New Xiaomi | Unleash the power of innovation in your hands', 849,  128, 'https://cdn.mobilecity.vn/mobilecity-vn/images/2023/09/w300/xiaomi-13t-pro-xanh-duong.jpg.webp', 10, 3,4)

	go




