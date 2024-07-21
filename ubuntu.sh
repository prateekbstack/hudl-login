#!/bin/bash

echo "Installing setup for Ubuntu..."
sudo apt-get install ruby-full
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
sudo usermod -a -G rvm $USER
echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc
rvm install ruby-3.2.2
rvm use ruby-3.2.2
gem install cucumber -v 9.2.0
gem install selenium-webdriver -v 4.22.0
gem install test-unit -v 1.2.3
echo " *** Setup for ubuntu is done! ***"