all_targets += google-chrome

google-chrome: /opt/google/chrome/google-chrome
.PHONY: google-chrome

/opt/google/chrome/google-chrome:
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google.list
	sudo apt-get update
	sudo apt-get install google-chrome-stable
	sudo rm /etc/apt/sources.list.d/google.list # google-chrome adds its own list after instalation - initial list can be removed
