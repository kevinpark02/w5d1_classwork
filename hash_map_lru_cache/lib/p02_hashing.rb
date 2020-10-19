class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    res = 1
    self.each_with_index do |ele, i|
      res += (ele.hash * i.hash) 
    end
    res.hash
  end
end

class String
  def hash
    res = 0
    alphabet = ("a".."z").to_a

    self.chars.each_with_index do |char, idx|
      cur = alphabet.index(char.downcase) * idx.hash
      res += cur.hash
    end
    res.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    self.to_a.sort.hash
    # 0
  end
end
