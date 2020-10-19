class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key.hash] << key
    self.count += 1
    resize! if self.count > num_buckets

  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    return if !self.include?(key)
    self[key.hash].delete(key)
    self.count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    pre = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) {[]}
    pre.flatten.each { |ele| insert(ele) }
  end
end
