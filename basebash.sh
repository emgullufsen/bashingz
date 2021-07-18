#!/usr/bin/bash

filey="basebash_data.json"
datey=$(date +%F)
keyey="db96f2fc0emshaf33007386630a2p16e5fbjsn09ecad2e38ae"
urley="api-baseball.p.rapidapi.com"

curl --request GET \
	--url "https://${urley}/games?date=${datey}" \
	--header "x-rapidapi-host: ${urley}" \
	--header "x-rapidapi-key: ${keyey}" \
	-o $filey
jq -r '.response | .[] | select(.league.name == "MLB")' $filey
