def combine_anagrams(words)
  words.group_by { |word| word.downcase.chars.sort.join }.values
end

combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])