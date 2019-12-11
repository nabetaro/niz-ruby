RSpec.describe Niz::Keyboard do
  let(:engine) do
    e = double('HIDAPI engine')
    allow(e).to receive(:open).and_return device
    e
  end
  let(:device) do
    d = double('HIDAPI device')
    allow(d).to receive(:write)
    allow(d).to receive(:read)
    d
  end
  before do
    allow(HIDAPI).to receive(:engine).and_return engine
    allow(HIDAPI).to receive(:open).and_return device
  end

  context 'Niz::Keyboard.new' do
    subject{Niz::Keyboard.new}
    let(:command){ String.new("\0\xF9"+ "\0" * 62, encoding: 'BINARY') }
    it 'returns new instance' do
      expect(subject).to be_an_instance_of(Niz::Keyboard)
    end
    it 'sends version command' do
      expect(device).to receive(:write).with(command)
      subject
    end
  end


end
