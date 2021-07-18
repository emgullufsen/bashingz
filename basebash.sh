#!/usr/bin/bash

filey="basebash_data.json"
datey=$(date +%F)
keyey=$(cat .baseball-key)
urley="api-baseball.p.rapidapi.com"

curl --request GET \
	--url "https://${urley}/games?date=${datey}" \
	--header "x-rapidapi-host: ${urley}" \
	--header "x-rapidapi-key: ${keyey}" \
	-o $filey
jq -r '.response | .[] | select(.league.name == "MLB") | .id, .teams.home.name, .teams.away.name' $filey
