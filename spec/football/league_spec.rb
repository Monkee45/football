require 'football/league'
require 'football/team'

module Football
  describe 'League' do
    before do
      @epl = League.new('epl',20,'Barclays','August', 'May')
      @mancity = Team.new('manchester city','sky blues')
      @arsenal = Team.new('arsenal', 'gunners')
    end

    describe '#new' do
      it 'takes parameters and returns a League object' do
        expect(@epl).to be_an_instance_of League
      end

      it 'sets a value for name' do
        expect(@epl.name).to eq('EPL')
      end

      it 'sets a number of teams' do
        expect(@epl.max_teams).to eq 20
      end

      it 'sets a sponsor value' do
        expect(@epl.sponsor).to eq('Barclays')
      end

      it 'sets a season start' do
        expect(@epl.season_start).to eq('August')
      end

      it 'sets a season end' do
        expect(@epl.season_end).to eq('May')
      end
    end

    describe '#add_teams' do
      it 'can add a Team object' do
        @epl.add_team(@mancity)
        expect(@epl.teams[0].name).to eq('Manchester City')
      end
    end

  end # League
end # module
