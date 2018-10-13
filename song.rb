class Song

  attr_reader :song
  attr_writer :song

  def initialize(song)
    @song = song
  end


def random_song
    shuffled_song_array = song.shuffle
    return shuffled_song_array[0]
end









 end
