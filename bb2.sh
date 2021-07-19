#!/usr/bin/bash

filey=data_bb2.json
keyey=$(cat key_bb2.key)
urley=sportspage-feeds.p.rapidapi.com
curl --request GET \
	--url https://${urley}/games \
	--header "x-rapidapi-host: ${urley}" \
	--header "x-rapidapi-key: ${keyey}" \
	-o ${filey}
jq -rc '.results[] | 
	[.teams.away.team, .scoreboard.score.away, .teams.home.team, 
	.scoreboard.score.home] | @tsv' \
	$filey
