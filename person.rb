#require_relative("room")
 class Person

  attr_reader :name, :fav_song, :cash, :stomach
  attr_writer :name, :fav_song, :cash, :stomach

  def initialize(name, fav_song, cash, stomach)
    @name = name
    @fav_song = fav_song
    @cash = cash
    @stomach = stomach
  end

def check_cash(check_cash_name)
    if name == check_cash_name
       return cash
     end
end

def fav_song_checker()
    return fav_song
end


 end
