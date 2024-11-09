class Numeric
  @@currencies = {
    'euro' => 1.292, 'euros' => 1.292,   
    'dollar' => 1.0, 'dollars' => 1.0, # <-------- hash com as taxas de conversão de cada moeda 
    'yen' => 0.013, 'yens' => 0.013
    'rupee' => 0.019, 'rupees' => 0.019,
  }

  #essa função pega os métodos
  def method_missing(method_id)
    currency_name = method_id.to_s
    if @@currencies.has_key?(currency_name) # <------ verifica se a moeda tá no hash
      self * @@currencies[currency_name]
    else      
      super                                 # <------ se não tiver
    end
  end

  # já essa função vai converter o valor pra outra moeda
  def in(currency)
    target_currency = currency.to_s
    if @@currencies.has_key?(target_currency) # <------ verifica se a moeda tá no hash
      self / @@currencies[target_currency]    # <------ se sim, faz a conversão
    else
      raise "Unknown currency: #{currency}" # <------ se não existir no hash
    end
  end
end

# testes
puts 5.dollars.in(:euros) # => 3.869323915
puts 10.euros.in(:rupees) # => 679.299703264
puts 1.dollar.in(:rupees) # => 52.631578947
