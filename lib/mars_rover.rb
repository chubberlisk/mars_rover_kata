class MarsRover
  MOVEMENT = {
    :north => { 'f' => [:y, 1], 'b' => [:y, -1] },
    :east => { 'f' => [:x, 1], 'b' => [:x, -1] },
    :south => { 'f' => [:y, -1], 'b' => [:y, 1] },
    :west => { 'f' => [:x, -1], 'b' => [:x, 1] }
  }.freeze

  ROTATIONS = {
    :north => { 'l' => :west, 'r' => :east },
    :east => { 'l' => :north, 'r' => :south },
    :south => { 'l' => :east, 'r' => :west },
    :west => { 'l' => :south, 'r' => :north }
  }.freeze

  attr_reader :position, :direction, :obstacle

  def initialize(starting_position, facing_direction, grid)
    @position = starting_position
    @direction = facing_direction
    @grid = grid
  end

  def move(commands)
    commands.each do |command|
      if command == 'f' || command == 'b'
        axis, change = MOVEMENT[@direction][command]
        next_position = @position.clone
        next_position[axis] += change
        next_position[axis] = @grid[:size][axis] if next_position[axis] < 0
        next_position[axis] = 0 if next_position[axis] > @grid[:size][axis]
        if @grid[:obstacles].include?(next_position)
          @obstacle = next_position
          puts "Obstacle found at #{@obstacle}."
          break
        else
          @position = next_position
        end
      else
        @direction = ROTATIONS[@direction][command]
      end
    end
  end
end