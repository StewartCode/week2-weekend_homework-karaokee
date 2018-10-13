require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < MiniTest::Test


  def setup
    @song = Song.new(["toto - africa", "inxs - need you tonight", "daft punk - get lucky", "chic - le freak"])
  end


def test_random_song
    result = @song.random_song()
    assert_equal("toto - africa", result)
    #this result is shuffled so will only work, 1 out of 4
end



end
