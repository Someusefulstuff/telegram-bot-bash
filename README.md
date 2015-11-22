#bashbot

This is a [Telegram bot written in bash](https://github.com/ryzhovau/telegram-bot-bash), running on home router.

## Installation

* Install [Entware-ng](https://github.com/Entware-ng/Entware-ng),
* Ask [BotFather](https://web.telegram.org/#/im?p=@BotFather) to make a new bot,
* Install necessary dependencies:
```
opkg install bash curl dtach
```
* Download bot binaries and start script:
```
curl --output /opt/bin/bashbot.sh --insecure https://raw.githubusercontent.com/ryzhovau/telegram-bot-bash/master/opt/bin/bashbot.sh
curl --output /opt/bin/JSON.sh --insecure https://raw.githubusercontent.com/ryzhovau/telegram-bot-bash/master/opt/bin/JSON.sh
curl --output /opt/etc/init.d/S51bashbot  --insecure https://raw.githubusercontent.com/ryzhovau/telegram-bot-bash/master/opt/etc/init.d/S51bashbot
chmod +x /opt/bin/bashbot.sh
chmod +x /opt/bin/JSON.sh
chmod +x /opt/etc/init.d/S51bashbot
```
* Insert bot's token to access the HTTP API to `TOKEN` constant at `/opt/bin/bashbot.sh`
* Run bot by typing:
```
/opt/etc/init.d/S51bashbot start
```

Have fun! Add new possibilities to bot as you wish, chat with [ironkakadu_bot](https://web.telegram.org/#/im?p=@ironkakadu_bot) - a running instance of bashbot.