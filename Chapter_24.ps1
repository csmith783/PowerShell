# Get all files on your computer that are from microsoft and have a 2 digit number in the file name. 
gci -Recurse | where { $_.Name -match '\d{2}' }

# Find all process runnning on your computer that are from Microsoft, and Display their ProcessID, Name, and Company Name. 
gps | ? {$_.Company -match '^microsoft' } | Select -Property Id, Name, Company

# In the Windows Update Log, c:\Windows, select only the lines where the agent began installing files. 
# Windows logs are not stored in ETW, so you will need to do the following
Get-WindowsUpdateLog # This will extract all of the logs and place them on your desktop in atext file. 
cat .\WindowsUpdate.log | sls -Pattern '\*[\s]+START[\s]+\*\s+Installing'

# Using the get-dnsclientcache cmdlet, display all entries where the data property is an IPv4 address
Get-DnsClientCache | ? { $_.Data -match '\d{1,3}\.\d{1,3}\.\d{1,3}' } | select Data