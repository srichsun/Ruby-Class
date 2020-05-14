puts # 會換行
p # 會顯示較多物件特性

# 關鍵字：跳脫 escape
# 目的：確實想要顯示特別字元

# 特殊符號有其功能
puts "aaaaa"
puts "\n" # \n代表換行 是有功能，不是要顯示\n
puts "bbbbb"

# "aaaaa"
#
# "bbbbb"

# 當確實想要顯示特殊符號

# example 1
puts "this is good"
puts "\\n" # 在想要顯示的符號前加\，代表確實想要顯示這個特殊字元
puts "this is so good"

# "aaaaa"
# \n
# "bbbbb"

#example 2
puts "this is "good"" # syntax error
puts "this is \"good\"" # this is "good"

================================================================================

# 物件有不同型態
puts 100.class # Fixnum
puts 100.1.class # Float
puts "this is a book".class # String
puts 'this is a book'.class # String
puts "100".class # String
puts '100'.class # String
puts true.class # TrueClass
puts false.class # FalseClass
puts nil.class # nil 意義就是什麼都沒有
puts 0.class # Fixnum

# 物件(object)有不同型態(class)，各別不同型態的物件有各別的方法(methods)可以用
100.count
"100".to_i
"taipei".capitalize
100.capitalize #NoMethodError: undefined method `capitalize' for 100:Fixnum 代表數字沒有capitalize這個方法可以用

# 其中一個是float會變成float
puts (100/3.0) # 33.333333333333336 class是float
puts (100/3) # 33 結果把小數點去掉 class是Fixnum

# 如何在字串中把一個東西取代 => 先存成變數，再用 雙引號 + #{}
num = 1000
puts "I have #{num} houses"

"~~~~#{放變數}~~~~"
"~~~~變數的值~~~~~"

================================================================================

# 變數目的：
# 目的1: 一個地方，全部一起改，code比較好維護

# bad
puts "this product original price is 100, now is 50% off, price only 50 dollar!" # hard code 寫法

# good
original_price = 1000
percentage = 50
deal_price = ( original_price * percentage/100 )
puts "this product original price is #{original_price}, now is #{percentage}% off, price only #{deal_price} dollar!"

# 目的2: 變數增加可讀性，去除 magic number

# bad
original_price = 1000
percentage = 50
deal_price = ( original_price * percentage/100 ) * 0.9 # 0.9 是magic number 別人會看不懂
puts "this product original price is #{original_price}, now is #{percentage}% off, price only #{deal_price} dollar!"

# good
original_price = 1000
percentage = 50
vip_deal = 0.9
deal_price = ( original_price * percentage/100 ) * vip_deal
puts "this product original price is #{original_price}, now is #{percentage}% off, price only #{deal_price} dollar!"
