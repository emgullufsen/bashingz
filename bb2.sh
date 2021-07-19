#!/usr/bin/bash

#filey=data_bb2.json
keyey=$(cat key_bb2.key)
urley=sportspage-feeds.p.rapidapi.com
curl --request GET \
	--url https://${urley}/games \
	--header "x-rapidapi-host: ${urley}" \
	--header "x-rapidapi-key: ${keyey}" |
	#-o ${filey}
jq -rc '.results[] | 
	[.teams.home.team, .scoreboard.score.home, 
	 .teams.away.team, .scoreboard.score.away] | @tsv' | \
	#$filey | \
awk -F'\t' '{ print "Home Team: ", $1, " - Away Team: ", $3; }'
