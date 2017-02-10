class Board

  attr_reader :winner
  attr_accessor :game_state

  def initialize
    @board_template = File.read('./lib/board_template.txt')
    @game_state = {}
  end

  def current_state
    @board_template.gsub(/A1/,game_state.fetch(:A1,' '))
                   .gsub(/B1/,game_state.fetch(:B1,' '))
                   .gsub(/C1/,game_state.fetch(:C1,' '))
                   .gsub(/A2/,game_state.fetch(:A2,' '))
                   .gsub(/B2/,game_state.fetch(:B2,' '))
                   .gsub(/C2/,game_state.fetch(:C2,' '))
                   .gsub(/A3/,game_state.fetch(:A3,' '))
                   .gsub(/B3/,game_state.fetch(:B3,' '))
                   .gsub(/C3/,game_state.fetch(:C3,' '))
  end

  def winner?
    same_and_not_nil?(:A1,:B1,:C1) ||
    same_and_not_nil?(:A2,:B2,:C2) ||
    same_and_not_nil?(:A3,:B3,:C3) ||
    same_and_not_nil?(:A1,:B2,:C3) ||
    same_and_not_nil?(:A3,:B2,:C1) ||
    same_and_not_nil?(:A1,:A2,:A3) ||
    same_and_not_nil?(:B1,:B2,:B3) ||
    same_and_not_nil?(:C1,:C2,:C3)
  end

  def has_ended?
    return false if @game_state.count < 2 
    winner? || @game_state.count == 9
  end

  def open_locations
    [:A1, :B1, :C1, :A2, :B2, :C2, :A3, :B3, :C3] - game_state.keys
  end

  private
  # concerned that we are setting winner as side effect (command/query combo)
  def same_and_not_nil?(x,y,z)
    return false if game_state[x].nil? || game_state[y].nil? || game_state[z].nil?
    result = game_state[x] == game_state[y] && game_state[y] == game_state[z]
    @winner = game_state[x] if result
    result
  end

end