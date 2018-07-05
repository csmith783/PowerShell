# Update Help System
# Must be in admin prompt
Update-Help

# Find any commandlets that have the abilty to convert output into HTML
help *html*
gcm -Noun *html*

# Are there any commands that can redirect output to a file or printer
Get-Command -noun file, printer

# How many commands can work with processes
gcm -noun *process*

# What cmdlets can write to an event log
gcm -verb write -noun *log*
get-command -verb write -noun eventlog

# What cmdlets work with aliases
get-command -noun *alias*

# Can you keep atranscript of what is done in the shell and write that to a file
gcm -noun transcript

# Get the 100 most recent entries from the security event log
help Get-EventLog -Parameter newest
Get-EventLog -LogName Security -Newest 100

# Can we retreie services on a remote computer
man gsv -Parameter computername

# Can we see process running on a remote computer
man gps -Parameter computername

# Reviewing the ou-file help, is there a parameter that allows us to change the default width 
man Out-File -Parameter *width*
# Default is 80
help out-file -Full
man out-file -ShowWindow

# What out-file parameter prevents overwritting a file
man out-file -Full
# -noclobber

# Show all defined aliases
Get-Alias

# using aliases, what is the shortest command to get processes forma server1
Get-Alias -Definition Get-Process
gps -c server1
ps -c server1

# How many generic commands can deal with objects
help *object*

# Where can you read about arrays
help *array*
# Topic: about_Arrays
