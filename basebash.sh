#!/usr/bin/bash
filey="basebash_data.json"
datey=$(date +%F)
curl --request GET \
	--url "https://api-baseball.p.rapidapi.com/games?date=${datey}" \
	--header 'x-rapidapi-host: api-baseball.p.rapidapi.com' \
	--header 'x-rapidapi-key: db96f2fc0emshaf33007386630a2p16e5fbjsn09ecad2e38ae' \
	-o $filey
jq -r '.response | .[] | select(.league.name == "MLB") | .teams.home.name' $filey
