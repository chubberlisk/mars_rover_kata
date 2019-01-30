class InvalidCommandError < RuntimeError
end

class MarsRover
  VALID_COMMANDS = ['f', 'b', 'r', 'l'].freeze

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

  def move!(commands)
    commands.each do |command|
      raise InvalidCommandError, "Invalid command given => #{command}." unless valid_command?(command)
      break if @obstacle
      command.downcase!
      command == 'f' || command == 'b' ? change_position!(command) : @direction = ROTATIONS[@direction][command]
    end
  end

  private

  def change_position!(command)
    axis, change = MOVEMENT[@direction][command]
    next_position = @position.clone
    next_position[axis] += change
    next_position[axis] = @grid[:size][axis] if next_position[axis] < 0
    next_position[axis] = 0 if next_position[axis] > @grid[:size][axis]
    if @grid[:obstacles].include?(next_position)
      @obstacle = next_position
      puts "Obstacle found at #{@obstacle}."
    else
      @position = next_position
    end
  end

  def valid_command?(command)
    VALID_COMMANDS.include?(command) || VALID_COMMANDS.map(&:upcase).include?(command)
  end
end