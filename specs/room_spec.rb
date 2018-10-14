require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../person")
require_relative("../song")
require_relative("../bar")
require_relative("../ambulance")
require("pry")

class TestRoom < MiniTest::Test


  def setup
    @bar1 = Bar.new(1000,[0,1,2,3],50)
    @song = Song.new(["toto - africa", "inxs - need you tonight", "daft punk - get lucky", "chic - le freak"])
    @person1 = Person.new("bob smith", "toto - africa", 200, 0)
    @person2 = Person.new("jimmy white", "inxs - need you tonight", 150, 0)
    @person3 = Person.new("alan smith", "daft punk - get lucky", 125, 0)
    @person4 = Person.new("matt rouge", "chic - le freak", 60, 0)
    @person5 = Person.new("jamie murray", "air - all i need", 500, 0)
    @person6 = Person.new("andy murray", "eric prydz - generate", 1000, 0)
    @person7 = Person.new("ally mccoist", "tini turner - simple the best", 400, 0)
    @person8 = Person.new("captain hook", "rod stewart - we are sailing", 1000, 0)
    @person9 = Person.new("jimmy cranky", "gary glitter - come on", 1000, 0)
    @person10 = Person.new("ray meirs", "abba - dancing queen", 1000, 0)
    @room = Room.new([[],[],[],[]],@song, @bar1)
  end


def test_person_enters_room
  result = @room.person_enters_room(@person1, @bar1.ticket_no_array[0])
  assert_equal(["bob smith"], result)
end

def test_person_leaves_room
  @room.person_enters_room(@person2, @bar1.ticket_no_array[1])
  @room.person_enters_room(@person1, @bar1.ticket_no_array[1])
  result = @room.person_leaves_room(@person1, @bar1.ticket_no_array[1])
  assert_equal(["jimmy white"], result)
end
def test_fav_song_checker
    result = @person1.fav_song_checker
    assert_equal("toto - africa", result)
end

def test_person_tries_to_enter_full_room
  @room.person_enters_room(@person1, @bar1.ticket_no_array[0])
  @room.person_enters_room(@person2, @bar1.ticket_no_array[0])
  @room.person_enters_room(@person3, @bar1.ticket_no_array[0])
  @room.person_enters_room(@person4, @bar1.ticket_no_array[0])
  result = @room.person_enters_room(@person5, @bar1.ticket_no_array[0])
  assert_equal("room full sorry", result)
end

# def test_if_fav_song_is_playing
#     @room.person_enters_room(@person1, @bar1.ticket_no_array[0])
#     random_song = @room.random_song()
#     result = @room.fav_song_is_playing(@person1, random_song)
#     assert_equal("woo hoo, i love this song", result )
#     assert_equal("toto - africa", random_song)
#     # AS THE SONG IS RANDOM, THERE IS A ONE IN FOUR CHANCE OF PASSING
# end

def test_financial_transactions_for_entry
  @room.person_enters_room(@person1, @bar1.ticket_no_array[0])
  result = @person1.cash
  result2 = @bar1.float
  assert_equal(190, result)
  assert_equal(1010, result2)
end

def test_drinking_levels
    result = @room.drinking(@person1, -1, @bar1.ticket_no_array[0] )
    assert_equal("erm, what!", result)
end

def test_drinking_levels
    result = @room.drinking(@person1, 0, @bar1.ticket_no_array[0])
    assert_equal("you are sensible", result)
end

def test_drinking_levels
    result = @room.drinking(@person1, 1, @bar1.ticket_no_array[0])
    assert_equal("happy", result)
end

def test_drinking_levels
    result = @room.drinking(@person1, 2, @bar1.ticket_no_array[0])
     assert_equal("tipsy", result)
end

def test_drinking_levels
    result = @room.drinking(@person1, 3, @bar1.ticket_no_array[0])
    assert_equal("getting pissed", result)
end

def test_drinking_levels
    result = @room.drinking(@person1, 4, @bar1.ticket_no_array[0])
    assert_equal("drunk", result)
end

def test_drinking_levels
    result = @room.drinking(@person1, 5, @bar1.ticket_no_array[0])
    assert_equal("steaming", result)
end

def test_drinking_levels
    result = @room.drinking(@person1, 6, @bar1.ticket_no_array[0])
    assert_equal("paraletic and has been rushed to hospital", result)
end

def test_more_than_6_drinks_being_bought
    result3 = @room.drinking(@person1, 10, @bar1.ticket_no_array[0])
    result = @bar1.float
    result2 = @person1.cash
    assert_equal(1050, result)
    assert_equal(150, result2)
    assert_equal("paraletic and has been rushed to hospital", result3)
end

def test_if_person_is_in_two_rooms
  @room.person_enters_room(@person1, @bar1.ticket_no_array[0])
  @room.person_enters_room(@person2, @bar1.ticket_no_array[0])
  @room.person_enters_room(@person3, @bar1.ticket_no_array[0])
  @room.person_enters_room(@person4, @bar1.ticket_no_array[1])
  @room.person_enters_room(@person5, @bar1.ticket_no_array[1])
  @room.person_enters_room(@person6, @bar1.ticket_no_array[1])
  @room.person_enters_room(@person7, @bar1.ticket_no_array[1])
  @room.person_enters_room(@person8, @bar1.ticket_no_array[2])
  @room.person_enters_room(@person9, @bar1.ticket_no_array[2])
  @room.person_enters_room(@person10, @bar1.ticket_no_array[3])
  result = @room.person_enters_room(@person1, @bar1.ticket_no_array[0])
  assert_equal("that person is already in a room", result)

end

end
