$servername=''
$dataSource=''
#$database='Jenkins_sql'
$backupPath="D:\$database.BAK"
$DatabaseFile='C:\sql_jenkins_poc\jenkins_sql_query\'
$AuthenticationMode="Windows"
$sqlUserID=''
$sqlPassword=''


"connected"
$SqlScriptQueries  = get-content -path "C:\Users\SenthilEPVS2017\.jenkins\workspace\sql_project\sql_query.sql"
$connectionDetails = "Provider=sqloledb; " + "Data Source=$dataSource; " + "Integrated Security=SSPI;"
$connection = New-Object System.Data.OleDb.OleDbConnection $connectionDetails
"connection successful"
$connection.open()
"after open"
$cmdSqlScripts = New-Object System.Data.OleDb.OleDbCommand $SqlScriptQueries,$connection
##Get the results of our command into a DataSet object, and close the connection
$daSqlScripts = New-Object System.Data.OleDb.OleDbDataAdapter $cmdSqlScripts  
$dsSqlScripts = New-Object System.Data.DataSet
$daSqlScripts.Fill($dsSqlScripts)
 
$connection.ToString()
$connection.close()
