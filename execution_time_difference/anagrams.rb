require 'byebug'
def anagrams_slow?(word1, word2)
  letters = word1.chars
  perms = letters.permutation.to_a

  anagrams = perms.map { |perm| perm.join("") }
  p anagrams.include?(word2)

end

# anagrams_slow?("cat", "dog")
# anagrams_slow?("gizmo", "sally")    #=> false
# anagrams_slow?("elvis", "lives")    #=> true

def second_anagram?(word1, word2)
  w1_copy = word1.dup
  w2_copy = word2.dup
  w1_copy.each_char do |ch1|
    w2_copy.each_char do |ch2|
      if ch1 == ch2
        w1_copy[w1_copy.index(ch1)] = ""
        w2_copy[w2_copy.index(ch2)] = ""
      end
    end
  end
  w1_copy.empty? && w2_copy.empty?
end

p [false, second_anagram?("cat", "dog")]
p [false, second_anagram?("gizmo", "sally")]    #=> false]
p [true, second_anagram?("elvis", "lives")]    #=> true]
p [false, second_anagram?("reed", "red")]
p [true, second_anagram?("flapjacks", "flapjacks")]
p [true, second_anagram?("flapjacks", "jackflaps")]


def third_anagram?(word1, word2)
  w1 = word1.split(//).sort.join('')
  w2 = word2.split(//).sort.join('')
  w1 == w2
end

p [false, third_anagram?("cat", "dog")]
p [true, third_anagram?("elvis", "lives")]    #=> true
p [false, third_anagram?("reed", "red")]
p [true, third_anagram?("flapjacks", "flapjacks")]
p [true, third_anagram?("flapjacks", "jackflaps")]


def fourth_anagram?(word1, word2)
  w1_count = Hash.new(0)
  w2_count = Hash.new(0)

  word1.each_char { |c| w1_count[c] += 1 }
  word2.each_char { |c| w2_count[c] += 1 }

  w1_count == w2_count
end

p [false, fourth_anagram?("cat", "dog")]
p [true, fourth_anagram?("elvis", "lives")]    #=> true
p [false, fourth_anagram?("reed", "red")]
p [true, fourth_anagram?("flapjacks", "flapjacks")]
p [true, fourth_anagram?("flapjacks", "jackflaps")]

def fifth_anagram?(word1, word2)
  counts = Hash.new(0)

  word1.each_char { |c| counts[c] += 1 }
  word2.each_char { |c| counts[c] -= 1 }

  counts.keys.all? { |k| counts[k] == 0 }
end

p [false, fifth_anagram?("cat", "dog")]
p [true, fifth_anagram?("elvis", "lives")]    #=> true
p [false, fifth_anagram?("reed", "red")]
p [true, fifth_anagram?("flapjacks", "flapjacks")]
p [true, fifth_anagram?("flapjacks", "jackflaps")]
