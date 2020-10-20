class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    self.head.next = self.tail
    self.tail.prev = self.head
    # p self.head.next
    # p self.tail.prev
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : self.head.next
  end

  def last
    empty? ? nil : self.tail.prev
  end

  def empty?
    # p "id of head"
    # p @head.object_id
    # p "id of head's next"
    # p @head.next.object_id
    # p "id of tail"
    # p @tail.object_id
    # p "id of tail's prev"
    # p @tail.prev.object_id
    self.head == self.tail.prev
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    newbie = Node.new(key, val)
    self.tail.prev.next = newbie
    newbie.prev = self.tail.prev
    newbie.next = self.tail
    self.tail.prev = newbie
  end

  def update(key, val)
    return if empty?
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
  end

  def each
    cur = self.first
    until cur == self.tail
      yield cur
      cur = cur.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end