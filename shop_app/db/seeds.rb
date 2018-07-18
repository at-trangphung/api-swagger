# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Size.create!(name: "500ml")
Size.create!(name: "250ml")
Size.create!(name: "100ml")

Type.create!(name: "Hot")
Type.create!(name: "Cold")
Type.create!(name: "Less Sugar")
Type.create!(name: "More Sugar")

Category.create!(name: "Coffee", parent_id: 0, sort_order:0)#1
Category.create!(name: "Water", parent_id: 0, sort_order:0)#2
Category.create!(name: "Coffee Milk", parent_id: 1, sort_order:0)#3
Category.create!(name: "Espresso", parent_id: 1, sort_order:0)#4
Category.create!(name: "Juice", parent_id: 2, sort_order:0)#5
Category.create!(name: "Carbonated water", parent_id: 2, sort_order:0)#6
Category.create!(name: "Soda", parent_id: 2, sort_order:0)#7
Category.create!(name: "Yogurt", parent_id: 2, sort_order:0)#8
Category.create!(name: "Tea", parent_id: 2, sort_order:0)#9

Product.create!(category_id: 3, name:"Coffee Milk", description:"", discount:0, image_link:"coffee_sua",
  like: 0 )#1
Product.create!(category_id: 3, name:"Coffee Milk SG", description:"", discount:0, image_link:"coffee_sua_sai_gon",
  like: 0 )#2
Product.create!(category_id: 4, name:"Coffee latte", description:"", discount:0, image_link:"latte",
  like: 0 )#3
Product.create!(category_id: 4, name:"Coffee matcha", description:"", discount:0, image_link:"matcha",
  like: 0 )#4
Product.create!(category_id: 4, name:"Coffee capuccino", description:"", discount:0, image_link:"capuccino",
  like: 0 )#5
Product.create!(category_id: 6, name:"7 up", description:"", discount:0, image_link:"7_up",
  like: 0 )#6
Product.create!(category_id: 6, name:"Pepsi", description:"", discount:0, image_link:"pepsi",
  like: 0 )#7
Product.create!(category_id: 6, name:"Cocacola", description:"", discount:0, image_link:"cocacola",
  like: 0 )#8
Product.create!(category_id: 5, name:"Lemon", description:"", discount:0, image_link:"lemon",
  like: 0 )#9
Product.create!(category_id: 5, name:"Orange", description:"", discount:0, image_link:"orange",
  like: 0 )#10
Product.create!(category_id: 5, name:"Stawbery", description:"", discount:0, image_link:"strawberry_juice",
  like: 0 )#11
Product.create!(category_id: 7, name:"Soda orange", description:"", discount:0, image_link:"soda_orange",
  like: 0 )#12
Product.create!(category_id: 7, name:"Soda blueberries", description:"", discount:0, image_link:"soda_blueberries",
  like: 0 )#13
Product.create!(category_id: 8, name:"Yogurt", description:"", discount:0, image_link:"yogurt", like: 0 )
#14
Product.create!(category_id: 8, name:"Yogurt milk", description:"", discount:0, image_link:"milk_yogurt", like: 0 )
#15
Product.create!(category_id: 8, name:"Yogurt strawberry", description:"", discount:0, image_link:"strawberry_yogurt", like: 0 )
#16
Product.create!(category_id: 9, name:"Lipton tea", description:"", discount:0, image_link:"lipton_tea", like: 0 )
#17
Product.create!(category_id: 9, name:"Olong tea", description:"", discount:0, image_link:"olong_tea", like: 0 )
#18
Product.create!(category_id: 9, name:"Ginger tea", description:"", discount:0, image_link:"ginger_tea", like: 0 )
#19
Product.create!(category_id: 9, name:"Lemon tea", description:"", discount:0, image_link:"lemon_tea", like: 0 )
#20
Product.create!(category_id: 9, name:"Peach tea", description:"", discount:0, image_link:"peach_tea", like: 0 )
#21

ProductOption.create!(product_id: 1, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 1, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 1, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 1, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 1, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 1, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 1, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 1, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 1, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 1, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 1, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 1, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 2, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 2, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 2, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 2, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 2, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 2, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 2, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 2, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 2, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 2, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 2, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 2, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 3, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 3, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 3, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 3, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 3, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 3, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 3, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 3, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 3, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 3, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 3, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 3, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 4, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 4, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 4, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 4, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 4, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 4, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 4, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 4, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 4, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 4, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 4, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 4, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 5, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 5, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 5, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 5, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 5, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 5, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 5, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 5, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 5, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 5, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 5, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 5, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 6, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 6, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 6, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 6, size_id: 3 ,type_id: 2, price:1)

