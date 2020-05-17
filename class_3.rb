# loop 當條件成立就會一直跑，跑到不成立為止，要注意判斷條件

# while

a = 1
while a = 4 # 一個 = 變成無限迴圈
  puts "I love you"
  a = a + 1
end

a = 1
while a < 5
  puts "a now is #{a}"
  a = a + 1
end

# times
3.times do
  puts "I love you!"
end

3.times { puts "I love you!" }

# action / method / function
# 目的：好維護 / 增加可讀性 / 不用重複貼code

def say_love
  puts "love you"
end
say_love # 呼叫方法

def say_love(name) # 這個method可以輸入變數 / 參數
  puts "#{name} love you"
end
say_love('Mary')

def say_love(name = 'Thor') # 當沒有輸入參數時有預設值 'Thor'
  puts "#{name} love you"
end
say_love('Mary')
say_love

def repeat_the_line
  puts "this is line 2"
  puts "this is line 3"
  puts "this is line 4"

  'I\'m awesome' # ruby 會自動回傳最後一行的值
  # return 'I\'m awesome' 一樣意思但return可省略
end

puts "this is line 1"
puts repeat_the_line
# 以上一行等於
# secret_quote = repeat_the_line # 呼叫methd回傳quote，然後存到secret_quote
# p secret_quote
puts "this is line 5"

# this is line 1
# this is line 2
# this is line 3
# this is line 4
# "I'm awesome"
# this is line 5

# local variables
name = 'David'
def who_am_I
  puts name
  # 方法裡面拿不到外變的變數
end
who_am_I # undefined local variable or method `name'

def who_am_I
  name = 'Aric'
  puts name
end
who_am_I
puts name # undefined local variable or method `name' 外面是拿不到method裡面的變數

# 方法裡面跟外面變數是互不相干的，即使名稱一樣
money = 100
def spend_money
  money = 1000
  money = money - 1
  puts money
end

spend_money # 999
puts money # 100

# standard API
# Core API 就是你要先去require才能用這個方法
# https://ruby-doc.org/core-2.7.1/
require './david_library'
say_something_cool

# # # array
# #
# #
# # # hash
# #
# #
# # # regular expression
