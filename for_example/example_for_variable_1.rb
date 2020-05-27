$x = 0 # 全域變數
x = 0 # 區域變數

require "./for_example/example_for_variable_2.rb"

p $x # 1 被example_for_variable.rb 改成1
p x # 0 還是原本的區域變數值
