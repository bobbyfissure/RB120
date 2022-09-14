class Dog
  def initialize(name)
    @name = name
  end

  def info
    puts "All dogs are good boys!"
  end
end

benji = Dog.new('Benji')
benji.info