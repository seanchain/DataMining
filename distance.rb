#! /usr/bin/ruby

class Distance
  attr_reader :smc
  def initialize a, b
    @x, @y = a, b #初始化两个对象
  end
  def binaryCount
    @f00, @f01, @f10, @f11 = 0, 0, 0, 0
    if @x.size != @y.size
      puts "两对象属性个数不同！"
      exit
    end
    (0...@x.size).each do |i|
      @f00 += 1 if @x[i] == 0 && @y[i] == 0
      @f01 += 1 if @x[i] == 0 && @y[i] == 1
      @f10 += 1 if @x[i] == 1 && @y[i] == 0
      @f11 += 1 if @x[i] == 1 && @y[i] == 1
    end
  end
  def SMC #计算两个对象之间的简单匹配系数Simple Matching Coefficient
    self.binaryCount
    begin
      smc = (@f11 + @f00).to_f / (@f00 + @f01 + @f10 + @f11)
      puts smc
    rescue => ex
      puts ex.message
    end
  end
  def Jaccard #计算两个对象之间的Jaccard系数
    self.binaryCount
    begin
      jaccard = @f11.to_f / (@f01 + @f10 + @f11)
      puts jaccard
    rescue => ex
      puts ex.message
    end
  end
  def Cosine #余弦相似度
    if @x.size != @y.size
      puts "两对象属性个数不同！"
      exit
    end
    head = 0
    (0...@x.size).each do |i|
      head += @x[i] * @y[i]
    end
    xtail, ytail = 0, 0
    @x.each do |i|
      xtail += i * i
    end
    @y.each do |i|
      ytail += i * i
    end
    xtail = Math::sqrt xtail
    ytail = Math::sqrt ytail
    tail = xtail * ytail
    begin
      cosine = head.to_f / tail
      printf "%.2f\n", cosine
    rescue => ex
      puts ex.message
    end
  end
  def Tanimoto #Tanimoto系数，又名广义Jaccard系数
    if @x.size != @y.size
      puts "两对象属性个数不同！"
      exit
    end
    head = 0
    (0...@x.size).each do |i|
      head += @x[i] * @y[i]
    end
    xtail, ytail = 0, 0
    @x.each do |i|
      xtail += i * i
    end
    @y.each do |i|
      ytail += i * i
    end
    tail = xtail + ytail - head
    begin
      ej = head.to_f / tail
      printf "%.2f\n", ej
    rescue => ex
      puts ex.message
    end
  end
  def PearsonCorr #皮尔森相关
    meanx = @x.reduce(0){|sum, value| sum += value} / @x.size
    meany = @y.reduce(0){|sum, value| sum += value} / @y.size
    cov, sx, sy = 0, 0, 0
    (0...@x.size).each do |i|
      cov += (@x[i] - meanx) * (@y[i] - meany)
      sx += (@x[i] - meanx) * (@x[i] - meanx)
      sy += (@y[i] - meany) * (@y[i] - meany)
    end
    cov /= (@x.size - 1)
    sx = Math::sqrt(sx /= (@x.size - 1))
    sy = Math::sqrt(sy /= (@y.size - 1))
  end
end
