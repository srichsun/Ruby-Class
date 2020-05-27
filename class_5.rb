# chapter 4 object / class / variable / constant

"David".class
"David" 是 String 這種class(類別)的object / instance

# local variable 生命週期在一個block裡面。小寫開頭
name

# gloabal variable 幾乎不用，難追蹤。只要命名一樣就是指同一變數
$name

# instance variable 實體變數
@name

# class variable
@@name

# constant 常數 - 設定之後就不能再重新assign. 大寫開頭
HEIGHT_GIRL1 = 180
HEIGHT_GIRL1 = 1 # 噴 error

# 變數命名
# snake
best_day_ever = 1
# camel
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
girl_1 = "good girl"
girl_2 = "good girl"
puts "girl_1".object_id # 70126674185020
puts "girl_2".object_id # 70126674184720

p girl_1 == girl_2 # ==是比較值，值相同是  true
p girl_1.equal?(girl_2) # .equal?是看是不是同一物件，是false
