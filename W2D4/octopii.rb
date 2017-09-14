# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

class Array
  def sluggish_octopus
    to_eat = -1

    self.each_index do |i1|
      self.each_index do |i2|
        to_eat = i1 if self[i1] > self[i2]
        to_eat = i2 if self[i2] > self[i1]
      end
    end
  end

  def dominant_octopus
    return self if self.length <= 1

    anchor = self.length / 2

    l_sorted = self.take(anchor).dominant_octopus
    r_sorted = self.drop(anchor).dominant_octopus

    Array.merge(l_sorted, r_sorted).last
  end

  def self.merge(left, right)
    prc ||= Proc.new { |x, y| x <=> y }

    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end

  def clever_octopus
    longest = -1

    self.each do |num|
      longest = num if longest > num
    end

    longest
  end

  def slow_dance(direction, tiles_array)
    tiles_array ||= ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

    tiles_array.each_with_index do |dir, i|
      return i if dir == direction
    end
  end

  def constant_dance(direction, tiles_hsh)
    tiles_hsh ||=  {'up' => 1,
                    "right-up" => 2,
                    "right" => 3,
                    "right-down" => 4,
                    "down" => 5,
                    "left-down" => 6,
                    "left" => 7,
                    "left-up" => 8}

    tiles_hsh[direction]
  end
end
