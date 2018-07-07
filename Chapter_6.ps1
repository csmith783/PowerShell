# Create two similar files, but different text. Try comparing them with the Diff Cmdlet
"San Antonio, Texas", "Austin, Texas" | Out-File .\File1.txt
"Austin, Texas" | Out-File .\File2.txt
Diff -ReferenceObject .\File1.txt -DifferenceObject .\File2.txt

# What happens on Windows if you run "Get-Service | Ex[port-csv Services.csv | Out-File" from the console? What happens?
# The data flows through the pipeline, so the data is being exported in the "Export-csv" section, so there is no data flowing into the "out-file" cmdlet
# The book also mentions that if you run out-file without a filename as a parameter, you will get an error

# Besides running "Get-service | stop-service" what is another way of stopping all services
man Get-Service -Full
#Stop-Service -Name *

# What if you want to create a pipe delimeted file instead of comma, what parameter would you use with the export-csv command
man Export-Csv -ShowWindow
gsv | Export-Csv services.csv -Delimiter "|"

# When you create acsv, the first line starte with '#', what if you wanted to ignore it. 
gsv | Export-Csv services.csv -NoTypeInformation

# When running "Export-CliXML" and "Export-Csv", how do you prevent overwriting the existing file? How would you force the user to confirm before overwriting a file
gsv | Export-Csv services.csv -NoClobber
gsv | Export-Csv services.csv -Confirm

# Windows Maintains several regional settings, which include a default list seperato. On U.S. systems, this is a comma. How can you export to CSV and force it to use the default seperator
man Export-Csv -ShowWindow 
gsv | Export-Csv services.csv -UseCulture
