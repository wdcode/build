find / -name ".DS_Store" -depth -exec rm -f {} \;
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
find / -name ".DS_Store" -type f -delete
