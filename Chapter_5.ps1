# Navigate to the HKEY_CURRENT_USER\software\microsoft\Windows\currentversion\explorer hive and set the 'Advanced' key to have a 'DontPrettyPrint' value of 1
cd HKCU:
cd HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer
cd advanced
Set-ItemProperty -Path . -name DontPrettyPrint -value 1

# Create a new directory called "c:\Labs"
mkdir c:\Labs

# Create azero length file in "C:\Labs\Test.txt" (use new-item cmdlet)
New-Item -Path . -ItemType File -Name "Test.txt"

# Can you use the set item cmdlet to change the name of Test.txt to Testing.txt? 
# Set-Item : Provider operation stopped because the provider does not support this operation.

# Using the Environment provider, display the value of the system environment %TEMP%
dir env:temp

# What are the differences between the -Filter, -Include, -Exclude parameters of get-item
man Get-ChildItem -ShowWindow
# Filter: Specifies a filter in the providers language or format
# Include: Specifies, as a string array, an item that this cmdlet includes in the operation.
# Exclude: Specifies, as a string array, an item or items that this cmdlet excludes in the operation

