class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    calories < 200
  end

  def delicious?
    true
  end

end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    flavor.downcase != "black licorice"
  end

end

sobremesa = Dessert.new("Bolo de cenoura com cobertura de chocolatey", 150)
puts sobremesa.healthy?    # true
puts sobremesa.delicious?  # true
