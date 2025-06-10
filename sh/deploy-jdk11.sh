export GPG_TTY=$(tty)
mvn clean install deploy -Prelease,jdk11 -Dgpg.passphrase=$1
