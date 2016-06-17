class Guest

  attr_reader(:name,:genre,:cash,:drink_rate)

    def initialize(name, genre, cash, drink_rate)
      @name = name
      @genre = genre
      @cash = cash
      @drink_rate = drink_rate
    end


end