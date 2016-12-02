class Movie
 REGULAR = 0
 NEW_RELEASE = 1
 CHILDRENS = 2

 attr_reader :title        # 只读, 不能设置
 attr_accessor :price_code # 既可以读取也可以设置

 def initialize(title, price_code)
   @title, @price_code = title, price_code
 end
end


