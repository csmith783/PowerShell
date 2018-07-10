# Display a table of processes that includes only the process names, iDs and whether they are responding to Windows. have the table take up as little room as possible, but don't allow info to be truncated
Get-Process | ft -Property Name, ID, Responding -AutoSize -Wrap

# Display atable of processes that includes the name and ID, also include columns for virtual memory and physical memory usage, expressed in MB
Get-Process | Select-Object ID, Name, @{l='VM (MB)';e={$_.VM / 1MB -as [int]}}, @{l='PM (MB)';e={$_.PM / 1MB -as [int]}}

# Use Event-log to display alist of available event logs
Get-EventLog -list | Select Log, @{l='RetDays';e={$_.MinimumRetentionDays}}

# Display alist of services so that a seperate table is displayed for services that are started and services that are stopped. services that are started should be displayed first
gsv | sort Status -Descending | ft -GroupBy Status

# display a 4 coumn wide list of all directories in the root of the c drive
gci C:\ | fw -Column 4

# Create a formatted list of all .exe files in C:\Windows. Display name, version info, and file size. 
dir C:\Windows -Name "*.exe" | fl Name, VersionInfo, @{l='Size';e={$_.length}}
# Still looking to see how this one works, I do not see the 'VersionInfo' Property when I pipe the gci/dir cmd to get-member