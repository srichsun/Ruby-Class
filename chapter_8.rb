# chapter 8 class & module

# 可以想像成用鯛魚燒的模板壓出一個鯛魚燒
# class就是版型，object就是用這個版做出來的東西

# 現實生活：一個東西有特性&行為
# 程式語言：一個物件有變數&方法

# 創一個string物件
a = Array.new
a[0] = "happy"
puts a.count # a有count這個方法
puts a.class # 我們稱a是一個Array物件
#（實際開發會直接這樣創物件 a = ["happy"])

# example: 自創一個class叫Girl / 有實體方法
class Girl # class名字要大寫
  def say_hi # 這個方法要創一個object/instance後才能用，稱為實體方法 instance method
    "hi"
  end
end

# example: 創一個girl class的物件
mary = Girl.new
puts mary.class # 我們稱Mary是一個Girl物件/實體 / Mary的class是Girl
puts mary.say_hi #mary有say_hi這個方法
# say_hi是實體方法，不可以這樣用Girl.say_hi

# 實體方法（instance method） vs class方法
# 實體方法（instance method）：物件可以用的方法
# class方法：Class可以用的方法
class Girl
  def say_hi # 物件的方法：要先創物件才能用
    puts "hi"
  end

  def self.say_no # class方法寫法1：直接class就能用
    puts "no"
  end

  def Girl.say_cheese # class方法寫法1：直接class就能用
    puts "cheese"
  end
end

mary = Girl.new
mary.say_hi

Girl.say_no
Girl.say_cheese

# 先複習一般method變數特性
# 一般method要傳變數進去才能用
def be_mine(name)
  puts "hi my name is #{name}, I am your gf now"
end

be_mine("MMMM")

# 離開方法變數就不存在了
def method1
  name = "Kiki" #
end
puts name # error

# @開頭的變數叫實體變數，實體變數在同一個class的不同methods，可以共用
class Girl
  def set_name
    @name = 'Mq'
  end

  def be_mine
    puts "hi my name is #{@name}, I am your gf now"
  end

  def yes
    puts "#{@name} #{@name} #{@name} yes!"
  end
end

default_girl = Girl.new
default_girl.set_name # 創@name變數
default_girl.be_mine # 可以用上一部的@name變數。@name變數不在set_name方法內還是存在。
default_girl.yes # 同一個class的其他方法都拿得到@name變數

# example: 介紹initialize方法
class Girl
  def initialize(name = "Scarlett Johansson") # class .new時候會自動執行initialize方法
    @name = name
  end

  def be_mine
    puts "hi my name is #{@name}, I am your gf now"
  end
end

default_girl = Girl.new # 當.new自動幫你執行 default_girl.initialize
default_girl.be_mine

sophia = Girl.new("Sophia")
sophia.be_mine

jojo = Girl.new("jojo")
jojo.be_mine
# 以上等於 Girl.new("jojo").be_mine

# 這兩個物件同一個class但各個自有不同的變數
# 想性成：變數是特性，方法是行為
p sophia #<Girl:0x007fab2185a128 @name="Sophia">
p jojo #<Girl:0x007fab2185a880 @name="jojo">

# example: 同一個class的不同物件，實體變數可以不同
class Girl
  def initialize(name = "Scarlett Johansson" )
    @name = name
  end

  def be_mine
    puts "hi my name is #{@name}, I am your gf now"
  end

  def break_up(spouse = "David")
    @spouse = spouse

    puts "#{@spouse} let us break up"
  end
end

girl1 = Girl.new
girl1.be_mine
p girl1 # #<Girl:0x007f9d7d81e698 @name="Scarlett Johansson">

girl1.break_up
p girl1 # #<Girl:0x007f9d7d81e698 @name="Scarlett Johansson", @spouse="David">
# 這個時候@name變數還在

puts "=========================="

girl2 = Girl.new("Mary")
girl2.be_mine
p girl2 # #<Girl:0x007fb65c8e72f8 @name="Mary">

girl2.break_up("Aric")
p girl2 # #<Girl:0x007fb65c8e72f8 @name="Mary", @spouse="Aric">

# 實體變數預設不能從物件/class外面讀到，或改變實體變數的值
class Girl
  attr_accessor :cup # 從外面可以讀取cup

  def initialize(cup = "G")
    @cup = cup
  end

  # attr_accessor :cup等你幫你新增以下兩個method

  # attr_reador :cup 等於以下這個方法
  # def cup
  #   @cup
  # end

  # attr_writer :cup 等於以下這個方法
  # def cup= new_cup
  #   @cup = new_cup
  # end
end

girl1 = Girl.new
puts girl1.cup # 物件.實體變數名稱 可以取到變數的值

girl1.cup = 'A'
puts girl1.cup

========以下待整理

# class方法
# 寫法1 最常見，先熟悉這個
class Boy
  def self.say_whats_up
    puts "whats up"
  end
end

Boy.say_whats_up
Boy::say_whats_up

# 寫法2 少見
def Boy
  def Boy.say_whats_up
    puts "whats up"
  end
end

Boy.say_whats_up

# 寫法3
class Boy
end

class << Boy
  def say_whats_up
    puts "whats up"
  end
end

Boy.say_whats_up

class Terminator
  @@people_got_killed_num = 0

  def initialize(name = "Arnold v1")
    @name = name
  end

  def self.people_got_killed_num
    @@people_got_killed_num
  end

  def kill_one_citizen
    @@people_got_killed_num += 1

    puts "one person got terminated"
  end
end

puts Terminator.people_got_killed_num # 一開始 @@people_got_killed_num 0
terminator1 = Terminator.new
terminator1.kill_one_citizen # terminator1這個object呼叫方法後讓@@people_got_killed_num + 1

puts Terminator.people_got_killed_num # 注意離開terminator1 object後，類別變數@@people_got_killed_num還是存在，是1
terminator2 = Terminator.new
terminator2.kill_one_citizen # terminator1這個object呼叫方法後讓@@people_got_killed_num 再+ 1

puts Terminator.people_got_killed_num # 最後@@people_got_killed_num 變3

t = Terminator.new
puts t.sex

# class中可以定義常數
# # 讀取class / module中的常數
# # 呼叫class / module中的方法
#
# # ex1
# class Boy
#   HEIGHT = 180
# end
# puts Boy::HEIGHT
#
# # ex2
# module Human
#   HEIGHT = 20
# end
# puts Human::HEIGHT
#
# # ex3 class module 可以互相套
# module M2
#   CONT_M2 = 30
#
#   class Other
#       CONT_OTHER = 40
#   end
# end
# puts M2::CONT_M2
# p M2::Other # 拿到 class
# puts M2::Other::CONT_OTHER
#
# # ex4  class module 可以互相套
# class M2
#   CONT_M2 = 30
#
#   module Other
#       CONT_OTHER = 40
#   end
# end
# puts M2::CONT_M2
# p M2::Other # 拿到 module
# puts M2::Other::CONT_OTHER

# 呼叫class / module的方法
class M2
  CONT_M2 = 30

  module Other # class裡的module
    def self.say # 不能只有say
      puts "hi"
    end

    class Positive # module裡的class
      def self.say_positive
        puts "Positive"
      end
    end
  end
end

M2::Other.say
M2::Other::Positive.say_positive

# 繼承 inheritance
繼承可以做到下面這些事:
- 不用重複寫code，結構乾淨，簡潔。
- 保存原本所有功能，並追加新功能

# Ruby class 繼承圖
http://wiki.plweb.org/images/2/29/%E7%AC%AC%E4%B8%80%E5%BC%B5%E5%9C%96.jpg
