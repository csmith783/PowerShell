# Run the networking troubleshooting pack, pass in an instance ID, run a web connectivity check and ask for help connecting to a specific web page. 
help *troubleshooting*
Import-Module -Name TroubleshootingPack
man Invoke-TroubleshootingPack -ShowWindow
man Get-TroubleshootingPack -ShowWindow
dir "C:\Windows\diagnostics\system"
$tpack = Get-TroubleshootingPack -Path "C:\Windows\diagnostics\system\Networking"
Invoke-TroubleshootingPack $tpack
# Enter; leaving the Instance ID blank
# 1; for Wb Connectivity
# 2; to connect to a specific site
# https://www.google.com