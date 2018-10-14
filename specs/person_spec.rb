require("minitest/autorun")
require("minitest/rg")
require_relative("../person")

class TestPerson < MiniTest::Test


def setup
    @person = Person.new( "bob smith", "toto - africa", 100, 0)
end


def test_check_persons_cash_ammount
    result = @person.check_cash("bob smith")
    assert_equal(100, result)
end


def test_check_fav_song
    result = @person.fav_song_checker()
    assert_equal("toto - africa", result)
end

end
