class Bar

  def initialize
    @drinks_selection = [
      beer:{
        type: "beer",
        price: 4
      },
      wine:{
        type: "wine",
        price: 5
      },
      cocktail:{
        type: "cocktail",
        price: 8
      },
      soft:{
        type: "soft",
        price: 2
      },
      spirit:{
        type: "spirit",
        price: 5
      }
    ]
  end

  def get_drink
    @drinks_selection.sample
  end


end