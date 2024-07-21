# hudl-login

This project is used to automate all test scenarios in the login module of [hudl.com](https://www.hudl.com).  
This uses Ruby Cucumber with Selenium. Please clone this repo and install dependencies.

## Run command for the suite
Make sure you are in the root folder of the project. From there, run the following command.
<pre>
  cucumber --publish
</pre>
The command line output will also have the cucumber report link of the run

**Note: Make sure the dependencies are installed before the suite is run. Please refer below how to install dependencies**

## Install the dependencies in MacOS / Ubuntu / CentOS

The dependencies can be installed in MacOS / Ubuntu / CentOS by running one of the following shell files, named according to the relevant OS.

1. macos.sh
2. ubuntu.sh
3. centos.sh

First, change the permissions of the shell file
```chmod +x <filename>```  
e.g. ```chmod +x macos.sh```  

Then run it  
```./<filename>```  
e.g. ```./macos.sh```

## Install the dependencies in Windows

To install Ruby on Windows using the Command Line Interface (CLI), follow these steps:  

### Step 1: Install a Package Manager (Chocolatey)
Chocolatey is a package manager for Windows that simplifies the installation process. If you don't have Chocolatey installed, follow these steps:  

1. Open PowerShell as an Administrator.
2. Run the following command to install Chocolatey:

<pre>
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
</pre>
### Step 2: Install Ruby using Chocolatey
Once Chocolatey is installed, you can use it to install Ruby:  

1. Open Command Prompt or PowerShell as an Administrator.
2. Run the following command to install Ruby:
<pre>
  choco install ruby --version=2.6.5.1
  choco pin add -n=ruby
</pre>

Follow any prompts that appear to complete the installation.

### Step 3: Install other dependencies
After the Ruby installation is complete, we can install the rest of the dependencies required to run the suite

1. Open a new Command Prompt or PowerShell window (this is important to refresh the environment variables).
2. Run the following commands

<pre>
  gem install cucumber -v 9.2.0
  gem install selenium-webdriver -v 4.22.0
  gem install test-unit -v 1.2.3
</pre>
