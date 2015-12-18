require 'football/player'

module Football
  describe 'Player' do
    before do
      @roberto = Player.new('roberto sanchez','14')
    end

    describe '#new' do
      it 'takes parameters and returns a Player object' do
        expect(@roberto).to be_an_instance_of Player
      end

      it 'sets a capitalized value for name' do
        expect(@roberto.name).to eq('Roberto Sanchez')
      end

      it 'sets a number for the player' do
        expect(@roberto.number).to eq('14')
      end
    end #new

    describe '#to_s' do
      it 'retuns a formatted string' do
        expect(@roberto.to_s).to eq('14. Roberto Sanchez')
      end
    end #to_s
  end #Player
end #module
