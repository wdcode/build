export GPG_TTY=$(tty)
mvn -T8 clean install deploy -Prelease,$1 -Dgpg.passphrase=$2
