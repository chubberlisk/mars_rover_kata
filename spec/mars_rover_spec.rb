require_relative '../lib/mars_rover'

describe MarsRover do
  let(:grid) { { size: { x: 10, y: 10 }, obstacles: [] } }

  subject { MarsRover.new({ x: 0, y: 0 }, :north, grid) }

  before { allow(STDOUT).to receive(:write) }  # suppress output

  it 'takes an initial starting position, direction and grid size' do
    expect(MarsRover).to respond_to(:new).with(3).arguments
  end

  it 'sets initial starting position to current position' do
    expect(subject.position).to eq({ x: 0, y: 0 })
  end

  it 'sets initial facing direction to current direction' do
    expect(subject.direction).to eq(:north)
  end

  it 'sets grid to current grid' do
    expect(subject.instance_variable_get(:@grid)).to eq(grid)
  end

  describe 'moves forward' do
    before { subject.instance_variable_set(:@position, { x: 5, y: 5 }) }

    context 'starting from (5, 5) while facing north' do
      it 'returns (5, 6) as its current position for a single forward command' do
        subject.move(['f'])
        expect(subject.position).to eq({ x: 5, y: 6 })
        expect(subject.direction).to eq(:north)
      end

      it 'returns (5, 8) as its current position for multiple forward commands' do
        subject.move(['f', 'f', 'f'])
        expect(subject.position).to eq({ x: 5, y: 8 })
        expect(subject.direction).to eq(:north)
      end
    end

    context 'starting from (5, 5) while facing east' do
      it 'returns (8, 5) as its current position for multiple forward commands' do
        subject.instance_variable_set(:@direction, :east) 
        subject.move(['f', 'f', 'f'])
        expect(subject.position).to eq({ x: 8, y: 5 })
        expect(subject.direction).to eq(:east)
      end
    end

    context 'starting from (5, 5) while facing south' do
      it 'returns (5, 2) as its current position for multiple forward commands' do
        subject.instance_variable_set(:@direction, :south) 
        subject.move(['f', 'f', 'f'])
        expect(subject.position).to eq({ x: 5, y: 2 })
        expect(subject.direction).to eq(:south)
      end
    end

    context 'starting from (5, 5) while facing west' do
      it 'returns (2, 5) as its current position for multiple forward commands' do
        subject.instance_variable_set(:@direction, :west) 
        subject.move(['f', 'f', 'f'])
        expect(subject.position).to eq({ x: 2, y: 5 })
        expect(subject.direction).to eq(:west)
      end
    end
  end

  describe 'moves backward' do
    before { subject.instance_variable_set(:@position, { x: 5, y: 5 }) }

    context 'starting from (5, 5) while facing north' do
      it 'returns (5, 4) as its current position for a single backward command' do
        subject.move(['b'])
        expect(subject.position).to eq({ x: 5, y: 4 })
        expect(subject.direction).to eq(:north)
      end

      it 'returns (5, 2) as its current position for multiple backward commands' do
        subject.move(['b', 'b', 'b'])
        expect(subject.position).to eq({ x: 5, y: 2 })
        expect(subject.direction).to eq(:north)
      end
    end

    context 'starting from (5, 5) while facing east' do
      it 'returns (2, 5) as its current position for multiple backward commands' do
        subject.instance_variable_set(:@direction, :east) 
        subject.move(['b', 'b', 'b'])
        expect(subject.position).to eq({ x: 2, y: 5 })
        expect(subject.direction).to eq(:east)
      end
    end

    context 'starting from (5, 5) while facing south' do
      it 'returns (5, 8) as its current position for multiple backward commands' do
        subject.instance_variable_set(:@direction, :south) 
        subject.move(['b', 'b', 'b'])
        expect(subject.position).to eq({ x: 5, y: 8 })
        expect(subject.direction).to eq(:south)
      end
    end

    context 'starting from (5, 5) while facing west' do
      it 'returns (8, 5) as its current position for multiple backward commands' do
        subject.instance_variable_set(:@direction, :west) 
        subject.move(['b', 'b', 'b'])
        expect(subject.position).to eq({ x: 8, y: 5 })
        expect(subject.direction).to eq(:west)
      end
    end
  end

  describe 'moves right' do
    let(:x) { rand(0..10) }
    let(:y) { rand(0..10) }

    before { subject.instance_variable_set(:@position, { x: x, y: y }) }

    context 'starting from random (x, y) while facing north' do
      it 'returns east for its current direction for a single right command' do
        subject.move(['r'])
        expect(subject.direction).to eq(:east)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'returns south for its current direction for two right commands' do
        subject.move(['r', 'r'])
        expect(subject.direction).to eq(:south)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'returns west for its current direction for three right commands' do
        subject.move(['r', 'r', 'r'])
        expect(subject.direction).to eq(:west)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'returns north for its current direction for four right commands' do
        subject.move(['r', 'r', 'r', 'r'])
        expect(subject.direction).to eq(:north)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) while facing east' do
      it 'returns south for its current direction for a single right command' do
        subject.instance_variable_set(:@direction, :east)
        subject.move(['r'])
        expect(subject.direction).to eq(:south)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) while facing south' do
      it 'returns west for its current direction for a single right command' do
        x = rand(0..10)
        y = rand(0..10)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :south)
        subject.move(['r'])
        expect(subject.direction).to eq(:west)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) while facing west' do
      it 'returns north for its current direction for a single right command' do
        x = rand(0..10)
        y = rand(0..10)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :west)
        subject.move(['r'])
        expect(subject.direction).to eq(:north)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end
  end

  describe 'moves left' do
    context 'starting from random (x, y) while facing north' do
      let(:x) { rand(0..10) }
      let(:y) { rand(0..10) }

      before { subject.instance_variable_set(:@position, { x: x, y: y }) }

      it 'returns west for its current direction for a single left command' do
        subject.move(['l'])
        expect(subject.direction).to eq(:west)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'returns south for its current direction for two left commands' do
        subject.move(['l', 'l'])
        expect(subject.direction).to eq(:south)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'returns east for its current direction for three left commands' do
        subject.move(['l', 'l', 'l'])
        expect(subject.direction).to eq(:east)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'returns north for its current direction for four left commands' do
        subject.move(['l', 'l', 'l', 'l'])
        expect(subject.direction).to eq(:north)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) while facing east' do
      it 'returns north for its current direction for a single left command' do
        x = rand(0..10)
        y = rand(0..10)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :east)
        subject.move(['l'])
        expect(subject.direction).to eq(:north)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) while facing south' do
      it 'returns east for its current direction for a single left command' do
        x = rand(0..10)
        y = rand(0..10)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :south)
        subject.move(['l'])
        expect(subject.direction).to eq(:east)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) while facing west' do
      it 'returns south for its current direction for a single left command' do
        x = rand(0..10)
        y = rand(0..10)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :west)
        subject.move(['l'])
        expect(subject.direction).to eq(:south)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end
  end

  describe 'moves using a mixture of commands' do
    context 'starting from (0, 0) while facing north' do
      it 'returns (0, 0) and facing north for the following commands: f, f, b, b' do
        subject.move(['f', 'f', 'b', 'b'])
        expect(subject.position).to eq({ x: 0, y: 0 })
        expect(subject.direction).to eq(:north)
      end

      it 'returns (0, 0) and facing north for the following commands: r, r, l, l' do
        subject.move(['r', 'r', 'l', 'l'])
        expect(subject.position).to eq({ x: 0, y: 0 })
        expect(subject.direction).to eq(:north)
      end

      it 'returns (0, 0) and facing south for the following commands: l, l, l, r' do
        subject.move(['l', 'l', 'l', 'r'])
        expect(subject.position).to eq({ x: 0, y: 0 })
        expect(subject.direction).to eq(:south)
      end

      it 'returns (1, 1) and facing west for the following commands: b, r, f, l, f, f' do
        subject.move(['b', 'r', 'f', 'l', 'f', 'f', 'l'])
        expect(subject.position).to eq({ x: 1, y: 1 })
        expect(subject.direction).to eq(:west)
      end

      it 'returns (1, 2) and facing south for the following commands: f, r, f, r, b, l,' do
        subject.move(['f', 'r', 'f', 'r', 'b', 'l'])
        expect(subject.position).to eq({ x: 1, y: 2 })
        expect(subject.direction).to eq(:east)
      end
    end
  end

  describe 'moves from one edge of the grid to another' do
    context 'with a grid size of 10 x 10 and starting from (0, 0) i.e. bottom left' do
      it 'returns (0, 10) for its current position when it moves forward once while facing south' do
        subject.instance_variable_set(:@direction, :south)
        subject.move(['f'])
        expect(subject.position).to eq({ x: 0, y: 10 })
        expect(subject.direction).to eq(:south)
      end

      it 'returns (10, 0) for its current position when it moves forward once while facing west' do
        subject.instance_variable_set(:@direction, :west)
        subject.move(['f'])
        expect(subject.position).to eq({ x: 10, y: 0 })
        expect(subject.direction).to eq(:west)
      end
    end

    context 'with a grid size of 10 x 10 and starting from (0, 10) i.e. top left' do
      before { subject.instance_variable_set(:@position, { x: 0, y: 10 }) }

      it 'returns (0, 0) for its current position when it moves forward once while facing north' do
        subject.move(['f'])
        expect(subject.position).to eq({ x: 0, y: 0 })
        expect(subject.direction).to eq(:north)
      end

      it 'returns (10, 10) for its current position when it moves forward once while facing west' do
        subject.instance_variable_set(:@direction, :west)
        subject.move(['f'])
        expect(subject.position).to eq({ x: 10, y: 10 })
        expect(subject.direction).to eq(:west)
      end
    end

    context 'with a grid size of 10 x 10 and starting from (10, 0) i.e. bottom right' do
      before { subject.instance_variable_set(:@position, { x: 10, y: 0 }) }

      it 'returns (10, 10) for its current position when it moves forward once while facing south' do
        subject.instance_variable_set(:@direction, :south)
        subject.move(['f'])
        expect(subject.position).to eq({ x: 10, y: 10 })
        expect(subject.direction).to eq(:south)
      end

      it 'returns (0, 0) for its current position when it moves forward once while facing east' do
        subject.instance_variable_set(:@direction, :east)
        subject.move(['f'])
        expect(subject.position).to eq({ x: 0, y: 0 })
        expect(subject.direction).to eq(:east)
      end
    end

    context 'with a grid size of 10 x 10 and starting from (10, 10) i.e. top right' do
      before { subject.instance_variable_set(:@position, { x: 10, y: 10 }) }

      it 'returns (10, 0) for its current position when it moves forward once while facing north' do
        subject.move(['f'])
        expect(subject.position).to eq({ x: 10, y: 0 })
        expect(subject.direction).to eq(:north)
      end

      it 'returns (0, 10) for its current position when it moves forward once while facing east' do
        subject.instance_variable_set(:@direction, :east)
        subject.move(['f'])
        expect(subject.position).to eq({ x: 0, y: 10 })
        expect(subject.direction).to eq(:east)
      end
    end
  end

  describe 'detects obstacles' do
    context 'starting from (5, 5) while facing north for the following commands: f, f, r' do
      before { subject.instance_variable_set(:@position, { x: 5, y: 5 }) }

      describe 'moves up to the last possible point and aborts the sequence' do
        it 'returns (5, 5) and facing north when obstacle at (5, 6)' do
          subject.instance_variable_set(:@grid, { size: { x: 10, y: 10 }, obstacles: [{ x: 5, y: 6 }] })
          subject.move(['f', 'f', 'r'])
          expect(subject.position).to eq({ x: 5, y: 5 })
          expect(subject.direction).to eq(:north)
        end

        it 'returns (5, 6) and facing north when obstacle at (5, 7)' do
          subject.instance_variable_set(:@grid, { size: { x: 10, y: 10 }, obstacles: [{ x: 5, y: 7 }] })
          subject.move(['f', 'f', 'r'])
          expect(subject.position).to eq({ x: 5, y: 6 })
          expect(subject.direction).to eq(:north)
        end
      end

      describe 'reports the obstacle' do
        it 'returns (5, 6) for found obstacle when obstacle at (5, 6)' do
          subject.instance_variable_set(:@grid, { size: { x: 10, y: 10 }, obstacles: [{ x: 5, y: 6 }] })
          subject.move(['f', 'f', 'r'])
          expect(subject.obstacle).to eq({ x: 5, y: 6 })
        end

        it 'returns (5, 7) for found obstacle when obstacle at (5, 7)' do
          subject.instance_variable_set(:@grid, { size: { x: 10, y: 10 }, obstacles: [{ x: 5, y: 7 }] })
          subject.move(['f', 'f', 'r'])
          expect(subject.obstacle).to eq({ x: 5, y: 7 })
        end
      end
    end
  end
end