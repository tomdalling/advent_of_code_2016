require 'set'

TURNS = [:north, :east, :south, :west]
DIR_VECS = {
  north: [0, 1],
  east: [1, 0],
  south: [0, -1],
  west: [-1, 0],
}

def turn(dir, current)
  delta = (dir == 'L' ? -1 : 1)
  new_dir_idx = (TURNS.index(current) + delta) % TURNS.size
  TURNS[new_dir_idx]
end

loc = [0, 0]
visited = Set.new << loc.dup
facing = :north
turns = DATA.read.split(',').map(&:strip).map{ |s| [s[0], Integer(s[1..-1])] }
turns.each do |lr, mag|
  facing = turn(lr, facing)
  mag.times do
    loc[0] += DIR_VECS[facing][0]
    loc[1] += DIR_VECS[facing][1]
    if visited.include?(loc)
      p loc, loc.map(&:abs).reduce(0, :+)
      exit
    else
      visited << loc.dup
    end
  end
end

__END__
R4, R1, L2, R1, L1, L1, R1, L5, R1, R5, L2, R3, L3, L4, R4, R4, R3, L5, L1, R5, R3, L4, R1, R5, L1, R3, L2, R3, R1, L4, L1, R1, L1, L5, R1, L2, R2, L3, L5, R1, R5, L1, R188, L3, R2, R52, R5, L3, R79, L1, R5, R186, R2, R1, L3, L5, L2, R2, R4, R5, R5, L5, L4, R5, R3, L4, R4, L4, L4, R5, L4, L3, L1, L4, R1, R2, L5, R3, L4, R3, L3, L5, R1, R1, L3, R2, R1, R2, R2, L4, R5, R1, R3, R2, L2, L2, L1, R2, L1, L3, R5, R1, R4, R5, R2, R2, R4, R4, R1, L3, R4, L2, R2, R1, R3, L5, R5, R2, R5, L1, R2, R4, L1, R5, L3, L3, R1, L4, R2, L2, R1, L1, R4, R3, L2, L3, R3, L2, R1, L4, R5, L1, R5, L2, L1, L5, L2, L5, L2, L4, L2, R3
