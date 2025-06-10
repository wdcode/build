export GPG_TTY=$(tty)
mvn clean deploy -Prelease -Dgpg.passphrase=$1
