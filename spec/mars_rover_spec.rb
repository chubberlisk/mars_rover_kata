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
      end

      it 'twice' do
        subject.move(['f', 'f'])
        expect(subject.position).to eq({ x: 0, y: 2 })
      end

      it 'for any given number of forward commands' do
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: 0, y: num_of_forwards })
      end
    end

    context 'starting from random (x, y) and facing north' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before { subject.instance_variable_set(:@position, { x: x, y: y }) }

      it 'once' do
        subject.move(['f'])
        expect(subject.position).to eq({ x: x, y: y + 1 })
      end

      it 'twice' do
        subject.move(['f', 'f'])
        expect(subject.position).to eq({ x: x, y: y + 2 })
      end

      it 'for any given number of forward commands' do
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x, y: y + num_of_forwards })
      end
    end

    context 'starting from random (x, y) and facing east' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before do
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :east)
      end

      it 'once' do
        subject.move(['f'])
        expect(subject.position).to eq({ x: x + 1, y: y })
      end

      it 'twice' do
        subject.move(['f', 'f'])
        expect(subject.position).to eq({ x: x + 2, y: y })
      end

      it 'for any given number of forward commands' do
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x + num_of_forwards, y: y })
      end
    end

    context 'starting from random (x, y) and facing south' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before do
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :south)
      end

      it 'once' do
        subject.move(['f'])
        expect(subject.position).to eq({ x: x, y: y - 1 })
      end

      it 'twice' do
        subject.move(['f', 'f'])
        expect(subject.position).to eq({ x: x, y: y - 2 })
      end

      it 'for any given number of forward commands' do
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x, y: y - num_of_forwards })
      end
    end

    context 'starting from random (x, y) and facing west' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before do
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :west)
      end

      it 'once' do
        subject.move(['f'])
        expect(subject.position).to eq({ x: x - 1, y: y })
      end

      it 'twice' do
        subject.move(['f', 'f'])
        expect(subject.position).to eq({ x: x - 2, y: y })
      end

      it 'for any given number of forward commands' do
        num_of_forwards = rand(0..100)
        commands = num_of_forwards.times.map { 'f' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x - num_of_forwards, y: y })
      end
    end
  end

  describe 'moves backward' do
    context 'starting from (0, 0) and facing north' do
      it 'once' do
        subject.move(['b'])
        expect(subject.position).to eq({ x: 0, y: -1 })
      end

      it 'twice' do
        subject.move(['b', 'b'])
        expect(subject.position).to eq({ x: 0, y: -2 })
      end

      it 'for any given number of backward commands' do
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: 0, y: -num_of_backwards })
      end
    end

    context 'starting from random (x, y) and facing north' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before { subject.instance_variable_set(:@position, { x: x, y: y }) }

      it 'once' do
        subject.move(['b'])
        expect(subject.position).to eq({ x: x, y: y - 1 })
      end

      it 'twice' do
        subject.move(['b', 'b'])
        expect(subject.position).to eq({ x: x, y: y - 2 })
      end

      it 'for any given number of backward commands' do
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x, y: y - num_of_backwards })
      end
    end

    context 'starting from random (x, y) and facing east' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before do
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :east)
      end

      it 'once' do
        subject.move(['b'])
        expect(subject.position).to eq({ x: x - 1, y: y })
      end

      it 'twice' do
        subject.move(['b', 'b'])
        expect(subject.position).to eq({ x: x - 2, y: y })
      end

      it 'for any given number of backward commands' do
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x - num_of_backwards, y: y })
      end
    end

    context 'starting from random (x, y) and facing south' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before do
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :south)
      end

      it 'once' do
        subject.move(['b'])
        expect(subject.position).to eq({ x: x, y: y + 1 })
      end

      it 'twice' do
        subject.move(['b', 'b'])
        expect(subject.position).to eq({ x: x, y: y + 2 })
      end

      it 'for any given number of backward commands' do
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x, y: y + num_of_backwards })
      end
    end

    context 'starting from random (x, y) and facing west' do
      let(:x) { rand(-100..100) }
      let(:y) { rand(-100..100) }

      before do
        subject.instance_variable_set(:@position, { x: x, y: y })
        subject.instance_variable_set(:@direction, :west)
      end

      it 'once' do
        subject.move(['b'])
        expect(subject.position).to eq({ x: x + 1, y: y })
      end

      it 'twice' do
        subject.move(['b', 'b'])
        expect(subject.position).to eq({ x: x + 2, y: y })
      end

      it 'for any given number of forward commands' do
        num_of_backwards = rand(0..100)
        commands = num_of_backwards.times.map { 'b' }
        subject.move(commands)
        expect(subject.position).to eq({ x: x + num_of_backwards, y: y })
      end
    end
  end
end