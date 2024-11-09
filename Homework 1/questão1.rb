def palindromo?(string)
  arrumarstring = string.downcase.gsub(/\W/, '')
  arrumarstring == arrumarstring.reverse
end
  
# Exemplos
palindromo?("A man, a plan, a canal -- Panama") #=> true
palindromo?("Madam, I'm Adam!") # => true
palindromo?("Abracadabra") # => false

def contar(string)
  palavras = string.downcase.scan(/\b\w+\b/)
  palavras.each_with_object(Hash.new(0)) { |palavra, contagem| contagem[palavra] += 1 } 
end


# Exemplos
puts contar("A man, a plan, a canal -- Panama")
# => {"a"=>3, "man"=>1, "plan"=>1, "canal"=>1, "panama"=>1}
puts contar("Doo bee doo bee doo")
# => {"doo"=>3, "bee"=>2}
  