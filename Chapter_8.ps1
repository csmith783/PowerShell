# Identify a cmdlet that produces arandom number
help *random*
Get-Random

# Identify acmdlet that displays the current date and time
man *date*
Get-Date

# What type of object does the cmdlet from task 2 produce? 
Get-Date | Get-Member
# System.DateTime

# Using get-date, display the current day of the week in a table
Get-Date | select DayOfWeek

# Identify a cmdlet that displays information about installed hotfixes on Windows Systems
man *hotfix*
Get-HotFix

# Display all hotfixes, sorted by date, and dispay only the installation date, the user who installed the hotfix, and the hotfix id
Get-HotFix | sort InstalledOn -Descending | select InstalledOn, InstalledBy, HotFixID

# Repeat task 6, but this time sort the results by the hotfix description, and inclide the description, hotfix id, and the installation date and put the results in an html file
Get-HotFix | Sort Description | Select Description, HotFixID, InstalledOn | ConvertTo-Html | Out-File "Updates.html"

# Display a list of the 50 newest entries form the application event log, sorted by entry date/time with the oldest entry appearing first. Select only the index, time generated, source -save results to a text file. Events with the same time generated should be sorted by index
Get-EventLog -LogName Application -Newest 50 | Sort-Object TimeGenerated, Index | Select Index, TimeGenerated, Source | Out-File "Event_logs.txt"