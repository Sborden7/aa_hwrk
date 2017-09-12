require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new (14) {[]}
    @name1, @name2 = name1, name2
    place_stones
  end

  def place_stones
    cups.each_index{|i| 4.times{cups[i] << :stone} unless i == 6 || i == 13}
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13 || @cups[start_pos].empty?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones_arr = @cups[start_pos]
    @cups[start_pos] = []
    pos = start_pos

    until stones_arr.empty?

      pos += 1
      pos = 0 if pos > 13

      if pos == 6
        @cups[6] << stones_arr.pop if current_player_name == @name1
      elsif pos == 13
        @cups[13] << stones_arr.pop if current_player_name == @name2
      else
        @cups[pos] << stones_arr.pop
      end

    end

    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # debugger
    if ending_cup_idx == 6 || ending_cup_idx == 13
     :prompt
   elsif cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].each {|cup| return false if cup.empty? == false}
    return true
    cups[7..12].each {|cup| return false if cup.empty? == false}
    true
  end

  def winner
    p1_score = @cups[6].count
    p2_score = @cups[13].count

   if p1_score == p2_score
     :draw
   else
     p1_score > p2_score ? @name1 : @name2
   end
  end
end
