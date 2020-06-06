# chapter 5 condition

# 除了false nil其他所有物件，都是true
a = [] # 空array物件
b = '' # 空字串物件
c = 0 # Numeric物件
d = [0] # Array物件
e = [nil] # 就是 []

if a && b && c && d && e
  puts "全部都是true"
else
  puts "其中有一個是false"
end

# if
# 以下幾種方法會回傳true false
# > < == operator / 比較運算子
a = 10
a > 1

# empty?
a = []
b = {}
c = [1]
puts a.empty? # true
puts b.empty? # true
puts c.empty? # false

# =~
a = "mynameisDavid"
p /David/ =~ a # 回傳8 條件判斷就是true
p /kkk/ =~ a # 回傳nil

if condition
end

if condition
else
end

if condition
elsif
elsif
elsif
else
end

# unless就是if的相反，false才做
unless condition
end

# example:
a = "boy"
unless a == "girl"
  puts "我不要男的"
end

# case
a = "David"
case a
when condition
end

# if else VS case

# if else是從第一個往下一個個判斷
name = "GGG"
if name == "David"
  puts "my name is #{name}"
elsif name == "Aric"
  puts "my name is #{name}"
elsif name == "Mary"
  puts "my name is #{name}"
else # 都不成立就跑else
  puts "名字不是David 也不是Aric 也不是Mary"
end

# case是直接跳到符合條件的那個
name = "Mary"
case name
when "David"
  puts "my name is #{name}"
when "Aric"
  puts "my name is #{name}"
when "Mary"
  puts "my name is #{name}"
else
  puts "名字不是David 也不是Aric 也不是Mary"
end

# case 要判斷的物件
# when 可能的值1
#   成立的話做這邊
# when 可能的值2
#   成立的話做這邊
# when 可能的值3
#   成立的話做這邊
# end

# 會回傳true false的方法會加上?，代表這個method回傳值是true或false

# 理解順序

# 1 定義方法
def is_a_boy?(person)
  if person[:gender] == 'boy'
    true
  else
    false
  end
end
person1 = {:name => "David", :gender => "boy"}

puts is_a_boy?(person1) # 2 呼叫方法, puts 只是要在console看回傳結果
person = person1 # 3 method定義的變數接收外面傳進來的值
所以 person 就是 {:name => "David", :gender => "boy"}
所以 person[:gender] 就是 {:name => "David", :gender => "boy"}[:gender]

# 常常用三元運算式取代if else 比較簡潔

# 寫法1 if else
a = 1

if a > 10000
  b = "超大"
else
  b = "不夠大"
end

puts b

# 寫法2 三元運算式
# 判斷式 ? 成立做這邊 : 不成立做這邊
a = 1
b = a > 1000 ? "超大" : "不夠大"

puts b

# === 知道就好
/zz/ === "zzsdf" # 等同下面
/zz/ =~ "zzsdf"

"kkk" === String # 等同下面
"kkk".class == String

# example
def remote_get?
  true
end

def fa_da_thsi(annual_pay)
  annual_pay.map!{|pay| pay**2}
end

def lao_sai(annual_pay)
  annual_pay.map!{|pay| pay/2}
end

annual_pay_now = [100, 200, 300]
annual_pay_one_year_later = remote_get? ? fa_da_thsi(annual_pay_now) : lao_sai(annual_pay_now)
p annual_pay_one_year_later

# 以上等於以下
if remote_get?
  fa_da_thsi(annual_pay_now)
else
  lao_sai(annual_pay_now)
end
p annual_pay_one_year_later

# 利用return替換掉波動拳

# 寫法 1 太多層if else很難看
girl1 = {"height": 178, "cup": "g", "appearance": "pretty", "age": 17, "personality": "bad", "name": "Scarlett"}
girl2 = {"height": 169, "cup": "d", "appearance": "average", "age": 26, "personality": "nice", "name": "Natalia" }
girl3 = {"height": 171, "cup": "g", "appearance": "ugly", "age": 35, "personality": "lovely", "name": "Chanel" }
girl4 = {"height": 171, "cup": "g", "appearance": "pretty", "age": 35, "personality": "lovely", "name": "Mary" }

girls = [girl1, girl2, girl3, girl4]

def check_if_true_love(girl)
  if girl[:height] > 170
    if girl[:cup] == "g"
      if girl[:appearance] == "pretty"
        if girl[:age] < 18
          "Yes #{girl[:name]} is my true love"
        else
          "#{girl[:name]}好老不要"
        end
      else
        "#{girl[:name]}好醜不要"
      end
    else
      "#{girl[:name]}好平不要"
    end
  else
    "#{girl[:name]}好矮不要"
  end
end

girls.each do |girl|
  puts check_if_true_love(girl)
end


# 寫法 2 用 return 讓結構簡潔清楚
girl1 = {"height": 178, "cup": "g", "appearance": "pretty", "age": 17, "personality": "bad", "name": "Scarlett"}
girl2 = {"height": 169, "cup": "d", "appearance": "average", "age": 26, "personality": "nice", "name": "Natalia" }
girl3 = {"height": 171, "cup": "g", "appearance": "ugly", "age": 35, "personality": "lovely", "name": "Chanel" }
girl4 = {"height": 171, "cup": "g", "appearance": "pretty", "age": 35, "personality": "lovely", "name": "Mary" }

girls = [girl1, girl2, girl3, girl4]

def check_if_true_love(girl)
  return "#{girl[:name]}好矮不要" unless girl[:height] > 170
  return "#{girl[:name]}好平不要" unless girl[:cup] == "g"
  return "#{girl[:name]}好醜不要" unless girl[:appearance] == "pretty"
  return "#{girl[:name]}好老不要" unless girl[:age] < 18

  "Yes #{girl[:name]} is my true love"
end

girls.each do |girl|
  puts check_if_true_love(girl)
end
