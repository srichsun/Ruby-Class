# chapter 4 object / class / variable / constant

"David".class
"David" 是 String 這種class的object / instance

# local variable
name

# gloabal variable 幾乎不用，難追蹤
$name

# instance variable
@name

# class variable
@@name

# constant 設定之後就不能再重新assign
HEIGHT = 180

# 變數命名
# camel
best_day_ever = 1
# snake
BestDayEver = 1
# 不能用保留字
ex: if else end
# 要有意義，不能太精簡
ex x, yyy

# coding style
https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhTW.md
# 編輯器安裝rubocop 自動檢查語法
# 安裝編輯器外掛

# 查看變數在記憶體是不是同一個
girl_1 = "girl1"
girl_2 = "girl1"
puts "girl_1".object_id # 70126674185020
puts "girl_2".object_id # 70126674184720

p girl_1 == girl_2 # ==是比較值，值相同是  true
p girl_1.equal?(girl_2) # .equal?是看是不是同一物件，是false
