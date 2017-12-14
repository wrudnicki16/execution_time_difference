def my_min_slow(array)
  result = nil
  array.each do |el1|
    array.each do |el2|
      if el1 < el2
        if result && el1 < result
          result = el1
        elsif result.nil?
          result = el1
        end
      end
    end
  end
  result
end



def my_min_faster(array)
  min = array.first
  array[1..-1].each do |el|
    if el < min
      min = el
    end
  end
  min
end


a = (0..20).to_a.shuffle!
p my_min_faster(a)

def sub_sum_slow(array)
  max_sum = -10**81
  array.each_with_index do |_, i|
    (i+1...array.length).each do |end_idx|
      cur_max = array[i..end_idx].reduce(:+)
      max_sum = cur_max if cur_max > max_sum
    end
  end
  max_sum
end


def sub_sum_fast(array)
  max_as_yet = array.first
  current_sequence_sum = array.first

  array[1..-1].each do |el|
    current_sequence_sum = [el, current_sequence_sum + el].max
    max_as_yet = [current_sequence_sum, max_as_yet].max
  end
  max_as_yet
end

list = [2, 3, -6, 7, -6, 7]
p sub_sum_fast(list)
