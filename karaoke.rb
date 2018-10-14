
require_relative("./ambulance")
require_relative("./person")
require_relative("./room")
require_relative("./bar")
require_relative("./song")

print %x{clear}


puts "Welcome to the Karaoke Bar"

ambulance = Ambulance.new("")
bar = Bar.new(1000,[0,1,2,3],50)
song = Song.new(["toto - africa", "inxs - need you tonight", "daft punk - get lucky", "chic - le freak"])
persons = [Person.new("bob smith", "toto - africa", 200, 0), Person.new("jimmy white", "inxs - need you tonight", 150, 0),
  Person.new("alan smith", "daft punk - get lucky", 125, 0),Person.new("matt rouge", "chic - le freak", 60, 0),
  Person.new("jamie murray", "air - all i need", 500, 0), Person.new("andy murray", "eric prydz - generate", 1000, 0),
  Person.new("ally mccoist", "tini turner - simple the best", 400, 0), Person.new("captain hook", "rod stewart - we are sailing", 1000, 0),
  Person.new("jimmy cranky", "gary glitter - come on", 1000, 0), Person.new("ray meirs", "abba - dancing queen", 1000, 0),
]

room = Room.new([[],[],[],[]],song, bar, ambulance)

for people in persons

  #print %x{clear}
  puts "You have more people waiting to sing"
  puts "What room should #{people.name} go to? There are 4 rooms "

#p room.room_array[0].length

  input1 = gets.to_i

  until input1 == 1 || input1 == 2 || input1 == 3 || input1 == 4
    puts "try again"
    input1 = gets.to_i
  end

  print %x{clear}

  puts "Ok room #{input1} it is"
  puts room.fav_song_is_playing(people, room.random_song)
  room.person_enters_room(people, bar.ticket_no_array[input1 - 1])
  puts "the bar now has £#{bar.float}"
  puts "#{people.name} has £#{people.cash} left"

  #p room.room_array

  puts "would #{people.name} like a drink?, how many?"
  input2 = gets.to_i
  until input2 == 1 || input2 == 2 || input2 == 3 || input2 == 4 || input2 == 5 || input2 == 6 || input2 == 7 || input2 == 8 || input2 == 9
    puts "try again, single digits please"
    input2 = gets.to_i
  end

print %x{clear}

  puts "#{people.name} is " + room.drinking(people, input2, input1 - 1)
  puts "#{people.name} has £#{people.cash} left"
  puts "the bar now has £#{bar.float}"
  puts ""
  puts "NEE NAW NEE NAW, an ambulance has arrived and they throw #{ambulance.drunken_mess << people.name} inside and steal all his money"
       people.cash = 0
  puts "#{people.name} doesn't look good he's not going to make it"
  puts "#{people.name} is dead and has £#{people.cash}"
  puts ""
  puts ""
end

puts ""
puts "Thanks for playing"
