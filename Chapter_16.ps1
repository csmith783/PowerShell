# What method of a ServiceController object with  pause the service without stopping it completely?
Get-Service | Get-Member -MemberType Method
# There is a Pause() method. 

# What method of a process object would terminate a given process?
Get-Process | Get-Member -MemberType Method
# There is a kill() method

# What emthod of a WMI Win32_Process object would terminate a given process?
Get-CimClass -ClassName Win32_Process | Get-Member -MemberType Method | fl *
# I only see a Dispose method, I do not see the terminate method tht is refferenced in the book.

# Write 4 commands that could be used to terminate all processes named notepad, assuming that multiple processes might be running under that name. 
Get-Process -Name notepad | Stop-Process
Stop-Process -Name notepad
Get-WmiObject -Class Win32_Process -filter {name='notepad.exe'} | Invoke-WmiMethod -Name Terminate
Get-Process -Name notepad | % {$_.Kill()}

# Assume you ahve a text file of all computer names, you want to dsiplay them all in uppercase. What would you do?
cat server_names.txt | % { $_.ToUpper() } 