ProductOption.create!(product_id: 7, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 7, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 7, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 7, size_id: 3 ,type_id: 2, price:1)

ProductOption.create!(product_id: 8, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 8, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 8, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 8, size_id: 3 ,type_id: 2, price:1)

ProductOption.create!(product_id: 9, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 9, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 9, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 9, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 9, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 9, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 9, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 9, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 9, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 9, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 9, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 9, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 10, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 10, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 10, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 10, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 10, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 10, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 10, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 10, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 10, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 10, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 10, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 10, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 11, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 11, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 11, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 11, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 11, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 11, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 11, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 11, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 11, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 11, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 11, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 11, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 12, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 12, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 12, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 12, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 12, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 12, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 12, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 12, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 12, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 12, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 12, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 12, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 13, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 13, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 13, size_id: 1 ,type_id: 3, price:3)
ProductOption.create!(product_id: 13, size_id: 1 ,type_id: 4, price:3)
ProductOption.create!(product_id: 13, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 13, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 13, size_id: 2 ,type_id: 3, price:2)
ProductOption.create!(product_id: 13, size_id: 2 ,type_id: 4, price:2)
ProductOption.create!(product_id: 13, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 13, size_id: 3 ,type_id: 2, price:1)
ProductOption.create!(product_id: 13, size_id: 3 ,type_id: 3, price:1)
ProductOption.create!(product_id: 13, size_id: 3 ,type_id: 4, price:1)

ProductOption.create!(product_id: 14, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 14, size_id: 2 ,type_id: 2, price:3)
ProductOption.create!(product_id: 14, size_id: 3 ,type_id: 2, price:3)

ProductOption.create!(product_id: 15, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 15, size_id: 2 ,type_id: 2, price:3)
ProductOption.create!(product_id: 15, size_id: 3 ,type_id: 2, price:3)

ProductOption.create!(product_id: 16, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 16, size_id: 2 ,type_id: 2, price:3)
ProductOption.create!(product_id: 16, size_id: 3 ,type_id: 2, price:3)

ProductOption.create!(product_id: 17, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 17, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 17, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 17, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 17, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 17, size_id: 3 ,type_id: 2, price:1)

ProductOption.create!(product_id: 18, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 18, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 18, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 18, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 18, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 18, size_id: 3 ,type_id: 2, price:1)

ProductOption.create!(product_id: 19, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 19, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 19, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 19, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 19, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 19, size_id: 3 ,type_id: 2, price:1)

ProductOption.create!(product_id: 20, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 20, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 20, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 20, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 20, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 20, size_id: 3 ,type_id: 2, price:1)

ProductOption.create!(product_id: 21, size_id: 1 ,type_id: 1, price:3)
ProductOption.create!(product_id: 21, size_id: 1 ,type_id: 2, price:3)
ProductOption.create!(product_id: 21, size_id: 2 ,type_id: 1, price:2)
ProductOption.create!(product_id: 21, size_id: 2 ,type_id: 2, price:2)
ProductOption.create!(product_id: 21, size_id: 3 ,type_id: 1, price:1)
ProductOption.create!(product_id: 21, size_id: 3 ,type_id: 2, price:1)


