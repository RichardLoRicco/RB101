# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = ['a', 'e', 'i', 'o', 'u']

hsh.each do |number, strings|
  strings.each do |string|
    string.each_char do |char|
      if VOWELS.include?(char)
        p char
      end
    end
  end
end
# "e"
# "u"
# "i"
# "o"
# "o"
# "u"
# "e"
# "o"
# "e"
# "e"
# "a"
# "o"