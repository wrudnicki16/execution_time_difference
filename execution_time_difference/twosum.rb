

def slow_two_sum?(arr, target)
  # runs in O(n^2) time
  result = []

  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      if arr[i] + arr[j] == target
        return true
      end
    end
  end
  false
end

def bin_search(arr, chr)
  return nil if arr.empty?
  mid = arr.length / 2
  return mid if arr[mid] == chr
  if arr[mid] > chr
    bin_search(arr[0...mid], chr)
  else
    inner_search = bin_search(arr[mid + 1..-1], chr)
    if inner_search
      inner_search + mid + 1
    else
      nil
    end
  end
end

def okay_two_sum?(arr, target)
  arr =arr.sort

  arr.each_with_index do |el, i|
    search_ind = bin_search(arr, target - el)
    if search_ind && search_ind != i
      return true
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) == true # => should be true
# p okay_two_sum?(arr, 10), 999


# p bin_search([1,4, 92, 94], 1) == 0
# p bin_search([1,4, 92, 94], 4) == 1
# p bin_search([1,4, 92, 94], 92) == 2
# p bin_search([1,4, 92, 94], 94) == 3
# p bin_search([1,4, 92, 94], 42) == nil
#
def fast_two_sum?(arr)
  # O(n) in time and space
  result = []
  complements = {}

  arr.each_with_index do |el, i|
    if complements[el]
      result.push([complements[el], i])
    else
      complements[-el] = i
    end
  end
  result
  #result.sort
end
