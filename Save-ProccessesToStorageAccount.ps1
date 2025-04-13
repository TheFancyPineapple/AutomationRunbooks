# Variables

$outputFileName = "RunningProcesses.txt"
$storageAccountName = "privlabseundevsta"
$containerName = "Processes"
$blobName = "RunningProcesses.txt"


# Main logic 
Write-Output "Script started"

Write-Output "Getting current running processes and saving to file..."
Get-Process | Out-File -FilePath $outputFileName -Encoding UTF8

Write-Output "Connecting to Azure..."
Connect-AzAccount -Identity

Write-Output "Getting Storage Account..."
$storageAccount = Get-AzStorageAccount -Name $storageAccountName
$context = $storageAccount.Context

Write-Output "Uploading file to Azure Storage Account..."
Set-AzStorageBlobContent -File $outputFileName -Container $containerName -Blob $blobName -Context $context

Write-Output "Processes saved and uploaded to Azure Storage Account successfully."

Write-Output "Script ended"
