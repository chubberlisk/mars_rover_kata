require_relative '../lib/mars_rover'

describe MarsRover do
  subject { MarsRover.new([0, 0], :north) }

  it 'takes an initial starting position and direction' do
    expect(MarsRover).to respond_to(:new).with(2).arguments
  end

  it 'sets initial starting position to current position' do
    expect(subject.position).to eq([0, 0])
  end

  it 'sets initial facing direction to current direction' do
    expect(subject.direction).to eq(:north)
  end
end