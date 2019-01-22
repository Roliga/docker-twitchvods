#!/bin/sh

set -e

if [ -z "$INTERVAL_SECONDS" ]; then
	INTERVAL_SECONDS=300
fi

while true; do
	dotnet /opt/twitchvods/TwitchVods.Core.dll

	echo "
<html>
	<head>
		<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css\" integrity=\"sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb\" crossorigin=\"anonymous\">
	</head>
	<body>
		<div class=\"jumbotron\">
			<h1>TwitchVods</h1>
		</div>
		<div class=\"container-fluid\">
			<table class=\"table\">
				<thead>
					<tr><th scope=\"col\">Channel</th></tr>
				</thead>
				<tbody>
$(
	while read -r channel; do
		case "$channel" in //*) continue ;; esac
		echo "<tr class=\"table-primary\"><td><a href=$channel.html>$channel</a></td></tr>"
	done </opt/twitchvods/channels.txt
)
				</tbody>
			</table>
		</div>
	</body>
</html>
	" >/srv/twitchvods/index.html

	echo "Build complete, waiting $INTERVAL_SECONDS seconds.." >&2
	sleep $INTERVAL_SECONDS
done
