"..\..\Tools\SqlPubWiz\sqlpubwiz.exe" script -C "Server=localhost;Database=Accounts;User Id=user;Password=321;" ..\DB\Accounts_Schema_only.sql -schemaonly -targetserver 2008
rem "..\..\Tools\SqlPubWiz\sqlpubwiz.exe" script -C "Server=localhost;Database=Accounts;Integrated Security=true;" ..\DB\Accounts_Schema_only.sql -schemaonly -targetserver 2008
rem "..\..\Tools\SqlPubWiz\sqlpubwiz.exe" /?
