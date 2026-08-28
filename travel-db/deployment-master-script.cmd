@echo off
setlocal

sqlcmd -S "(localdb)\MSSQLLocalDB" -E -b -i "%~dp0deployment-master-script.sql"
