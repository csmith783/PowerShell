# Use write-output to display the results of 100 * 10
Write-Output (100*10)

# Use write-host to display the results of 100 * 10
Write-Host (100*10)

# prompt the user to enter a name and then display the name in yellow text
$name = Read-Host "Please enter your name" 
Write-Host $name -ForegroundColor Yellow

# Prompt the user to enter a name, and then display the name only if its longer than 5 charachters. do this with a single powershell expression, don't use a variable
Read-Host "Please enter your name"  | where { $_.Length -gt 5 }