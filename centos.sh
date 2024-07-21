#!/bin/bash

echo "Installing setup for CentOS..."
sudo yum install ruby
\curl -sSL https://get.rvm.io | bash -s stable —ruby 
echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
rvm install ruby-3.2.2
rvm use ruby-3.2.2
gem install cucumber -v 9.2.0
gem install selenium-webdriver -v 4.22.0
gem install test-unit -v 1.2.3
echo " *** Setup for centos is done! ***"