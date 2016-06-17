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

    def go_to_bank
      @cash += 50
    end

    def pay(cost)
      @cash -= cost
    end

    def stay_check(room)
    @cash > ((room.rate*15) + (@drink_rate * 8)) 
    end

    def like_music(room)
      like = "meh"
      for song in room.songs
        like = "WOOHOO!" if song.genre == @genre
      end
      return like
    end

end