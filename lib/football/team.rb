require_relative 'player'
require 'CSV'

module Football
  class Team

    attr_reader :name
    attr_reader :nickname
    attr_reader :players
    attr_reader :season_points
    attr_reader :goals_for

    def initialize (name, nickname)
      @name = name.split.map(&:capitalize).join(' ')
      @nickname = nickname.split.map(&:capitalize).join(' ')
      @players = []
      @game_wins = 0
      @game_losses = 0
      @game_draws = 0
      @goals_for = 0
      @goals_against = 0
      @season_points = 0
    end

    def end_season
      "#{@name.ljust(30,' ')} #{@game_wins.to_s.center(10,' ')}  #{@game_losses.to_s.center(10,' ')}  #{(@game_draws).to_s.center(10,' ')}#{@goals_for.to_s.center(15,' ')}  #{@goals_against.to_s.center(15,' ')}  #{(@goals_for - @goals_against).to_s.center(15,' ')} #{@season_points.to_s.center(15,' ')}"
    end

    def record_result (g_for, g_against)
      @goals_for += g_for
      @goals_against += g_against
    end

    def add_player(player)
      @players << player
    end

    def wins
      @game_wins += 1
      @season_points += 3
      "Win for #{@name}!"
    end

    def loses
      @game_losses += 1
      "Loss for #{@name}!"
    end

    def draw
      @game_draws +=1
      @season_points +=1
      "#{@name} has a draw"
    end

    def score
      rand(0..6)
    end

    def to_s
      "#{@name} (#{@nickname})"
    end

    def show_players
      puts "\n#{@name}'s playing list consists of:"
      @players.each do |player|
        puts player
      end
    end

# import_from_csv
# - takes a csv file as a parameter
# - reads the csv file into an array of arrays
# - loops through each element/player in the array
#     - creates player object
#     - adds the player object to a team by call add_player
    def import_from_csv(player_file)
        player_list = CSV.read(player_file)
        player_list.each do |plyr|
          player = Player.new(plyr[0], plyr[1])
          add_player(player)
        end
    end

  end #Team

  if __FILE__ ==$PROGRAM_NAME
    gunners = Team.new('arsenal','gunners')
    player1 = Player.new('tommy','12')
    gunners.add_player(player1)

    puts player1
    puts player1.name
    puts player1.number

  end
end #Football
