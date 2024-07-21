# hudl-login

To install Ruby on Windows using the Command Line Interface (CLI), follow these steps:

Step 1: Install a Package Manager (Chocolatey)
Chocolatey is a package manager for Windows that simplifies the installation process. If you don't have Chocolatey installed, follow these steps:

Open PowerShell as an Administrator.

Run the following command to install Chocolatey:

powershell
Copy code
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Step 2: Install Ruby using Chocolatey
Once Chocolatey is installed, you can use it to install Ruby:

Open Command Prompt or PowerShell as an Administrator.

Run the following command to install Ruby:

powershell
Copy code
choco install ruby
Follow any prompts that appear to complete the installation.

Step 3: Verify the Installation
After the installation is complete, verify that Ruby is installed correctly by checking its version:

Open a new Command Prompt or PowerShell window (this is important to refresh the environment variables).

Run the following command:

sh
Copy code
ruby -v
