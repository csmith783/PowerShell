# Close all PSSessions in your Shell
Get-PSSession | Remove-PSSession

# Establish a session to a remote computer, save that session in avariable named $session
$session = New-PSSession -ComputerName localhost

# Use the session variable to establish a 1-1 session. Display a list of processes and then exit
Enter-PSSession -Session $session
Get-Process
Exit-PSSession

# Use the $session variable with the invoke-command to get a list of the services from the remote computer
Invoke-Command -Session $session -ScriptBlock { Get-Service }

# Use get-pssession and invoke-command to get a list of the 20 most recent security event logs from the remote computer
Invoke-Command -ComputerName (Get-PSSession) -ScriptBlock { Get-EventLog -LogName Application -Newest 20 }

# use invoke-command and your $session to load the serermanager module on the remote computer
Invoke-Command -Session $session -ScriptBlock { Import-Module ServerManager } 

# Import the server manager module commands from the remote computer to your computer; add the prefix rem to the imported commands
Import-PSSession -Session $session -Prefix rem -Module ServerManager

# Run the imported get-windowsfeature command
get-RemWindowsFeature

# Close the session that is in your $session variable
Remove-PSSession -Session $session