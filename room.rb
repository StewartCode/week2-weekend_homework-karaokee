require_relative("song")
require_relative("person")
require("pry")

class Room

  attr_reader :room_array, :songs_array, :bar
  attr_writer :room_array, :songs_array, :bar

  def initialize(room_array, songs_array, bar)
     @room_array = room_array
     @songs_array = songs_array
     @bar = bar
  end

def person_enters_room(person, room)
  array_check = @room_array.reduce {|x , y| x + y}
    array = []
    for x in array_check
       if x == person.name
         return "that person is already in a room"
      else end
    end
    if @room_array[room].length >= 4
      return "room full sorry"
      else
        person.cash -= 10
        @bar.float += 10
        array = @room_array[room] << person.name
        return array
    end
end

def person_leaves_room(person, room)
     counter = 0
     for people in @room_array[room]
        if people == person.name
            @room_array[room].delete_at(counter)
        else
            counter += 1
          next
        end
     end
end

def random_song()
    shuffled_song_array = @songs_array.song.shuffle
    return shuffled_song_array[0]
end

def fav_song_is_playing(person, random_song)
    if random_song == person.fav_song
       return "woo hoo, i love this song"
    else
       return "sits down quietly"
    end
end

def drinking(person, no_of_drinks)
    drinks_price = 5
    if no_of_drinks == 1
       person.cash -= 5
       person.stomach += 1
       @bar.float += 5
       return "happy"
     elsif no_of_drinks == 2
        person.cash -= 10
        person.stomach += 2
        @bar.float += 10
        return "tipsy"
      elsif no_of_drinks == 3
         person.cash -= 15
         person.stomach += 3
         @bar.float += 15
         return "getting pissed"
       elsif no_of_drinks == 4
          person.cash -= 20
          person.stomach += 4
          @bar.float += 20
          return "drunk"
        elsif no_of_drinks == 5
           person.cash -= 25
           person.stomach += 5
           @bar.float += 25
           return "steaming"
         elsif no_of_drinks == 6
            person.cash -= 30
            person.stomach += 6
            @bar.float += 30
            emergency = Ambulance.new(person.name)
            return "oh no #{emergency.drunken_mess} has been rushed to hospital"
          elsif no_of_drinks == 0
            return "you are sensible"
          elsif no_of_drinks <= -1
            return "erm, what!"
          else
            total = drinks_price * no_of_drinks
            emergency = Ambulance.new(person.name)
            @bar.float += total
            person.cash -= total
            return "oh no #{emergency.drunken_mess} has been rushed to hospital"
    end



end


end
