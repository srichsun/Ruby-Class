# comment
a = 10 # comment

# condition 判斷情況
if 判斷式 # 真/假 對/錯 有/沒有

end

if 0 # true 0是Fixnum，ruby裡面是false(不是nil，還是會是true)

end

if nil # nil意義上就是什麼都沒有，是false

end

age = 33
if age > 60
  puts "price is 5"
else
  puts "price is 50"
end

if age == 1 # 判斷要用兩個 ==
  puts "age is 1"
end

# A && B  AB都是要是true才會是true
age = 30
gender = 'girl'
if age < 30 && gender == 'girl'
  puts "yes!"
else
  puts "too old or is a boy no!"
end

# A || B  AB只要其中是一個true就會是true
age = 30
gender = 'girl'
if age < 30 || gender == 'girl'
  puts "yes!"
else
  puts "too old or is a boy no!"
end

age = 30
gender = 'girl'
height = 165
if age < 30 || gender == 'girl' && height > 180
  puts "yes!"
else
  puts "too old or is a boy no!"
end


# loop
# while condition
#
# end
#
# times
#
#
# # action
#
#
# # array
#
#
# # hash
#
#
# # regular expression
