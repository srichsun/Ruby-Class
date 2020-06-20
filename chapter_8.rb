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

  # attr_reader :cup 等於以下這個方法
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

# pratice example
#可以設定身高跟性別,有預設值
class Boy
  def set_height height = 180
    @height = height
    puts "my height is #{@height}"
  end
  def set_gender gender = "boy"
    @gender = gender
    puts "my gender is #{@gender}"
  end
  def who_am_I
    puts "my height is #{@height} and my gender is #{@gender}"
  end
end
david = Boy.new
p david
david.set_height(160)
p david
david.set_gender("girl")
p david
david.who_am_I

# 創物件的時候身高跟性別就會有預設值,不需要先呼叫fuction。利用initialize跟實體變數可以共用
class Boy
  def initialize
    @height = 180
    @gender = "boy"
  end
  def set_height height
    @height = height
    puts "my height is #{@height}"
  end
  def set_gender gender
    @gender = gender
    puts "my gender is #{@gender}"
  end
  def who_am_I
    puts "my height is #{@height} and my gender is #{@gender}"
  end
end
david = Boy.new
david.who_am_I

#這個class有兩個實體變數@height,@gender有各別讀取跟更新值的方法
class Boy
  def initialize
    @height = 180
    @gender = "boy"
  end
  def return_height
    puts "my height is #{@height}"
    @height
  end
  def set_height height
    @height = height
    puts "my height become #{@height}"
  end
  def return_gender
    @gender
  end
  def set_gender gender
    @gender = gender
    puts "my gender become #{@gender}"
  end
  def who_am_I
    puts "my height is #{@height} and my gender is #{@gender}"
  end
end
david = Boy.new
p david.return_gender
p david.return_height
david.who_am_I
#把上面例子function method 名稱改成直觀的命名
#達到物件.變數名稱 可以取到變數
#物件.變數名稱＝可以更新變數
class Boy
  def initialize
    @height = 180
    @gender = "boy"
  end
  def height
    puts "my height is #{@height}"
    @height
  end
  def height= cm
    @height = cm
    puts "my height become #{@height}"
  end
  def gender
    puts "my gender is #{@gender}"
    @gender
  end
  def gender=(g)
    @gender = g
    puts "my gender become #{@gender}"
  end
  def who_am_I
    puts "my height is #{@height} and my gender is #{@gender}"
  end
end
david = Boy.new
p david.gender
david.gender=("girl")
p david.height
david.height= 190
david.who_am_I
#attr_accessor 等同幫我宣告以上四個function
class Boy
  attr_accessor :height, :gender
  def initialize
    @height = 180
    @gender = "boy"
  end
  def who_am_I
    puts "my height is #{@height} and my gender is #{@gender}"
  end
end
david = Boy.new
p david.gender
p david.gender = "girl"
p david.height
p david.height = 190
david.who_am_I

# class方法
# 寫法1 最常見，先熟悉這個
class Boy
  def self.say_whats_up
    puts "whats up"
  end
end

# 呼叫類別方法 方法1
Boy.say_whats_up
# 呼叫類別方法 方法2
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

# class變數 ex1
class Guy
  @@totally_money_saved = 0

  def set_name(name)
    @name = name
  end

  def save_money(money)
    @@totally_money_saved = @@totally_money_saved + money
  end

  def self.show_totally_money
    @@totally_money_saved
  end
end

puts Guy.show_totally_money

aric = Guy.new
aric.set_name("Aric")
aric.save_money(100)
puts Guy.show_totally_money

david = Guy.new
david.save_money(777)
aric.set_name("david")
puts Guy.show_totally_money

# class變數 ex2
class Terminator
  @@people_got_killed_num = 0
  # 開頭是@@表示是一個class變數
  # 這個class的object可以共用，即都可以讀到值，也都可以改變值

  def initialize(name = "Arnold v1")
    @name = name
  end

  def self.people_got_killed_num # 想要從class外面拿到class變數需要自己寫方法去讀取
    @@people_got_killed_num
  end

  def kill_one_citizen
    @@people_got_killed_num += 1

    puts "one person got terminated"
  end

  def kill_target(object)
    puts "#{object} got terminated"
  end
end

puts Terminator.people_got_killed_num # 一開始 @@people_got_killed_num 0
terminator1 = Terminator.new
terminator1.kill_one_citizen # terminator1這個object呼叫方法後讓@@people_got_killed_num + 1

puts Terminator.people_got_killed_num # 注意離開terminator1 object後，類別變數@@people_got_killed_num還是存在，是1
terminator2 = Terminator.new
terminator2.kill_one_citizen # terminator1這個object呼叫方法後讓@@people_got_killed_num 再+ 1

puts Terminator.people_got_killed_num # 最後@@people_got_killed_num 變3

# 擴充class => 在原有的class新增 or 修改方法
# ex 1
class Terminator
  def turn_good
    puts "I am a good boy, I do not kill people anymore"
  end
end

t = Terminator.new
t.turn_good

# 針對原本class方法做修改，但又不想改原本的class => 用繼承
class CleaningRobot < Terminator
  def kill_target(insect) # 對原有class的方法做改寫
    super(insect) # 呼叫父類別的同名方法，傳入參數insect
    puts "I am a good cleaning robot!"
  end

  def self.interval_clean # 新增原有class沒有的功能
    if Time.now.hour == 8
      puts "start cleaning"
    end
  end
end

c = CleaningRobot.new
c.kill_target("Cockroach")

CleaningRobot.interval_clean


# ex 2
class Numeric # 也可以在ruby既有class上加方法
  def become_half
    self / 2 # self可以拿到呼叫這個實體方法的物件 / 誰呼叫這個實體方法，self就是這個”誰“
  end
end

puts 100.become_half

# ex 3 修改既有ruby方法
class RingArray < Array
  def [](i)
    idx = i % size
    super(idx)
  end
end

eto = RingArray["0", "1", "2", "3", "4", "5"]
p eto[0]
p eto[1]
p eto[7] # 1
p eto[8] # 2


# Ruby中所有類別都是object的子類別
# Ruby class 繼承圖
http://wiki.plweb.org/images/2/29/%E7%AC%AC%E4%B8%80%E5%BC%B5%E5%9C%96.jpg

p 5.class # Fixnum
p 5.class.superclass # Interger
p 5.class.superclass.superclass # Numberic
p 5.class.superclass.superclass.superclass # Object

# 繼承 inheritance
# 繼承可以做到下面這些事:
- 把共用的功能寫在父class，後面的class再繼承它 => 不用重複寫code，結構乾淨，簡潔，code可以重覆利用。
- 保存原本所有功能，並追加新功能
- 對原有功能做修改，但不修改原有的code

# class中可以定義常數
# 用::
# 讀取class / module中的常數
# 拿到class / module中的方法

# ex1
class Boy
  HEIGHT = 180
end

puts Boy::HEIGHT

# ex2
module Girl
  HEIGHT = 20
end
puts Girl::HEIGHT

# ex3 class module 可以互相套
module BadBoy
  CONT_BOY = 30

  class Girl
    CONT_GIRL = 40
  end
end
puts BadBoy::CONT_BOY
p BadBoy::Girl # 拿到 class
puts BadBoy::Girl::CONT_GIRL

# ex4 class module 可以互相套
class BadGirl
  CONT_GIRL = 30

  module Boy
      CONT_BOY = 40
  end
end
puts BadGirl::CONT_GIRL
p BadGirl::Boy # 拿到 module
puts BadGirl::Boy::CONT_BOY

# ex5 呼叫多層class / module 中的方法
class M2
  CONT_M2 = 30

  module Other # class裡的module
    def self.say
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
