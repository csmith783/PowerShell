# Create a background job that querries the win32_bios information from 2 computers 
Invoke-Command -ComputerName localhost, localhost -ScriptBlock { Get-WmiObject -Class Win32_BIOS } -AsJob

# Receive the results of the job into a variable
get-job
$results = Receive-Job -id 2

# Display the contents of that variable
$results

# Export the variables contents to a cliXML file
$resulte | Export-Clixml win32_bios.xml