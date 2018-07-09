# Would the following command work to retrieve a list of installed hotfixes from all computers in the specified domain?
# Get-HotFix -computerName (get-adcomputer -filter * | select-object -expand Name)
# Yes, this would work. The get-hotfix cmdlet's computername parameter is expecting strings. The get-adcomputer cmdlet with the select expand option extracts the name property and returns it as a string

# Would this alternate command work to retrieve the list of hotfixes?
# get-adcomputer -filter * | get-hotfix
# This command would not work. The get-adcomputer cmdlet returns computer objects, there are no parameters for the get-hotfix cmdlet that accept this object type byvalue. So the next step is to try to bind bypropertyname, this will not work because there are no properties from the get-adcomputer that match with get-hotfix

# Will this command work to get all the hotfixes from all computers on the domain
# get-adcomputer -filter * | select-object @l='computername';e={$_.name}} | get-hotfix
# This command will work. it is using the hashtable with the select-object cmdlet to rename the name property to 'computername' so that is can be passed to the get-hotfix name byPropertyName

# Write a command that uses pipeline parameter binding to retrieve a list of running processes from every computer in an AD domain. Don't use parentheses
get-adcomputer -filter * | selct-object @{l='computername';e={$_.name}} | Get-Process 

# Write a command to get all services from every computer in an AD domain; don't use pipeline input, us a parenthetical command
Get-Service -ComputerName (get-adcomputer -filter * | selct -expandproperty name)

# Will this command work? 
# get-adcomputer -filter * | select-object @{l='computername';e={$_.name}} | get-wmiobject -class win32_bios
# No, this will not work. The computername parameter for the cmdlet get-wmiobject does not accept pipelin input
man Get-WmiObject -Parameter computername
 