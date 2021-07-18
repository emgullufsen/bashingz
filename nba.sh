#!/usr/bin/bash
nprefix="http://data.nba.net"
nbafiley="nba_data1.json"
csp=$(curl -s "$nprefix/10s/prod/v1/today.json" \
	| jq -r '.links.currentScoreboard')
curl -s "$nprefix$csp" > $nbafiley
vts=$(cat $nbafiley | jq -r '.games[0].vTeam.score')
hts=$(cat $nbafiley | jq -r '.games[0].hTeam.score')
printf "Home team: $hts\nAway team: $vts\n"
exit 0;
