class Map

  def initialize
    @map = {}
  end

  def assign(key,value)
    print "\n\nThat value already exists!\n\n" if @map.keys.include?(key) == true
    @map[key] = value if @map.keys.include?(key) == false
  end

  def lookup(key)
    @map[key]
  end

  def remove(key)
    @map.delete(key)
  end

  def show
    print @map
  end
end
