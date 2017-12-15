def max_windowed_range_slow(array, window_size)
  cur_max_range = nil
  (0..array.length - window_size).each do |start_i|
    window = array[start_i...start_i + window_size]
    max = window.max
    min = window.min
    if cur_max_range.nil? || (max - min) > cur_max_range
      cur_max_range = (max - min)
    end
  end
  cur_max_range
end

p max_windowed_range_slow([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p max_windowed_range_slow([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p max_windowed_range_slow([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p max_windowed_range_slow([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(item)
    @store.push(item)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end



class MyStack
  def initialize
    @store = []
    @metadata = Hash.new { |h,k| h[k] = [] }
    @max = nil
  end

  def pop
    item = @store.pop
    if item == @max
      @max = @metadata[item].pop
    end
    item
  end

  def push(item)
    @store.push(item)
    @metadata[item].push(@max)
    unless @max then @max = item end
    if item > @max then @max = item end
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end


class StackQueue

  def initialize
    @enq_stack = MyStack.new
    @deq_stack = MyStack.new
  end

  def dequeue
    while @enq_stack.size > 0
      @deq_stack.push(@enq_stack.pop)
    end
    @deq_stack.pop
  end

  def enqueue(item)
    while @deq_stack.size > 0
      @enq_stack.push(@deq_stack.pop)
    end
    @enq_stack.push(item)
  end

  def peek
    while @eqn_stack.size > 0
      @deq_stack.push(@enq_stack.pop)
    end
    @deq_stack.peek
  end

  def size
    @enq_stack.size + @deq_stack.size
  end

  def empty?
    @deq_stack.empty? && @enq_stack.empty?
  end
end
