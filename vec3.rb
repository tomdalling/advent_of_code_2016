class Vec3
  attr_accessor :x, :y, :z

  def self.[](*args)
    new(*args)
  end

  def initialize(x, y, z = 0)
    @x, @y, @z = x, y, z
  end

  def [](idx)
    case idx
    when 0 then x
    when 1 then y
    when 2 then z
    else fail "Invalid index #{idx}"
    end
  end

  def to_a
    [x, y, z]
  end

  def +(other)
    Vec3.new(x + other[0], y + other[1], z + (other[2] || 0))
  end

  def -(other)
    Vec3.new(x - other[0], y - other[1], z - (other[2] || 0))
  end

  def -@
    Vec3.new(-x, -y, -z)
  end

  def *(scalar)
    Vec3.new(scalar*x, scalar*y, scalar*z)
  end

  def coerce(operand)
    [self, operand]
  end

  def hash
    to_a.hash
  end

  def ==(other)
    x == other.x && y == other.y && z == other.z
  end

  def inspect
    to_s
  end

  def to_s
    "Vec3[#{x}, #{y}, #{z}]"
  end
end
