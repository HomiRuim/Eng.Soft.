class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # checa se é string
    attr_reader attr_name # cria o getter
    attr_reader "#{attr_name}_history" # manda o getter pro histórico

    class_eval %Q{
      def #{attr_name}=(value)                 # define o método
        @#{attr_name}_history ||= [nil]        # define o histórico como array
        @#{attr_name}_history << value         # adiciona o valor no histórico
        @#{attr_name} = value                  # coloca valor no atributo
      end

      def #{atr_name}_history                 # define o getter por historco
        @#{atr_name}_history ||= [nil]        # define o histórico também como array
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

# teste
f = Foo.new
f.bar = 1
f.bar = 2
f.bar = :wowzo
f.bar = 'boo!'
puts f.bar_history.inspect # output ----> [nil, 1, 2, :wowzo, 'boo!']
f2 = Foo.new
f2.bar = 4
puts f2.bar_history.inspect # output ----> [nil, 4]
