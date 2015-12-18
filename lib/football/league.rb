require_relative 'team'

module Football
  class League
    attr_reader :name
    attr_reader :max_teams
    attr_reader :sponsor
    attr_reader :season_start
    attr_reader :season_end
    attr_reader :teams

    def initialize(name, max_teams, sponsor, season_start, season_end)
      @name = name.upcase
      @max_teams = max_teams
      @sponsor = sponsor
      @season_start = season_start
      @season_end = season_end
      @teams = []
    end

    def season_ladder
      puts "\n"
      sorted_teams = @teams.sort {|a,b| b.season_points <=> a.season_points}
      puts "#{"Team".ljust(30,' ')} #{"Wins".center(10,' ')}  #{"Losses".center(10,' ')}  #{"Draws".center(10,' ')}#{"Goals For".center(15,' ')}  #{"Goals Against".center(15,' ')}  #{"Goals Difference".center(15,' ')} #{"Points".center(15,' ')}"
      sorted_teams.each do |team|
        puts team.end_season
      end
    end

    def play
      round = 0
      @teams.each do |home|
        round += 1
        puts "\nRound: #{round}"
        @teams.each do |away|
          if home != away
            home_score = home.score
            away_score = away.score
            home.record_result(home_score, away_score)
            away.record_result(away_score, home_score)
            puts "#{home}: #{home_score} - #{away_score} :#{away}"
            if home_score > away_score
              puts home.wins
              puts away.loses
            elsif home_score < away_score
              puts away.wins
              puts home.loses
            else
              puts home.draw
              puts away.draw
            end #if
          end #if
        end #away
      end #home
    end

    def show_league_teams
      puts "\nThe #{@name} Football Competition consists of the following teams:"
      @teams.each do |team|
        puts "#{team.name}"
      end
    end

    def add_team(team)
      @teams << team
    end
  end

  if __FILE__ == $PROGRAM_NAME
    epl = League.new('epl', 20, 'Barclays','August', 'May')
    gunners = Team.new('aresenal', 'gunners')
    puts gunners.name
    puts epl.name
    epl.add_team(gunners)
  end
end
