require 'football/team'
require 'football/player'

module Football
  describe 'Team' do
    before do
      @mancity = Team.new('manchester city','sky blues')
    end

    describe '#new' do
      it 'takes parameters and returns a Team object' do
        expect(@mancity).to be_an_instance_of Team
      end

      it 'sets a capitalized value for name' do
        expect(@mancity.name).to eq('Manchester City')
      end

      it 'sets a capitalized value for nickname' do
        expect(@mancity.nickname).to eq('Sky Blues')
      end
    end

    describe '#add_player' do
      it 'adds a player to the team' do
        @roberto = Player.new('roberto', '14')
        @mancity.add_player(@roberto)
        expect(@mancity.players[0].name).to eq('Roberto')
      end
    end

    describe '#import_from_csv' do
      it 'imports all entries in a csv file' do
        @mancity.import_from_csv('./spec/football/test_players.csv')
        team_size = @mancity.players.size
        expect(team_size).to eq 3
      end

      it 'adds the first entry' do
        @mancity.import_from_csv('./spec/football/test_players.csv')
        team0 = @mancity.players[0]
        expect(team0.name).to eq 'Roberto'
      end

      it 'adds the second entry' do
        @mancity.import_from_csv('./spec/football/test_players.csv')
        team0 = @mancity.players[1]
        expect(team0.name).to eq 'John Smith'
      end

      it 'adds the third entry' do
        @mancity.import_from_csv('./spec/football/test_players.csv')
        team0 = @mancity.players[2]
        expect(team0.name).to eq 'Alan Rickman'
      end
    end #import from csv

    describe '#wins' do
      it 'prints the winning team' do
        expect(@mancity.wins).to eq('Win for Manchester City!')
      end
    end #wins

    describe '#score' do
      it 'returns a score of at least 0' do
        expect(@mancity.score).to be >= 0
      end

      it 'returns a score of less than 6' do
        expect(@mancity.score).to be <= 6
      end
    end#score

  end #Team
end #Module
