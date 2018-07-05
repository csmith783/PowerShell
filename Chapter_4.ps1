# Display a list of running processes
Get-Process
gps
ps

# Show 100 most recent application events
Get-EventLog -LogName Application -Newest 100

# Display alist of cmdlets that are of the cmdlet type
Get-Command -Type Cmdlet

# Display a list of all aliases
Get-Alias

# Make a new alias, for 'np' to launch notepad
New-Alias -Name np -Value notepad

# Display all services that start with 'M'
Get-Service -Name "M*"

# Display a list of all network firewall rules
gcm *firewall*
Get-NetFirewallRule

# Display a list of inbound firewall rules
help Get-NetFirewallRule -ShowWindow
Get-NetFirewallRule -Direction Inbound