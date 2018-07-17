# Make a 1-1 connection witha a remote computer (localhost); launch notepad.exe
Enter-PSSession -ComputerName localhost
notepad.exe

# Using invoke-command, retreive a list of services that are not started from one or two remote computers. format the results in a wide list 
Invoke-Command -ComputerName localhost, localhost -ScriptBlock { Get-Service | ? { $_.Status -eq "Stopped" }} | fw

# Use invoke-command to get a list of the top 10 processes for virtual memory usage. target 1-2 computers. 
Invoke-Command -ComputerName localhost, localhost -ScriptBlock { Get-Process | sort VirtualMemorySize -Descending | select -First 10 }

# Create a text file taht contains three computer names with one name per line. use invoke-command to retreive the 100 newest application event logs from them 
"localhost", "localhost", "localhost" | Out-File Servers.txt
Invoke-Command -ComputerName (cat .\Servers.txt) -ScriptBlock { Get-EventLog -LogName Application -Newest 100 } 

# Using invoke-command, query 1 or more remote servers to display the properties Product name, editionID, and Current version from the registry key 'HKEY_Local_Machine\Software\Microsft\Windows NT\CurrentVersion\
Invoke-Command -ComputerName localhost -ScriptBlock { Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'} | Select-Object ProductName, EditionID, CurrentVersion