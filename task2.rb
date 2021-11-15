class Vehicle
  attr_accessor :owner
  attr_reader :year, :model, :manufacturer
  attr_writer :color

  def initialize(owner, year,model,manufacturer, color)
   @owner = owner
    @year = year
    @model = model
    @manufacturer = manufacturer
    @color = color
    @vehicle = []
    @vehicle << { owner: owner, year: year, model: model, manufacturer: manufacturer }
  end

  def count_cars
    stat = {}
    @vehicle.each do |car|
      name = car[:manufacturer]
      if stat.has_key?(name)
        stat[name] += 1
      else stat[name] = 1
      end
    end
    return stat
  end

end


