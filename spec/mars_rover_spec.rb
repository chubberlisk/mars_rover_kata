require_relative '../lib/mars_rover'

describe MarsRover do
  subject { MarsRover.new({ x: 0, y: 0 }, :north) }

  it 'takes an initial starting position and direction' do
    expect(MarsRover).to respond_to(:new).with(2).arguments
  end

  it 'sets initial starting position to current position' do
    expect(subject.position).to eq({ x: 0, y: 0 })
  end

  it 'sets initial facing direction to current direction' do
    expect(subject.direction).to eq(:north)
  end

  describe 'moves forward' do
    context 'starting from (0, 0) and facing north' do
      it 'once' do
        subject.move(['f'])
        expect(subject.position).to eq({ x: 0, y: 1 })
        expect(subject.direction).to eq(:north)
      end

      it 'twice' do
        subject.move(['f', 'f'])
        expect(subject.position).to eq({ x: 0, y: 2 })
        expect(subject.direction).to eq(:north)
      end

      it 'for any given number of forward commands' do
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: 0, y: num_of_forwards })
        expect(subject.direction).to eq(:north)
      end
    end

    context 'starting from random (x, y) and facing north' do
      it 'for any given number of forward commands' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x, y: y + num_of_forwards })
        expect(subject.direction).to eq(:north)
      end
    end

    context 'starting from random (x, y) and facing east' do
      it 'for any given number of forward commands' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :east)
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x + num_of_forwards, y: y })
        expect(subject.direction).to eq(:east)
      end
    end

    context 'starting from random (x, y) and facing south' do
      it 'for any given number of forward commands' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :south)
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x, y: y - num_of_forwards })
        expect(subject.direction).to eq(:south)
      end
    end

    context 'starting from random (x, y) and facing west' do
      it 'for any given number of forward commands' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :west)
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x - num_of_forwards, y: y })
        expect(subject.direction).to eq(:west)
      end
    end
  end

  describe 'moves backward' do
    context 'starting from (0, 0) and facing north' do
      it 'once' do
        subject.move(['b'])
        expect(subject.position).to eq({ x: 0, y: -1 })
        expect(subject.direction).to eq(:north)
      end

      it 'twice' do
        subject.move(['b', 'b'])
        expect(subject.position).to eq({ x: 0, y: -2 })
        expect(subject.direction).to eq(:north)
      end

      it 'for any given number of backward commands' do
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: 0, y: -num_of_backwards })
        expect(subject.direction).to eq(:north)
      end
    end

    context 'starting from random (x, y) and facing north' do
      it 'for any given number of backward commands' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x, y: y - num_of_backwards })
        expect(subject.direction).to eq(:north)
      end
    end

    context 'starting from random (x, y) and facing east' do
      it 'for any given number of backward commands' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :east)
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x - num_of_backwards, y: y })
        expect(subject.direction).to eq(:east)
      end
    end

    context 'starting from random (x, y) and facing south' do
      it 'for any given number of backward commands' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :south)
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x, y: y + num_of_backwards })
        expect(subject.direction).to eq(:south)
      end
    end

    context 'starting from random (x, y) and facing west' do
      it 'for any given number of forward commands' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :west)
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x + num_of_backwards, y: y })
        expect(subject.direction).to eq(:west)
      end
    end
  end

  describe 'moves right' do
    context 'starting from random (x, y) and facing north' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before { subject.instance_variable_set(:@position, { x: x, y: y }) }

      it 'once' do
        subject.move(['r'])
        expect(subject.direction).to eq(:east)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'twice' do
        subject.move(['r', 'r'])
        expect(subject.direction).to eq(:south)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'thrice' do
        subject.move(['r', 'r', 'r'])
        expect(subject.direction).to eq(:west)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'four times' do
        subject.move(['r', 'r', 'r', 'r'])
        expect(subject.direction).to eq(:north)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) and facing east' do
      it 'once' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :east)
        subject.move(['r'])
        expect(subject.direction).to eq(:south)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) and facing south' do
      it 'once' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :south)
        subject.move(['r'])
        expect(subject.direction).to eq(:west)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) and facing west' do
      it 'once' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :west)
        subject.move(['r'])
        expect(subject.direction).to eq(:north)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end
  end

  describe 'moves left' do
    context 'starting from random (x, y) and facing north' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before { subject.instance_variable_set(:@position, { x: x, y: y }) }

      it 'once' do
        subject.move(['l'])
        expect(subject.direction).to eq(:west)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'twice' do
        subject.move(['l', 'l'])
        expect(subject.direction).to eq(:south)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'thrice' do
        subject.move(['l', 'l', 'l'])
        expect(subject.direction).to eq(:east)
        expect(subject.position).to eq({ x: x, y: y })
      end

      it 'four times' do
        subject.move(['l', 'l', 'l', 'l'])
        expect(subject.direction).to eq(:north)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) and facing east' do
      it 'once' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :east)
        subject.move(['l'])
        expect(subject.direction).to eq(:north)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) and facing south' do
      it 'once' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :south)
        subject.move(['l'])
        expect(subject.direction).to eq(:east)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end

    context 'starting from random (x, y) and facing west' do
      it 'once' do
        x = rand(-100..100)
        y = rand(-100..100)
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :west)
        subject.move(['l'])
        expect(subject.direction).to eq(:south)
        expect(subject.position).to eq({ x: x, y: y })
      end
    end
  end

  describe 'moves using a mixture of commands' do
    context 'starting from (0, 0) and facing north' do
      it 'e.g. f, f, b, b' do
        subject.move(['f', 'f', 'b', 'b'])
        expect(subject.position).to eq({ x: 0, y: 0 })
        expect(subject.direction).to eq(:north)
      end

      it 'e.g. b, b, b, f' do
        subject.move(['b', 'b', 'b', 'f'])
        expect(subject.position).to eq({ x: 0, y: -2 })
        expect(subject.direction).to eq(:north)
      end

      it 'e.g. r, r, l, l' do
        subject.move(['r', 'r', 'l', 'l'])
        expect(subject.position).to eq({ x: 0, y: 0 })
        expect(subject.direction).to eq(:north)
      end

      it 'e.g. l, l, l, r' do
        subject.move(['l', 'l', 'l', 'r'])
        expect(subject.position).to eq({ x: 0, y: 0 })
        expect(subject.direction).to eq(:south)
      end

      it 'e.g. b, r, f, l, f, f' do
        subject.move(['b', 'r', 'f', 'l', 'f', 'f', 'l'])
        expect(subject.position).to eq({ x: 1, y: 1 })
        expect(subject.direction).to eq(:west)
      end

      it 'e.g. f, r, f, r, b, l,' do
        subject.move(['f', 'r', 'f', 'r', 'b', 'l'])
        expect(subject.position).to eq({ x: 1, y: 2 })
        expect(subject.direction).to eq(:east)
      end
    end
  end
end