class Guest

  attr_reader(:name,:genre,:cash,:drink_rate,:drinks)

    def initialize(name, genre, cash, drink_rate)
      @name = name
      @genre = genre
      @cash = cash
      @drink_rate = drink_rate
      @drinks = []
    end

    def buy_drink(drink)
      @drinks << drink if drink[:price] <= @cash
      @cash -= drink[:price] if drink[:price] <= @cash
    end

    def number_drinks
      @drinks.size
    end

end