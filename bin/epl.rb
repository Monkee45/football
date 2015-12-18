require_relative '../lib/football/team'
require_relative '../lib/football/league'

epl = Football::League.new('epl', 20, 'Barclays','August', 'May')
arsenal = Football::Team.new('arsenal', 'gunners')
mancity = Football::Team.new('manchester city', 'sky blues')
astonvilla = Football::Team.new('aston villa', 'villans')
blackburn = Football::Team.new('blackburn rovers', 'rovers')
birmingham = Football::Team.new('birmingham city', 'blues')
blackpool = Football::Team.new('blackpool', 'seasiders')
bolton = Football::Team.new('bolton wanderers', 'trotters')
chelsea = Football::Team.new('chelsea', 'pensioners')

arsenal.import_from_csv('./arsenal_players.csv')
arsenal.show_players

mancity.import_from_csv('./mancity_players.csv')
mancity.show_players

epl.add_team(mancity)
epl.add_team(arsenal)
epl.add_team(astonvilla)
epl.add_team(blackburn)
epl.add_team(birmingham)
epl.add_team(blackpool)
epl.add_team(bolton)
epl.add_team(chelsea)

epl.show_league_teams

epl.play

epl.season_ladder
