export GPG_TTY=$(tty)
mvn clean install deploy -Prelease,jdk8 -Dgpg.passphrase=$1
