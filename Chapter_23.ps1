# Create a remoting endpoint on your localhost named TestEndpoint. COnfigure to load SMBShare Module atuomatically. 
# Only allow the get-smbshare cmdlet to be visible. Ensure key cmdlets are availible like Exit-pssession
New-PSSessionConfigurationFile -Path TestEndpoint.pssc -SessionType RestrictedRemoteServer -ModulesToImport SmbShare -VisibleCmdlets Get-SmbShare -Description "Restricted SMB Share Endpoint."

# Register the Configuration file
Register-PSSessionConfiguration -Path TestEndpoint.pssc -Name TestEndpoint

# Enter the session
Enter-PSSession -ComputerName LocalHost -ConfigurationName TestEndpoint