Article.create!(title:"Bí mật phía sau quầy bar của quán cafe LITTLE OWL",
image_link: "blog1", 
content:"Little Owl Coffee toạ lạc tại quận Denver của thành phố Colorado, Hoa Kỳ. Càng ngày càng có nhiều hành khách, khách du lịch tới tham quan Denver làm khu vực này ngày càng trở nên sôi động. Mặc dù đã có rất nhiều quán cafe lâu đời, quận Denver vẫn không có một cửa hiệu cafe nào thuộc làn sóng thứ 3 cho tới khi Seanna Forey mở Little Owl trên phố Blake."
)
Article.create!(title:"Bí mật phía sau quầy bar của quán cafe HOUNDSTOOTH",
image_link: "blog2",  
content:"DALLAS, TEXAS
Quán cafe Houndstooth được Sean Henry lấy cảm hứng từ một truyền thống lâu đời của Texas : Mọi người thích ăn thịt mới nướng, đôi khi họ phải chờ đợi hàng giờ để có thịt nướng của mình.
“Tại những nơi tôi yêu thích, khách hàng có thể đợi tới hàng giờ, nhưng sau đó họ sẽ cắt thịt nướng ngay trước mặt bạn”, người sáng lập Houndstooth Coffee nói. “Họ sẽ hỏi bạn nếu bạn muốn phần thịt có mỡ, hoặc thịt nạc, hoặc phần vừa chín tới”. Và Henry xây dựng một không gian mở để khách hàng có thể quan sát mọi thứ. Henry tạo ra một thiết kế gắn chặt với thiên nhiên.
Một lượng gỗ lớn “trôi” trên trần nhà mà Henry mô tả là những đám mây. 
Nó cũng cung cấp ánh sáng trắng thay thế cho mặt trời, kết hợp với những cửa sổ rộng lớn thu hút ánh sáng tự nhiên. Những cửa sổ này cũng cho một cái nhìn trực tiếp tới hàng cây bên ngoài. Henry cũng thiết kế một khu vực ngồi đợi để cho 
những khách hàng vội vã mua cafe mang đi – và tất nhiên khu vực này “chiếu thẳng” vào quầy bar để khách hàng có thể thấy barista biểu diễn pha chế thức uống của mình.",
)
Article.create!(title:"Cách Pha Cafe Espresso Không Cần Dùng Máy",
image_link: "article_coffee_house",
content:"Có thể pha espresso mà không cần dùng máy espresso không?
Nếu bạn từng “khao khát” một tách espresso ngon lành trong không gian bình yên, dễ chịu của ngôi nhà mình, bạn chắc hẳn sẽ khao khát một chiếc máy espresso bóng bẩy bằng thép không gỉ. Với những chiếc máy đó, mức đầu tư khá cao, và bạn có thể sẽ chùn bước khi thấy giá của nó. Nhưng luôn có hy vọng dành cho bạn: Bạn hoàn toàn có thể pha espresso mà không cần một chiếc máy xa xỉ!
Trong khi việc sử dụng một chiếc máy espresso truyền thống gần như là cách tốt nhất để tạo ra những tách espresso chuẩn mực qua bàn tay của các barista, bạn vẫn có thể tự pha ra những shot cafe vô cùng đậm đà có vị chẳng khác espresso chính hiệu là mấy. Tất cả những gì bạn cần là một vài thiết bị (có mức dưới 30$), một kỹ thuật pha đúng, một tỷ lệ cafe – nước thích hợp, 
và một vài công thức pha cafe đơn giản nếu bạn muốn có những tách cafe ngọt ngào hơn với sữa và các hương vị.
Cafe espresso là gì?  
Một tách espresso có 3 yếu tố tác động quan trọng nhất: Độ rang của cafe, độ mịn của bột cafe, áp suất dùng để pha cafe. Bằng cách tập trung vào 3 yếu tố này và làm tốt nhất có thể, bạn có thể chiết xuất ra một tách espresso bằng tay mà không cần dùng máy pha espresso."
)
Article.create!(title:"Những điều cần biết trước khi mua máy pha cafe espresso Breville 870XL",
image_link: "ca_phe_chay",
content:"Bạn muốn mua máy cafe Breville 870XL ? Bạn thấy quá nhiều mức giá khác nhau ? Bạn phân vân không biết nên mua máy cafe cũ hay mới ? Bạn lo lắng máy Breville 870XL có bền không ? Công suất có đủ không ? Có cần đi học pha chế không ?…
Việc đầu tư máy pha cafe espresso Breville 870XL hoặc các dòng máy espresso khác đã trở nên phổ biến. Cafe pha bằng máy espresso đậm đà hơn cafe pha bằng phin. Việc mua máy cũng rất dễ dàng vì có nhiều nhà cung cấp. Nên chuyện “đầu tư” không phải là một chuyện rủi ro, nó trở thành một điều bắt buộc nếu bạn muốn bán cafe lâu dài.
Bài viết này tập trung vào các vấn đề liên quan tới máy pha cafe Breville 870XL. Đây là dòng máy cafe espresso nhỏ – mà theo Khởi Nghiệp Cafe – phù hợp nhất đối với số đông quán cafe hiện tại. Không những thế, qua bài viết này, bạn cũng hiểu hơn rất nhiều về máy espresso và có vốn liếng để “biết đường mà lựa máy cafe phù hợp”. Nó khá dài. 
Nhưng đây là những kiến thức cực kỳ bổ ích cho bạn. Có cả công thức pha chế để bạn thấy bạn có thể thêm vào menu những món nào. Nghĩ cho vui thì chí ít nó còn không tốn tới 8 tiếng đồng hồ như hồi xưa ta đi học mỗi ngày. Chúc bạn một ngày vui vẻ nhé !!!"
)
