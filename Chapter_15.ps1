# Create a 1 time background job to find all of the powershell scripts on the C drive. 
Start-Job -ScriptBlock { dir c:\*.ps1 }

# How would you run the command from task q on a group of remote computers
Invoke-Command -ComputerName (cat Servers.txt) -ScriptBlock { dir -Recurse -Filter '*.ps1' } -AsJob

# Create a background job that will get the latest 25 errors from the system event long on your computer and export it to CliXml. You want this job to run every day monday through friday at 6 am so that it is ready the next day
Register-ScheduledJob -Name Errors -ScriptBlock { get-eventlog -LogName System -EntryType Error -Newest 25 | Export-Clixml -Path Errors.xml } -Trigger (New-JobTrigger -DaysOfWeek Monday,Tuesday,Wednesday,Thursday,Friday -At 6am)

# What cmdlet would you use to get the results of a job, and how would you save the results in the job queue
Receive-Job -Id 1 -Keep
