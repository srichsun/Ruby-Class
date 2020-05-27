# chapter 2 array / hash / regular expression
# chapter 3 using read a file as an example

# string
rapper = "Jaydakiss"
puts rapper[0] #取第一個字元
puts rapper[-1] #取最後一個字元
puts "Jaydakiss"[0..2]
puts "lace"[0] = 'm'
first.concat(second)

# array
a = []
a = ['Mary', 'Alexix', 'Kelly']
a = ["David", 180, [1, "good"]]
a.size
a.count

# string methods
https://ruby-doc.org/core-2.4.1/String.html
https://apidock.com/

# 取元素
puts a[0] # 0是第一個
puts a[-1] # -1是最後一個

# 把元素放到array
a = []
a << "Aric"
a << "David"
a << "Matt"

#取代元素
a[1] = 101
p a

a[2] = "happy"
puts a

# 對陣列每個元素跑過一遍
girls = ['Mary', 'Ally', 'Kelly']
girls.each do |girl|
  puts "I love #{girl}"
end

# 對陣列每個元素值都改變

# 用each不行改變原本陣列元素的值
money = [1, 10 ,10000]

money.each do |m|
  m = m + 1
end

puts money

# 用map會回傳一個元素被改變的陣列，原陣列沒變
debt = [1, 10, 10000]

# 對每個元素都加1, map方法會回傳新的陣列
debt_not_changed = debt.map do |d|
  d = d + 1
end

puts debt_not_changed # [2, 11, 10001]
puts debt # [1, 10, 10000]


# 加驚嘆號會把原陣列值也改變
debt = [1, 10, 10000]

debt_changed = debt.map! do |d|
  d = d + 1
end

puts debt_changed # [2, 11, 10001]
puts debt # [2, 11, 10001]

a = "I Love You"
b = a.gsub('Love', 'hate')
puts a # "I Love You" 原本字串沒變
puts b # "I hate You" 回傳被改變字串

# 有驚嘆號的方法代表原本的值被改變
c = 'This is Taipei'
d = c.gsub!('Taipei', 'NY')

puts c # This is NY
puts d # This is NY

# hash
Mary = {"name": "Mary", "personality"=> "happy", "height": 160, "cup": "G"}

puts Mary
puts Mary[:name] # Mary["name"] 不行
puts Mary["personality"] # Mary[:personality] 不行
Mary.each do |key, value|
  puts "#{key}: #{value}"
end

# regular expression
# 確認字串是不是包含某些字串 / 想要顯示包括00字串的那幾行資料 /想要取得00與xx之間所寫的字串
puts /love/ =~ 'Iwanttosayloveyou' # 10 回傳符合的位置
p /wolala/ =~ 'Iwanttosayloveyou' # nil
p /DAVID/ =~ 'david' # nil
p /DAVID/i =~ 'david' # 0 # 可以加參數，加i表示不區分大小寫

# nil 表示物件不存在
a = [1, 2, 3] # a[3] #nil
b = {'name': 'Aric'} # b[:height] #nil
c = "ThisisGOOD" # /BAD/ =~ c #nil

if a[3] || b[:height] || /BAD/ =~ c
  puts "one of them is not nil"
else
  puts "they are all nil"
end

# chapter 3 讀檔案

# method 1
file = open('./for_example/file_for_read.rb')
text = file.read # 整個檔案都需要放到記憶體才會印出來
puts text
file.close

# method 2
file = open('./for_example/file_for_read.rb')
while text = file.gets do # 一次讀到一行就印出來
  puts text
end
file.close

# method 3
file = open('./for_example/file_for_read.rb')
while text = file.gets do
  if /don\’t matter/ =~ text # 符合條件才印
    puts text
  end
end
file.close
