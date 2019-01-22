docker-twitchvods
-----------------

From [RandomUser99/TwitchVods](https://github.com/RandomUser99/TwitchVods).

Remember to add your Twitch Client ID to settings.json. Example config in settings_EXAMPLE.json.

Paths:

| Path                          | Purpose                                    |
|-------------------------------|--------------------------------------------|
| /opt/twitchvods/              | TwitchVods binary and settings stored here |
| /opt/twitchvods/settings.json | Settings file. Mount an external file here |
| /opt/twitchvods/channels.txt  | Channel list. Mount an external file here  |
| /srv/twitchvods/              | Generated pages are written here           |

Run with for example:

	sudo docker run --rm -it --mount type=bind,source=/host/path/settings.jsodestination=/opt/twitchvods/settings.json --mount type=bind,source=/tmp/twitchvods,destination=/srv/twitchvods --mount type=bind,source=/host/path/channels.txt,destination=/opt/twitchvods/channels.txt --user 1399:1399 roliga/twitchvods
