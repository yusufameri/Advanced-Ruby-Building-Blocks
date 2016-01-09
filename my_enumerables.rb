module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end
  # [1,2,3,342,12,2].my_each {|item| puts item}

  def my_each_with_index
    return self unless block_given?
    index = 0
    for i in self
      yield(i,index)
      index+=1
    end
  end
  # puts [1,3,5,1,3,4,5,2,3,4].my_each_with_index {|item,l| puts "item: #{item}, index: #{l}"}

  def my_select
    return self unless block_given?
    ar = []
    self.my_each {|item| ar << item if yield(item)}
    ar
  end
  # puts [1,45,7,2,2,5,4,2].my_select {|item| item >= 3} #numbers >=3

  def my_all?
    return self unless block_given?
    self.my_each {|item| return false unless yield(item)}
    true
  end
  # puts [1,45,7,2,2,5,4,2].my_all? {|item| item>0}

  def my_any?
    return self unless block_given?
    self.my_each {|item| return true if yield(item)}
    false
  end
  # puts [1,45,7,2,2,5,4,2].my_any? {|item| item<1}

  def my_none?
    return self unless block_given?
    self.my_each {|item| return false if yield(item)}
    true
  end
  # puts [1,45,7,2,2,5,4,2].my_all? {|item| item>44}  

  def my_count
    count = 0;
    if block_given?
      self.my_each {|item| count +=1 if yield(item)}
  else
    self.my_each {|item| count +=1}
  end
    count
  end
  # puts [1,2,4,2,35].my_count
  # puts [1,2,35,2,6,45,-1,-3,-23].my_count {|item| item >0}

  def my_map
    return self unless block_given?
    ar = []
    self.my_each {|item| ar << yield(item)}
    ar
  end
  # puts [1,2,35,2,6,45,-1,-3,-23].my_map {|item| item*2}

  def my_inject(num=nil)
    return self unless block_given?
    result = num.nil? ? first : num
    self.my_each {|item| result = yield(result,item)}
    result
  end

  def multiply_els
    self.my_inject {|total,item| total*item}
  end
  puts [1,2,3,4].multiply_els
end
