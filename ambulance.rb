require_relative("room")
 class Ambulance

  attr_reader :drunken_mess
  attr_writer :drunken_mess

  def initialize(drunken_mess)
    @drunken_mess = drunken_mess
  end

 end
