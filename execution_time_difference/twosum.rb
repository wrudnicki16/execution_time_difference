

def slow_two_sum?(arr)
  # runs in O(n^2) time
  result = []

  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      result << [i, j] if arr[i] + arr[j] == 0
    end
  end
  result
end


def okay_two_sum?(arr)
  result = []
  arr.sort!

  arr.each_with_index do |el, i|
    if el < 0
      next
    end
    compl_index = bin_search(arr, -el)
    if compl_index
      result.push([i, compl_index])
    end
  end
  result
end


p okay_two_sum?([1,4, -4, 92, 94, -92]) #== [[1,2], [3, 5]]


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

p bin_search([1,4, 92, 94], 1) == 0
p bin_search([1,4, 92, 94], 4) == 1
p bin_search([1,4, 92, 94], 92) == 2
p bin_search([1,4, 92, 94], 94) == 3
p bin_search([1,4, 92, 94], 42) == nil

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
