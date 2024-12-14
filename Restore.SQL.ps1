#Alec Farrens #00384632


Start-Process -FilePath "dbcreate.sql" -ArgumentList "$psscriptroot\dbcreate.sql.txt"

try {
Write-Host "Beginning Task For SQL Database"
$sqlServer = "SRV19-PRIMARY\SQLEXPRESS"
$databaseName = "ClientDB"
$table = "client_a_contacts"
    #check if DB exists
    $databaseExists = Invoke-Sqlcmd -ServerInstance $sqlServerInstanceName -Query "SELECT COUNT(*) FROM sys.databases WHERE name = '$databaseName'"

    if ($databaseExists -eq 1) {
        #Delete DB
        Write-Host "The database $databaseName already exists. Commence Deleting"
        Write-Host "Deletion of $databaseName 50% Completed"
        Invoke-Sqlcmd -ServerInstance $sqlServerInstanceName -Query "DROP DATABASE $databaseName"
        Write-Host "Deletion of $databaseName 100% Complete"


    }
    #Create DB
    Write-Host "Creating '$databaseName'"
    Invoke-Sqlcmd -ServerInstance $sqlServerInstanceName -Query "CREATE DATABASE [$databaseName]"



}
catch {
    <#Do this if a terminating exception happens#>
}
    








































