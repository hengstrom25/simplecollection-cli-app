class Pattern

  attr_accessor :name, :url, :size, :materials, :gauge, :suggested_needles, :notes, :description

  @@all = []

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
  
  def print_pattern
    puts "--------------------"
    puts ""
    puts "#{@name}"
    puts ""
    puts "Sizing: #{@size}"
    puts "Materials: #{@materials}"
    puts "Gauge: #{@gauge}"
    puts "Suggested Needles: #{@suggested_needles}"
    puts "Notes: #{@notes}"
    puts ""
    puts "#{@description}"
    puts "--------------------"
    puts ""
  end


end
