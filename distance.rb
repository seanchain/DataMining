#! /usr/bin/ruby

class Distance
  attr_reader :smc
  def initialize a, b
    @x, @y = a, b #初始化两个对象
  end
  def count
    @f00, @f01, @f10, @f11 = 0, 0, 0, 0
    return if @x.size != @y.size
    (0...@x.size).each do |i|
      @f00 += 1 if @x[i] == 0 && @y[i] == 0
      @f01 += 1 if @x[i] == 0 && @y[i] == 1
      @f10 += 1 if @x[i] == 1 && @y[i] == 0
      @f11 += 1 if @x[i] == 1 && @y[i] == 1
    end
  end
  def SMC #计算两个对象之间的简单匹配系数Simple Matching Coefficient
    begin
      smc = (@f11 + @f00).to_f / (@f00 + @f01 + @f10 + @f11)
      puts smc
    rescue => ex
      puts ex.message
    end
  end
  def Jaccard #计算两个对象之间的Jaccard系数
    begin
      jaccard = @f11.to_f / (@f01 + @f10 + @f11)
      puts jaccard
    rescue => ex
      puts ex.message
    end
  end
end

a = [1, 0, 0, 0, 0, 0, 0, 0, 0]
b = [0, 0, 0, 0, 0, 0, 1, 0, 0, 1]

d = Distance.new a, b
d.SMC
d.Jaccard
