#Enable PowerShell scripts
Set-ExecutionPolicy remotesigned

#Install tooling
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco /?
choco feature enable -n=allowGlobalConfirmation
cinst googlechrome
cinst VisualStudioCode
cinst git
cinst kdiff3
cinst lockhunter
cinst 7zip
cinst cmder

#Setup Git
git config --global user.email "pawelizycki@gmail.com"
git config --global user.name "Paweł Iżycki"

#Open fiewall ports
netsh advfirewall firewall add rule name="Open Port 80" dir=in action=allow protocol=TCP localport=8080

#Setup workspace
mkdir C:\dev
git clone https://github.com/pizycki/RavenCage-3.5 C:\dev\RavenCage-35
git clone https://github.com/pizycki/RavenCage C:\dev\RavenCage
git clone https://github.com/pizycki/RavenCage-4.0 C:\dev\RavenCage-40

#Install Windows Containers
Install-WindowsFeature containers
Restart-Computer -Force

#Install and start Docker
Invoke-WebRequest "https://download.docker.com/components/engine/windows-server/cs-1.12/docker-1.12.2.zip" -OutFile "$env:TEMP\docker.zip" -UseBasicParsing
Expand-Archive -Path "$env:TEMP\docker.zip" -DestinationPath $env:ProgramFiles
#For quick use, does not require shell to be restarted.
$env:path += ";c:\program files\docker"
#For persistent use, will apply even after a reboot. 
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Docker", [EnvironmentVariableTarget]::Machine)
dockerd.exe --register-service
Start-Service docker